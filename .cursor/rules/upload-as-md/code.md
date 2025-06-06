---
description: 
globs: 
alwaysApply: false
---

# Mojo Code Standards and Best Practices

## General Principles

- **Readability over Cleverness**: Write clear, self-documenting code
- **Consistency**: Follow established patterns within the codebase
- **Performance Awareness**: Be mindful of performance implications, especially for GPU code
- **Error Handling**: Use consistent error handling patterns
- **Documentation**: Document complex algorithms and non-obvious code

## Naming Conventions

### Files and Directories
- Use lowercase with underscores for file names: `matrix_multiply.mojo`
- Group related functionality into directories with descriptive names

### Variables and Functions
- Use `snake_case` for variable and function names
- Use descriptive names that convey purpose
- Prefix boolean variables with `is_`, `has_`, or similar: `is_initialized`, `has_completed`
- Avoid abbreviations unless widely understood

### Structs and Types
- Use `PascalCase` for struct names: `MatrixMultiplier`
- Use descriptive names that convey the purpose of the struct
- Use `snake_case` for member variables with clear, descriptive names

## Code Organization

### File Structure
- Begin files with a descriptive comment explaining the file's purpose
- Group imports at the top of the file
- Organize functions and structs in a logical order
- Keep files focused on a single responsibility

### Function Structure
- Keep functions short and focused on a single task
- Limit function parameters (≤5 is ideal)
- Order parameters logically (input, then output)
- Return early for error conditions when possible
- Add comments for complex logic

## GPU Programming

### Memory Management
- Always free allocated GPU memory
- Minimize data transfers between CPU and GPU
- Use appropriate memory types (global, shared, etc.) based on access patterns
- Be mindful of memory alignment for optimal performance

### Parallelism
- Design algorithms with parallelism in mind
- Consider work distribution and thread utilization
- Avoid thread divergence within warps
- Minimize synchronization when possible

### Optimization
- Prioritize algorithmic improvements over micro-optimizations
- Profile before optimizing
- Document performance-critical code sections
- Use autotune for hardware-specific optimizations
- Consider memory access patterns to maximize coalescing

## Error Handling

### Error Patterns
- Use `fn` for performance-critical code, `def` for Python compatibility
- Use `raises` keyword for functions that may raise exceptions
- Handle expected errors at appropriate levels
- Provide meaningful error messages

### Error Types
- Use `Error` type for exceptions in Mojo
- Include contextual information in error messages
- For expected error conditions, consider using `Optional` or `Result` patterns

## Comments and Documentation

### Code Comments
- Write comments that explain "why", not "what"
- Use docstrings for public functions and structs
- Document parameters, return values, and exceptions
- Update comments when code changes

### Documentation Format

- Use triple-quoted strings for docstrings
- Follow a consistent format for all documentation
- Document both high-level purpose and implementation details for GPU kernels
- Explain performance characteristics and optimization strategies

#### Function and Method Docstrings

Use this format for functions and methods:

Brief description of function purpose.

Detailed explanation of algorithm, approach, or implementation details.
For GPU functions, include information about parallelization strategy.

Parameters:
    param1 (Type): Description of first parameter
    param2 (Type): Description of second parameter
    
Returns:
    Type: Description of return value
    
Raises:
    Error: Description of when this error is raised
    
Performance:
    - Time complexity: O(n)
    - Memory complexity: O(n)
    - GPU considerations: coalesced memory access, occupancy
    
Examples:
    result = function_name(input1, input2)
    
Notes:
    Any additional information, caveats, or implementation details.
"""

#### Struct Docstrings

Use this format for structs:

"""
Brief description of the struct.

(base) sam@Samuels-MacBook-Pro rules % vi code-standards.mdc 
(base) sam@Samuels-MacBook-Pro rules % 
(base) sam@Samuels-MacBook-Pro rules % 
(base) sam@Samuels-MacBook-Pro rules % vi code-standards.mdc
(base) sam@Samuels-MacBook-Pro rules % mv code-standards.mdc code-standards.md  
(base) sam@Samuels-MacBook-Pro rules % cat code-standards.md
# Mojo Code Standards and Best Practices

## General Principles

- **Readability over Cleverness**: Write clear, self-documenting code
- **Consistency**: Follow established patterns within the codebase
- **Performance Awareness**: Be mindful of performance implications, especially for GPU code
- **Error Handling**: Use consistent error handling patterns
- **Documentation**: Document complex algorithms and non-obvious code

## Naming Conventions

### Files and Directories
- Use lowercase with underscores for file names: `matrix_multiply.mojo`
- Group related functionality into directories with descriptive names

### Variables and Functions
- Use `snake_case` for variable and function names
- Use descriptive names that convey purpose
- Prefix boolean variables with `is_`, `has_`, or similar: `is_initialized`, `has_completed`
- Avoid abbreviations unless widely understood

### Structs and Types
- Use `PascalCase` for struct names: `MatrixMultiplier`
- Use descriptive names that convey the purpose of the struct
- Use `snake_case` for member variables with clear, descriptive names

## Code Organization

### File Structure
- Begin files with a descriptive comment explaining the file's purpose
- Group imports at the top of the file
- Organize functions and structs in a logical order
- Keep files focused on a single responsibility

