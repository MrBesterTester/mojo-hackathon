/*
 * Newton-Raphson Method CUDA Implementation
 * 
 * This program implements the Newton-Raphson root-finding algorithm on a GPU using CUDA.
 * The implementation allows finding multiple roots in parallel by starting from different
 * initial guesses distributed across a range.
 *
 * The Newton-Raphson method iteratively refines an initial guess using the formula:
 *    x_{n+1} = x_n - f(x_n)/f'(x_n)
 * 
 * The algorithm converges quadratically when near a root, making it very efficient
 * for finding roots of differentiable functions.
 * The comments explain:
 * The overall purpose and mathematical foundation of the algorithm
 * Each function's purpose and parameters
 * GPU-specific optimizations and considerations
 * Numerical stability safeguards
 * Memory management strategy
 * The parallel approach to finding multiple roots simultaneously
 
 */
#include <stdio.h>
#include <math.h>

// Define a structure to contain function and derivative code
// This allows passing function pointers to device code for more flexibility
typedef struct {
    float (*f)(float);   // Function pointer for f(x)
    float (*df)(float);  // Function pointer for the derivative f'(x)
} FunctionPair;

// Sample function: f(x) = x^3 - 2x^2 + 4x - 8
// The __device__ qualifier makes this function callable from the device (GPU)
__device__ float f(float x) {
    return x*x*x - 2*x*x + 4*x - 8;  // Cubic polynomial with potentially multiple roots
}

// Its derivative: f'(x) = 3x^2 - 4x + 4
// Analytical derivative for faster and more accurate convergence
__device__ float df(float x) {
    return 3*x*x - 4*x + 4;  // Quadratic polynomial (derivative of cubic)
}

/*
 * Newton-Raphson kernel with hard-coded function
 * 
 * Parameters:
 * - x0: Array of initial guesses
 * - result: Array to store computed roots
 * - tolerance: Convergence criterion (stop when |x_{n+1} - x_n| < tolerance)
 * - maxIterations: Maximum number of iterations to prevent infinite loops
 */
__global__ void newtonRaphsonKernel(float *x0, float *result, float tolerance, int maxIterations) {
    // Calculate global thread ID
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Load the initial guess for this thread
    float x = x0[idx];
    float x_new;
    float error = tolerance + 1.0f;  // Initialize error to be > tolerance
    int iter = 0;
    
    // Iterate until convergence or max iterations reached
    while (error > tolerance && iter < maxIterations) {
        // Newton-Raphson formula: x_{n+1} = x_n - f(x_n)/f'(x_n)
        float fx = f(x);      // Calculate function value
        float dfx = df(x);    // Calculate derivative value
        
        // Check for division by zero (avoid numerical instability)
        if (fabsf(dfx) < 1e-10f) {
            // If derivative is too small, iteration might diverge
            break;
        }
        
        // Calculate the next approximation
        x_new = x - fx / dfx;
        
        // Calculate error for convergence check
        error = fabsf(x_new - x);
        
        // Update current approximation
        x = x_new;
        iter++;
    }
    
    // Store the result for this thread
    result[idx] = x;
}

/*
 * Generic Newton-Raphson kernel that uses function pointers
 * This version allows changing the target function without recompiling
 * 
 * Parameters:
 * - Same as above, plus:
 * - funcs: Structure containing function and derivative pointers
 */
__global__ void newtonRaphsonGeneric(float *x0, float *result, float tolerance, 
                                    int maxIterations, FunctionPair funcs) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    float x = x0[idx];
    float x_new;
    float error = tolerance + 1.0f;
    int iter = 0;
    
    while (error > tolerance && iter < maxIterations) {
        // Use function pointers instead of hard-coded functions
        float fx = funcs.f(x);
        float dfx = funcs.df(x);
        
        if (fabsf(dfx) < 1e-10f) {
            break;
        }
        
        x_new = x - fx / dfx;
        error = fabsf(x_new - x);
        x = x_new;
        iter++;
    }
    
    result[idx] = x;
}

/*
 * Main function:
 * - Sets up the problem
 * - Allocates memory on host and device
 * - Launches kernel
 * - Processes and displays results
 */
int main() {
    // Number of parallel attempts (different initial guesses)
    const int N = 256;
    
    // Host memory for initial guesses and results
    float h_x0[N];
    float h_result[N];
    
    // Create initial guesses spread over a range
    // This increases the likelihood of finding all roots of the function
    for (int i = 0; i < N; i++) {
        h_x0[i] = -10.0f + 20.0f * i / (N - 1); // Spread from -10 to 10
    }
    
    // Allocate device memory for input and output
    float *d_x0, *d_result;
    cudaMalloc(&d_x0, N * sizeof(float));
    cudaMalloc(&d_result, N * sizeof(float));
    
    // Copy the initial guesses to the device
    cudaMemcpy(d_x0, h_x0, N * sizeof(float), cudaMemcpyHostToDevice);
    
    // Set up block and grid dimensions for CUDA kernel
    // For optimal performance, threadsPerBlock should be a multiple of 32 (warp size)
    int threadsPerBlock = 256;
    int blocksPerGrid = (N + threadsPerBlock - 1) / threadsPerBlock;
    
    // Launch the Newton-Raphson kernel
    // Parameters: tolerance=1e-6 (6 digits precision), maxIterations=100
    newtonRaphsonKernel<<<blocksPerGrid, threadsPerBlock>>>(d_x0, d_result, 1e-6f, 100);
    
    // Copy the results back to the host
    cudaMemcpy(h_result, d_result, N * sizeof(float), cudaMemcpyDeviceToHost);
    
    // Print the results
    printf("Found roots (might include duplicates):\n");
    for (int i = 0; i < N; i++) {
        // Check if the value is actually a root by evaluating the function
        // This filters out cases where the method failed to converge
        float fx = h_result[i]*h_result[i]*h_result[i] - 
                  2*h_result[i]*h_result[i] + 
                  4*h_result[i] - 8;
        
        // Only print values where f(x) is very close to zero
        if (fabsf(fx) < 1e-4f) {
            printf("Root at x = %.8f (f(x) = %.8e)\n", h_result[i], fx);
        }
    }
    
    // Free device memory to prevent memory leaks
    cudaFree(d_x0);
    cudaFree(d_result);
    
    return 0;
}
