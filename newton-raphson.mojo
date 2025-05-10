from sys import argv
from memory import memcpy, stack_allocation
from memory.unsafe import Pointer
from utils.index import StaticIntTuple
from tensor import Tensor
from algorithm import vectorize, parallelize
from random import rand
from math import abs, sqrt

# Define struct for tracking convergence info
struct ConvergenceInfo:
    var iterations: Int
    var converged: Bool
    var root: Float32
    var function_value: Float32

    fn __init__(inout self, iterations: Int = 0, converged: Bool = False, 
               root: Float32 = 0.0, function_value: Float32 = 0.0):
        self.iterations = iterations
        self.converged = converged
        self.root = root
        self.function_value = function_value

# Target function: f(x) = x^3 - 2x^2 + 4x - 8
fn f(x: Float32) -> Float32:
    """Sample function with multiple roots."""
    return x*x*x - 2.0*x*x + 4.0*x - 8.0

# Derivative of function: f'(x) = 3x^2 - 4x + 4
fn df(x: Float32) -> Float32:
    """Analytical derivative of the sample function."""
    return 3.0*x*x - 4.0*x + 4.0

# Newton-Raphson kernel for SIMD vectorization
fn newton_raphson_kernel[simd_width: Int](
    x: SIMD[Float32, simd_width], 
    tolerance: Float32, 
    max_iterations: Int
) -> SIMD[Float32, simd_width]:
    """
    Newton-Raphson root-finding algorithm optimized for SIMD execution.
    
    Args:
        x: Initial guess values in SIMD vector
        tolerance: Convergence criterion
        max_iterations: Maximum number of iterations
        
    Returns:
        SIMD vector containing computed roots
    """
    var current_x = x
    var new_x: SIMD[Float32, simd_width]
    var error = SIMD[Float32, simd_width](tolerance + 1.0)
    var iteration = 0
    
    # Create a SIMD mask to track which lanes are still computing
    var active_mask = error > tolerance
    
    while active_mask.reduce_or() and iteration < max_iterations:
        # Vectorized evaluation of function and derivative
        var fx = current_x*current_x*current_x - 2.0*current_x*current_x + 4.0*current_x - 8.0
        var dfx = 3.0*current_x*current_x - 4.0*current_x + 4.0
        
        # Check for division by zero (using a small epsilon)
        var valid_derivative = abs(dfx) >= 1e-10
        
        # Compute next approximation only for valid lanes
        new_x = current_x - fx / dfx
        
        # Compute error for convergence check
        error = abs(new_x - current_x)
        
        # Update only lanes with valid derivatives
        current_x = select(valid_derivative, new_x, current_x)
        
        # Update active mask based on error and valid derivative
        active_mask = (error > tolerance) & valid_derivative
        
        iteration += 1
    
    return current_x

# Parallel execution of Newton-Raphson method across multiple initial guesses
fn find_roots(
    inout results: Tensor[DType.float32], 
    initial_guesses: Tensor[DType.float32],
    tolerance: Float32 = 1e-6, 
    max_iterations: Int = 100
) -> None:
    """
    Apply Newton-Raphson method to multiple initial guesses in parallel.
    
    Args:
        results: Output tensor to store computed roots
        initial_guesses: Tensor of initial guesses
        tolerance: Convergence criterion
        max_iterations: Maximum iterations per guess
    """
    let n = len(initial_guesses)
    
    @parameter
    fn process_chunk(start: Int, end: Int):
        for i in range(start, end):
            # Extract initial guess
            var x = initial_guesses[i]
            var x_new: Float32
            var error: Float32 = tolerance + 1.0
            var iter: Int = 0
            
            # Apply Newton-Raphson iteration
            while error > tolerance and iter < max_iterations:
                let fx = f(x)
                let dfx = df(x)
                
                # Check for division by zero
                if abs(dfx) < 1e-10:
                    break
                
                x_new = x - fx / dfx
                error = abs(x_new - x)
                x = x_new
                iter += 1
            
            # Store result
            results[i] = x
    
    # Execute in parallel across available cores
    parallelize[process_chunk](n)

# Entry point with vectorized execution
fn main() raises:
    # Number of parallel attempts (different initial guesses)
    let N = 256
    
    # Create tensors for initial guesses and results
    var initial_guesses = Tensor[DType.float32](N)
    var results = Tensor[DType.float32](N)
    
    # Generate evenly distributed initial guesses from -10 to 10
    for i in range(N):
        initial_guesses[i] = -10.0 + 20.0 * Float32(i) / Float32(N - 1)
    
    # Find roots using vectorized execution when possible and parallel execution overall
    find_roots(results, initial_guesses)
    
    # Process and display results
    print("Found roots (might include duplicates):")
    var unique_roots_count = 0
    
    # Track already found roots to avoid duplicates
    var found_roots = Tensor[DType.float32](10)  # Assuming max 10 unique roots
    var found_count = 0
    
    for i in range(N):
        let root = results[i]
        let fx = f(root)
        
        # Only consider values where function is close to zero
        if abs(fx) < 1e-4:
            # Check if this root was already found
            var is_new = True
            for j in range(found_count):
                if abs(root - found_roots[j]) < 1e-3:
                    is_new = False
                    break
            
            if is_new and found_count < 10:
                found_roots[found_count] = root
                found_count += 1
                print("Root at x =", root, "(f(x) =", fx, ")")
    
    print("Total unique roots found:", found_count)