### Function Structure
- Keep functions short and focused on a single task
- Limit function parameters (≤5 is ideal)
- Order parameters logically (input, then output)
- Return early for error conditions when possible
- Add comments for complex logic

## GPU Programming

### Memory Management
- Always free allocated GPU memory
- Minimize data transfers between CPU and GPU
- Use appropriate memory types (global, shared, etc.) based on access patterns
- Be mindful of memory alignment for optimal performance

### Parallelism
- Design algorithms with parallelism in mind
- Consider work distribution and thread utilization
- Avoid thread divergence within warps
- Minimize synchronization when possible

### Optimization
- Prioritize algorithmic improvements over micro-optimizations
- Profile before optimizing
- Document performance-critical code sections
- Use autotune for hardware-specific optimizations
- Consider memory access patterns to maximize coalescing

## Error Handling

### Error Patterns
- Use `fn` for performance-critical code, `def` for Python compatibility
- Use `raises` keyword for functions that may raise exceptions
- Handle expected errors at appropriate levels
- Provide meaningful error messages

### Error Types
- Use `Error` type for exceptions in Mojo
- Include contextual information in error messages
- For expected error conditions, consider using `Optional` or `Result` patterns

## Comments and Documentation

### Code Comments
- Write comments that explain "why", not "what"
- Use docstrings for public functions and structs
- Document parameters, return values, and exceptions
- Update comments when code changes

### Documentation Format

- Use triple-quoted strings for docstrings
- Follow a consistent format for all documentation
- Document both high-level purpose and implementation details for GPU kernels
- Explain performance characteristics and optimization strategies

#### Function and Method Docstrings

Use this format for functions and methods:

Brief description of function purpose.

Detailed explanation of algorithm, approach, or implementation details.
For GPU functions, include information about parallelization strategy.

Parameters:
    param1 (Type): Description of first parameter
    param2 (Type): Description of second parameter
    
Returns:
    Type: Description of return value
    
Raises:
    Error: Description of when this error is raised
    
Performance:
    - Time complexity: O(n)
    - Memory complexity: O(n)
    - GPU considerations: coalesced memory access, occupancy
    
Examples:
    result = function_name(input1, input2)
    
Notes:
    Any additional information, caveats, or implementation details.
"""

#### Struct Docstrings

Use this format for structs:

"""
Brief description of the struct.

Detailed explanation of the struct's purpose, design choices, and usage.
For GPU-oriented structs, explain memory layout considerations.

Attributes:
    attribute1 (Type): Description of first attribute
    attribute2 (Type): Description of second attribute
    
Methods:
    method1(): Brief description
    method2(param): Brief description
    
Performance:
    - Memory layout: explain any specific memory layout choices
    - GPU considerations: alignment, cache efficiency
    
Examples:
    instance = StructName(param1, param2)
    result = instance.method()
"""

#### GPU Kernel Documentation

For GPU kernels, additionally document:

"""
[Standard function documentation as above]

GPU Implementation:
    - Thread/block dimensions: [describe organization]
    - Shared memory usage: [amount and purpose]
    - Synchronization points: [when and why]
    - Memory access patterns: [coalescing strategy]
    
Hardware Considerations:
    - Target architecture: [e.g., AMD RDNA2]
    - Optimization techniques: [e.g., loop unrolling, memory coalescing]
    - Known limitations: [e.g., maximum problem size, edge cases]
"""

## Testing

### Test Structure
- Organize tests by functionality
- Name test functions descriptively
- Include both positive and negative test cases
- Test boundary conditions and edge cases

### GPU Testing
- Test both CPU and GPU implementations
- Verify numerical stability across implementations
- Include performance benchmarks for critical operations
- Test with various input sizes

## Version Control

### Commit Messages
- Write clear, descriptive commit messages
- Begin with a concise summary line
- Include details about significant changes
- Reference related issues or tickets

### Branching
- Use feature branches for new development
- Keep branches focused on a single feature or fix
- Regularly merge from main to avoid drift

## Best Practices for Optimizing Mojo Code

### Compile-Time Metaprogramming
- Use `@parameter` to evaluate expressions at compile time
- Leverage Mojo's parametric functions for code generation
- Use compile-time constants for known values

### Value Semantics
- Prefer value semantics for small, copyable types
- Use references for large data structures
- Be explicit about ownership using `owned`, `borrowed`, etc.
- Use the `@value` decorator for simple structs

### Performance Optimization
- Prefer early returns to minimize nesting
- Use static dispatch instead of dynamic dispatch when possible
- Leverage SIMD operations for data parallelism
- Minimize unnecessary copies of large data structures
- Consider memory layout for cache efficiency

## Sharp Edges to Avoid

- Avoid nested functions with recursion (not yet supported)
- Be aware that `or` expressions are statically typed
- No list or dict comprehensions yet (use explicit loops)
- StringLiteral behaves differently from String (convert explicitly)
- Remember that traits currently only support method requirements (no default implementations)

## Integration with Python

- Use `from python import Python` for importing Python modules
- Convert between Python objects and Mojo types explicitly
- Be aware of performance implications when crossing language boundaries
- Document Python dependencies clearly

These guidelines aim to promote code that is readable, maintainable, and performant, while leveraging Mojo's unique capabilities for GPU programming.