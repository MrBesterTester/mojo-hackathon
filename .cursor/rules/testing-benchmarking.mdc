---
description: This document outlines best practices for testing, validating, and benchmarking Mojo GPU applications to ensure reliability and optimal performance.
globs: 
alwaysApply: false
---
# Testing and Benchmarking Guidelines for Mojo GPU Programming

This document outlines best practices for testing, validating, and benchmarking Mojo GPU applications to ensure reliability and optimal performance.

## Testing Fundamentals

### Unit Testing

- Write tests for individual functions and kernels
- Verify correctness of computation against known outputs
- Test with different grid and block dimensions to ensure correctness across thread configurations
- Validate edge cases such as boundary conditions and corner cases
- Use small data sets for quick validation during development

### Integration Testing

- Test interactions between CPU and GPU code
- Verify proper synchronization between host and device operations
- Test memory transfers and ensure data integrity
- Validate complex workflows that combine multiple kernels
- Ensure proper error handling and resource cleanup

### Validation Techniques

- Compare GPU results against CPU reference implementations
- Use epsilon-based comparisons for floating-point operations
- For stochastic algorithms, use statistical validation methods
- Validate against analytical solutions when available
- Use visualization techniques to spot patterns in output errors

## Benchmarking Practices

### Benchmark Design

1. **Measure common use cases that matter**
   - Focus on real-world workloads relevant to your domain
   - Avoid cherry-picking favorable scenarios
   - Include representative problem sizes

2. **Ensure correctness of results**
   - Validate outputs against reference implementations
   - Define acceptable error thresholds for numerical computations

3. **Make fair comparisons**
   - Use equivalent optimization flags across implementations
   - Ensure consistent hardware and system settings
   - Compare against optimized implementations in other languages
   - Document all configuration details for reproducibility

4. **Focus on relevant metrics**
   - For Mojo GPU code, consider:
     - Execution time
     - Throughput (operations/second)
     - Memory bandwidth utilization
     - Energy efficiency (if applicable)
     - Scalability with problem size

### Implementation Guidelines

- **Create reproducible benchmarks**
  - Provide complete source code and build instructions
  - Document hardware specifications and environment setup
  - Include input datasets or data generation methods
  - Use automated scripts for running benchmarks

- **Prevent compiler optimizations from skewing results**
  - Use the `keep()` and `clobber_memory()` functions from the benchmark package
  - Ensure computed results are actually used
  - Verify the code being benchmarked is actually executing

- **Collect statistically significant results**
  - Run multiple iterations (at least 5-10)
  - Include warm-up runs to account for initial overhead
  - Report mean, median, and standard deviation
  - Use the built-in benchmark package for measurement

- **Maintain a deterministic testing environment**
  - Disable frequency scaling and boosting on test systems
  - Minimize background processes
  - Run benchmarks at consistent thermal conditions
  - Document and control GPU clock speeds

## GPU-Specific Testing Considerations

### Memory-Related Testing

- Test different memory access patterns
- Validate correct handling of shared memory
- Check for race conditions in parallel operations
- Verify memory alignment requirements are met
- Test with different memory sizes to find performance cliffs

### Thread Synchronization

- Validate barrier and synchronization primitives
- Test wavefront and warp-level operations
- Verify atomics work correctly under contention
- Check for deadlocks in complex synchronization scenarios

### Error Handling

- Test graceful handling of out-of-memory conditions
- Validate error reporting for invalid kernel parameters
- Verify recovery from compute errors
- Test boundary conditions that might cause crashes

## Tools and Techniques

### Built-in Mojo Tools

- Use Mojo's benchmark package for timing and performance analysis
- Utilize debugging features like print statements in kernels
- Leverage autotune capabilities for parameter optimization

### External Profiling

- Use AMD Radeon GPU Profiler (RGP) for detailed performance analysis
- Monitor memory usage with Radeon Memory Visualizer (RMV)
- Track utilization metrics during benchmark runs
- Analyze instruction mix and compute unit occupancy

### Visualization Tools

- Create performance scaling charts to identify bottlenecks
- Use heatmaps to visualize memory access patterns
- Plot execution time vs. data size to understand scaling behavior
- Visualize workload distribution across compute units

## Sample Benchmark Framework

```mojo
from benchmark import keep, clobber_memory, Benchmark

fn benchmark_kernel_function():
    # Set up test data
    var input_data = setup_test_data()
    var output_data = allocate_output_buffer()
    
    # Warm-up runs
    for i in range(3):
        run_gpu_kernel(input_data, output_data)
    
    # Actual benchmark
    @parameter
    fn test_fn():
        run_gpu_kernel(input_data, output_data)
        # Prevent optimization
        keep(output_data)
    
    # Run benchmark with multiple iterations
    var bench = Benchmark()
    let report = bench.run[test_fn](iterations=10)
    
    # Validate results
    verify_output(output_data)
    
    return report
```

## Best Practices Checklist

- [ ] Write comprehensive unit tests for all kernels
- [ ] Verify numerical accuracy against reference implementations
- [ ] Test with various input sizes and thread configurations
- [ ] Document hardware and software configurations
- [ ] Run multiple benchmark iterations for statistical significance
- [ ] Use appropriate metrics for your domain
- [ ] Control for system variability during benchmark runs
- [ ] Avoid cherry-picking favorable results
- [ ] Make fair comparisons against optimized implementations
- [ ] Prevent compiler optimizations from skewing results
- [ ] Document and share complete benchmark methodology

By following these guidelines, you'll produce reliable, reproducible benchmarks that accurately reflect the performance of your Mojo GPU code and provide meaningful comparisons with alternative implementations.