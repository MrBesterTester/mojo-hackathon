---
description: This document provides best practices for GPU programming in Mojo, focusing on AMD Radeon optimization techniques.
globs: 
alwaysApply: false
---
---
description: This document provides best practices for GPU programming in Mojo, focusing on AMD Radeon optimization techniques.
globs: 
alwaysApply: false
---

# GPU Programming Guidelines for Mojo

This document provides best practices for GPU programming in Mojo, focusing on AMD Radeon optimization techniques.

## Hardware Considerations

### AMD Radeon GPU Architecture
- Target Radeon Pro Vega 20 with 4GB VRAM for development
- Leverage AMD's compute unit architecture for optimal workload distribution
- Be mindful of memory bandwidth and VRAM limitations

## Kernel Design Principles

### Thread Organization
- Make workgroup sizes a multiple of 64 threads for best performance across GPU generations
- Use appropriate block and grid dimensions to maximize occupancy
- Consider using wave32 for RDNA architecture (newer GPUs) and wave64 for older GCN architecture

### Memory Access Patterns
- Use coalesced memory access whenever possible (adjacent threads access adjacent memory)
- Prefer row-major layout for sequential data access
- Consider column-major layout when it aligns with specific access patterns
- Avoid bank conflicts in shared memory by using appropriate padding

### Shared Memory Usage
- Use shared memory for frequently accessed data within a thread block
- Be mindful of shared memory capacity (typically 32-64KB per compute unit)
- Properly synchronize shared memory access with barrier() calls
- Prefer struct-of-arrays over array-of-structs to reduce bank conflicts

## Performance Optimization

### Computation Strategies
- Use appropriate reduction techniques based on workload:
  - Warp-level reductions for small data sets
  - Block-level reductions with shared memory for medium data sets
  - Multi-level reductions for large data sets
- Balance thread count and work per thread for optimal performance
- Avoid thread divergence within warps (conditional code that causes threads to take different paths)

### Memory Management
- Minimize device-host transfers
- Use device-to-device transfers when possible
- Consider memory layout for cache efficiency
- Use appropriate data types to maximize bandwidth efficiency

### Async Compute
- Utilize asynchronous execution when possible
- Queue compute operations that can run in parallel with graphics
- Use synchronization points strategically to avoid stalls

## Debugging and Profiling

### Debugging Techniques
- Use printf debugging for simple issues
- Implement buffer markers to track execution flow
- Validate thread/block indices with test patterns

### Profiling Tools
- Leverage AMD Radeon GPU Profiler (RGP) for performance analysis
- Use Radeon Memory Visualizer (RMV) to optimize memory usage
- Monitor occupancy, memory access patterns, and compute unit utilization

## Example Patterns

### Reduction Pattern
```mojo
fn warp_reduce_kernel(in_tensor: InTensor, out_tensor: OutTensor):
    var value = in_tensor.load[1](mdc:block_idx.x, thread_idx.x)
    // Perform warp-level reduction using AMD's wave operations
    value = warp.sum(value)
    
    // Only thread 0 writes the final result
    if thread_idx.x == 0:
        out_tensor[block_idx.x] = value
```

### Tiled Processing Pattern
```mojo
fn tiled_process_kernel(in_tensor: InTensor, out_tensor: OutTensor):
    // Define tile dimensions
    alias TILE_SIZE_X = 16
    alias TILE_SIZE_Y = 16
    
    // Allocate shared memory for the tile
    var tile = stack_allocation[
        TILE_SIZE_X, TILE_SIZE_Y,
        Scalar[dtype],
        address_space = AddressSpace.SHARED
    ]()
    
    // Load data into shared memory
    // Process data in shared memory
    // Write results back to global memory
```

## Common Pitfalls to Avoid

- Excessive thread synchronization
- Uncoalesced memory access patterns
- Oversubscription of shared memory
- Inefficient use of registers
- Unnecessary host-device transfers
- Thread divergence in performance-critical code
- Insufficient occupancy due to resource constraints

By following these guidelines, you can achieve optimal performance for your GPU-accelerated Mojo applications on AMD Radeon hardware.
