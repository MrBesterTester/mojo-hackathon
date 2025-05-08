---
description: 
globs: 
alwaysApply: false
---
# Mojo GPU Kernels Guide

This guide explains the available GPU kernels and how to use them in your projects using Mojo and Modular Platform 25.3.

## Target Audience

This documentation assumes you are a software engineering developer with experience in:
- General programming concepts and software development
- Basic understanding of GPU computing principles
- Familiarity with parallel processing concepts
- Working knowledge of development environments and tools

If you're new to GPU programming, I recommend reviewing the fundamentals of parallel computing before implementing these kernels. A particularly good reference is: @web [Programming Massively Parallel Processors: A Hands-on Approach 4th Edition, by Hwu, Kirk & Hajj](mdc:https:/www.amazon.com/Programming-Massively-Parallel-Processors-Hands-ebook/dp/B0B2R8VT2W/ref=sr_1_1?crid=2D0KGW3L8Q8IH&dib=eyJ2IjoiMSJ9.R2OXts15yPOOtASiENDYxWt_WAnmR-1AkFEvkCcmHmK5Wh_q5gYPk_kshohbMVC77tydPQOXwv7xdrxigy8MyNA3HJBgJRfKX5Hxvlsdx6vciscFZ9cL2LArNguLbbCMo8NA8eKWBAxrsL3hRK8NITb8WxVg7E2fSard2lMsF2KxbLVZET_wRVZiC3hiBeM8UQnEgBv1M_PJ_A2qLK89aQwneRma3Q5pZpWz9tedsNk.wuynmNF7XXlQIWNt6-NaItKkmnBRuPRLOAB8VwGGT9s&dib_tag=se&keywords=Programming+Massively+Parallel+Processors&qid=1744997679&sprefix=programming+massively+parallel+processors%2Caps%2C187&sr=8-1)

## Available GPU Kernels

This project implements the following high-performance GPU kernels:

1. **Transformer Attention Block**
   - Supports multi-head attention computation
   - Configurable for different sequence lengths and batch sizes

2. **Fast Fourier Transform (FFT)**
   - In-place and out-of-place transforms
   - Support for 1D, 2D, and 3D transforms
   - Optimized for power-of-two sizes

3. **Cumulative Sum (CumSum)**
   - High-performance parallel implementation
   - Supports both inclusive and exclusive scan
   - Handles arbitrary input sizes

4. **Image Processing Kernels**
   - Convolution operations
   - Non-Maximum Suppression (NMS)
   - Optimized for common filter sizes

5. **Radix Sort**
   - GPU-accelerated implementation
   - Supports key-value pairs
   - Configurable radix size

For further details of these projects see [project-overview.mdc](mdc:.cursor/rules/project-overview.mdc).

## System Requirements

Varies depending on the platform. see [platforms.mdc](mdc:.cursor/rules/platforms.mdc).

For detailed environment setup, refer to [environment-setup.mdc](mdc:environment-setup.mdc).

## Installation

1. **Install Modular Platform**
   ```bash
   # Install Magic CLI
   curl https://get.modular.com | sh -
   
   # Initialize environment
   modular init
   
   # Install Mojo SDK
   modular install mojo
   ```

2. **Verify Installation**
   ```bash
   # Check Mojo version
   mojo --version
   
   # Verify GPU support
   mojo gpu-check
   ```

## Usage Guide

### 1. Transformer Attention Block
```mojo
from kernels.attention import TransformerAttention

# Initialize attention block
attention = TransformerAttention(
    num_heads=8,
    head_dim=64,
    batch_size=32
)

# Run attention computation
output = attention.forward(queries, keys, values)
```

### 2. Fast Fourier Transform
```mojo
from kernels.fft import FFT

# Create FFT instance
fft = FFT(size=1024, dims=2)

# Perform transform
result = fft.compute(input_data)
```

### 3. Cumulative Sum
```mojo
from kernels.scan import CumulativeSum

# Initialize cumsum
cumsum = CumulativeSum(exclusive=False)

# Compute cumulative sum
result = cumsum.compute(input_array)
```

### 4. Image Processing
```mojo
from kernels.imaging import Convolution, NMS

# Create convolution kernel
conv = Convolution(kernel_size=3, padding=1)
conv_result = conv.compute(image)

# Apply NMS
nms = NMS(iou_threshold=0.5)
boxes = nms.compute(detections)
```

### 5. Radix Sort
```mojo
from kernels.sort import RadixSort

# Initialize sorter
sorter = RadixSort(radix_bits=8)

# Sort array
sorted_data = sorter.sort(input_array)
```

## Performance Optimization

For optimal performance:
1. Use power-of-two sizes where possible
2. Ensure proper memory alignment
3. Batch operations when processing multiple inputs
4. Pre-allocate buffers for repeated operations

Refer to [gpu-programming.mdc](mdc:gpu-programming.mdc) for detailed optimization guidelines.

## Testing and Benchmarking

For testing and performance validation:
1. Use the provided test suite in the `tests` directory
2. Run benchmarks to verify performance
3. Compare against CPU baselines

See [testing-benchmarking.mdc](mdc:testing-benchmarking.mdc) for comprehensive testing procedures.

## Code Standards

All kernel implementations follow the project's coding standards. Review [code-standards.mdc](mdc:code-standards.mdc) for:
- Naming conventions
- Documentation requirements
- Error handling practices
- Performance considerations

## Project Structure

The kernels are organized according to the structure defined in [project-structure.mdc](mdc:project-structure.mdc):
- Source code in `src/kernels/`
- Tests in `tests/`
- Benchmarks in `benchmarks/`
- Documentation in `docs/`

## Contributing

When contributing new kernels or optimizations:
1. Follow the coding standards
2. Include comprehensive tests
3. Provide performance benchmarks
4. Document usage and limitations
5. Submit pull requests according to project guidelines

## Support

For issues and questions:
1. Check existing documentation
2. Review test cases for examples
3. Submit detailed bug reports if needed
4. Include benchmark results for performance issues

## License

This project is licensed under the terms specified in the LICENSE file.
