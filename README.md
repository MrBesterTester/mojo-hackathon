<!--
Derived from .cursor/rules/project-overview.mdc
-->
# Mojo GPU Programming for the Modular Hackathon at AGI, May 10, 2025

Update 5/12/2025 - Added [my retrospective for the Hackathon](Modular_Hackathon_5-10-2025_Retrospective.md).

Update 5/10/2025 - Added Mojo (and CUDA) code for the Newton Raphson method of solving polynomials.
- See [What is the Newton-Raphson method](https://www.perplexity.ai/search/638ddf1d-6989-4880-b8ea-e4e8a5fc2923) for the research.
- There are also separate markdown files for the Mojo version as well as the CUDA version.

## Table of Contents
- [Mojo GPU Programming for the Modular Hackathon at AGI, May 10, 2025](#mojo-gpu-programming-for-the-modular-hackathon-at-agi-may-10-2025)
  - [Table of Contents](#table-of-contents)
- [Team Roles and Responsibilities for GPU Kernel Projects](#team-roles-and-responsibilities-for-gpu-kernel-projects)
  - [Core Team Member Roles](#core-team-member-roles)
    - [1. Kernel Architect](#1-kernel-architect)
    - [2. Infrastructure Engineer](#2-infrastructure-engineer)
    - [3. Implementation Engineer](#3-implementation-engineer)
    - [4. Optimization Specialist](#4-optimization-specialist)
  - [Team Collaboration Process](#team-collaboration-process)
- [GPU Kernel Project Effort Estimation](#gpu-kernel-project-effort-estimation)
  - [Project Effort Estimates (Increasing Order)](#project-effort-estimates-increasing-order)
  - [Implementation Considerations](#implementation-considerations)
    - [Cumulative Sum (cumsum)](#cumulative-sum-cumsum)
    - [Image Processing Kernels](#image-processing-kernels)
    - [Radix Sort on GPU](#radix-sort-on-gpu)
    - [Fast Fourier Transform (FFT)](#fast-fourier-transform-fft)
    - [Transformer Attention Block](#transformer-attention-block)
    - [GPTQ Implementation Port](#gptq-implementation-port)
  - [Platform-Specific Considerations](#platform-specific-considerations)
  - [Success Factors](#success-factors)
- [Hackathon Team Collaboration Strategy](#hackathon-team-collaboration-strategy)
  - [Team-Based Approach for Single-Day Hackathon](#team-based-approach-for-single-day-hackathon)
    - [General Team Structure](#general-team-structure)
    - [Project Breakdown by Complexity](#project-breakdown-by-complexity)
      - [Cumulative Sum (cumsum)](#cumulative-sum-cumsum-1)
      - [Image Processing Kernels](#image-processing-kernels-1)
      - [Radix Sort on GPU](#radix-sort-on-gpu-1)
      - [Fast Fourier Transform (FFT)](#fast-fourier-transform-fft-1)
      - [Transformer Attention Block](#transformer-attention-block-1)
      - [GPTQ Implementation Port](#gptq-implementation-port-1)
  - [Collaboration Best Practices](#collaboration-best-practices)
  - [Recommended Project Selection](#recommended-project-selection)

With the AI support in this Cursor project, you will be able to code at the expert in GPU programming using the Mojo programming language and the complete set of tools that Modular just released in Modular Platform 25.3.

You will be able to do a GPU kernel programming task in Mojo such as:
- Write a transformer attention block.  
- Port a GPTQ implementation to NVIDIA H100 or AMD Mi300X  
- Implement a Fast Fourier Transform (FFT) for GPU.  
- Write a computationally fast cumulative sum (cumsum) operation.  
- Write computationally fast image processing kernels such convolution or non-maximum suppression (NMS).  
- Implement Radix sort on GPUs.
Do not write any code at this time.

Not only will the specific programming task vary, but the platform on which you develop as well as the GPUs (or CPUs) that you target for execution of the kernel vary as well.  If no GPU is targeted, then the kernel said to be CPU only in which the only optimization is generally SIMD type instructions.  The possible platforms and their GPU/CPU targets are described in the platforms documentation.

Use their native package manager, `magic`, to get started installing those tools here in the "Magic" tab in the Installation Guide here: https://docs.modular.com/max/packages/

Review the extensive documentation for their tools: https://docs.modular.com. Please pay attention these specific parts of that documentation for Mojo programming:
- Some easy tutorials on programming with Mojo are here: https://docs.modular.com/max/tutorials
  - Source code for those examples is here: https://github.com/modular/modular/tree/main/examples/mojo
- The complete manual for the Mojo programming language is here: https://docs.modular.com/mojo/manual/

Whenever there is a GPU or SIMD optimized version of the kernel you have programmed, please provide a CPU only version of it in the same file to compare the results fo the optimized version with the non-optimized (CPU-only) version as a built-in test of the optmized, GPU/SIMD version.  When running the kernel, the non-optmized version should run first followed by the optimized version afterwhich the results are compared.  If the results are fairly close, then the built-in test should report a PASS, otherwise a FAIL.  The tolerance of closeness should default to 3% and be declared in the code as a separate variable for easy, manual adjustment by the developer.

# Team Roles and Responsibilities for GPU Kernel Projects

## Core Team Member Roles

For all kernel projects in the hackathon, we recommend the following consistent role distribution across the team:

### 1. Kernel Architect
- **Primary Responsibilities**:
  - Design the overall algorithm strategy and kernel architecture
  - Define memory access patterns and data organization
  - Plan thread hierarchy and workgroup sizes
  - Coordinate algorithm decomposition into GPU-friendly patterns
  - Lead architecture review sessions during integration points
  - Make critical decisions on optimization approaches

### 2. Infrastructure Engineer  
- **Primary Responsibilities**:
  - Set up the development environment (Colab or Brev with NVIDIA GPU)
  - Configure the project structure following standards
  - Implement test harnesses and validation frameworks
  - Create data generation and verification utilities
  - Develop benchmarking tools and performance visualization
  - Manage integration between components
  - Document environment setup and execution instructions

### 3. Implementation Engineer
- **Primary Responsibilities**: 
  - Implement the CPU baseline implementation for validation
  - Write clear, correct reference algorithms
  - Handle edge cases and correctness guarantees
  - Assist with GPU kernel implementation
  - Develop unit tests for each component
  - Ensure backward compatibility with CPU fallbacks
  - Document implementation details and algorithm choices

### 4. Optimization Specialist
- **Primary Responsibilities**:
  - Focus on GPU-specific optimizations
  - Implement memory coalescing strategies
  - Optimize thread organization for maximum occupancy
  - Fine-tune shared memory usage patterns
  - Reduce thread divergence and synchronization overhead
  - Profile performance and identify bottlenecks
  - Implement advanced optimization techniques
  - Document performance characteristics and trade-offs

## Team Collaboration Process

For effective collaboration during the hackathon:

1. **Regular Integration Points**
   - Mid-morning check-in (30 minutes)
   - Midday integration and alignment (30-45 minutes)
   - Late afternoon final integration (60 minutes)

2. **Communication Protocols**
   - Maintain shared documentation for architectural decisions
   - Use clear interface contracts between components
   - Report blockers immediately rather than struggling in isolation
   - Regular updates on progress and challenges

3. **Knowledge Sharing**
   - Cross-train on key components to reduce single points of failure
   - Document insights and lessons learned throughout the day
   - Share optimization discoveries that could benefit other components

This role distribution ensures specialized focus while maintaining team cohesion, and can be applied consistently across any of the GPU kernel projects in the hackathon.

# GPU Kernel Project Effort Estimation

Below is an effort estimation for each of the GPU kernel projects suggested in the Modular Hackathon, ordered from least to most effort required:

## Project Effort Estimates (Increasing Order)

| Project | Complexity | Time Estimate | Platform Considerations |
|---------|------------|---------------|-------------------------|
| **Cumulative Sum (cumsum)** | Medium | 2-3 days | Good starter project with clear optimization paths |
| **Image Processing Kernels** | Medium | 2-4 days | Complexity varies by specific kernel (convolution vs. NMS) |
| **Radix Sort on GPU** | Medium-High | 3-4 days | Challenges with memory access patterns and work distribution |
| **Fast Fourier Transform (FFT)** | Medium-High | 3-4 days | Performance varies significantly between GPU architectures |
| **Transformer Attention Block** | High | 3-5 days | Most complex on NVIDIA H100/AMD Mi300X, moderate on other NVIDIA GPUs |
| **GPTQ Implementation Port** | Very High | 5-7 days | Requires deep understanding of quantization and specific GPU architecture features |

## Implementation Considerations

### Cumulative Sum (cumsum)
- Good balance of complexity and learning opportunity
- Demonstrates key GPU programming techniques
- Key challenge: Efficiently handling prefix sums across thread blocks

### Image Processing Kernels
- Familiar algorithms with clear optimization paths
- Good use of tiled memory access patterns
- Key challenge: Balancing work distribution and memory coalescence

### Radix Sort on GPU
- Requires careful consideration of memory access patterns
- Multiple kernel launches with synchronization points
- Key challenge: Efficiently handling large datasets with limited memory

### Fast Fourier Transform (FFT)
- Well-established algorithmic patterns but complex to optimize
- Memory access patterns critical for performance
- Key challenge: Achieving optimal GPU utilization for different transform sizes

### Transformer Attention Block
- Requires complex memory access patterns
- Heavy use of shared memory and careful thread synchronization
- Key challenge: Optimizing attention computation while managing memory bandwidth

### GPTQ Implementation Port
- Involves quantization-aware optimizations
- Architecture-specific implementation details critical for H100/Mi300X
- Key challenge: Maintaining accuracy while exploiting hardware-specific features

## Platform-Specific Considerations

- **MacBook2018 (AMD Radeon Pro Vega 20)**: Limited VRAM (4GB) will constrain problem sizes for all projects; SIMD optimization most important
- **iMacM1**: CPU-only optimizations; focus on SIMD instructions
- **Colab/Brev with NVIDIA GPUs**: Full GPU utilization possible; implementation complexity increases with newer hardware features

## Success Factors

For all projects:
1. Follow the development workflow in the development order documentation
2. Implement both optimized and non-optimized versions for validation (per project requirements)
3. Adhere to the 3% tolerance requirement for result validation
4. Carefully consider memory access patterns and thread organization
5. Optimize for the specific target GPU architecture

The cumulative sum and image processing kernels provide the best entry points for those new to Mojo GPU programming, while the transformer attention block and GPTQ implementation represent the most challenging projects requiring deep GPU expertise.

# Hackathon Team Collaboration Strategy

## Team-Based Approach for Single-Day Hackathon

For a full-day Hackathon with 4 team members, the key is to parallelize work effectively while maintaining integration points. Below is a breakdown of how to approach each project with a 4-person team using NVIDIA GPU environments (Colab or Brev).

### General Team Structure

For all projects, adopt this role distribution:

1. **Kernel Architect** - Designs the core algorithm and optimization strategy
2. **Infrastructure Engineer** - Sets up environment, testing framework, and benchmarking
3. **Implementation Engineer** - Implements the CPU baseline and assists with GPU implementation
4. **Optimization Specialist** - Focuses on GPU-specific optimizations and performance tuning

### Project Breakdown by Complexity

#### Cumulative Sum (cumsum)

| Team Member | Responsibilities | Time Allocation |
|-------------|------------------|-----------------|
| Kernel Architect | Design algorithm approach, define memory access patterns | Morning (2h) |
| Infrastructure Engineer | Setup Brev/Colab environment, create test harness | Morning (2h) |
| Implementation Engineer | Implement CPU baseline version | Morning (2h) |
| Optimization Specialist | Implement first GPU version | Morning (2h) |
| **Team Integration** | Review initial results, align on optimization strategy | Midday (30m) |
| Kernel Architect | Optimize thread block coordination | Afternoon (2h) |
| Infrastructure Engineer | Implement benchmarking and visualization | Afternoon (2h) |
| Implementation Engineer | Assist with edge cases and validation | Afternoon (2h) |
| Optimization Specialist | Fine-tune for maximum performance | Afternoon (2h) |
| **Team Integration** | Final integration and presentation prep | Late afternoon (1h) |

**Achievable Goal**: Complete implementation with 2-3 optimization iterations.

#### Image Processing Kernels

| Team Member | Responsibilities | Time Allocation |
|-------------|------------------|-----------------|
| Kernel Architect | Design tiling strategy and thread organization | Morning (2h) |
| Infrastructure Engineer | Setup environment and data loading | Morning (2h) |
| Implementation Engineer | Implement CPU baseline (convolution or NMS) | Morning (2h) |
| Optimization Specialist | Design shared memory utilization plan | Morning (2h) |
| **Team Integration** | Review initial designs | Midday (30m) |
| Kernel Architect | Implement core GPU kernel | Afternoon (2h) |
| Infrastructure Engineer | Create visual validation tools | Afternoon (2h) |
| Implementation Engineer | Implement edge case handling | Afternoon (2h) |
| Optimization Specialist | Optimize memory access patterns | Afternoon (2h) |
| **Team Integration** | Integration and performance analysis | Late afternoon (1h) |

**Achievable Goal**: Complete basic kernel with one optimization pass, possibly simplified boundary conditions.

#### Radix Sort on GPU

| Team Member | Responsibilities | Time Allocation |
|-------------|------------------|-----------------|
| Kernel Architect | Design multi-phase sort strategy | Morning (2h) |
| Infrastructure Engineer | Setup testing with various data distributions | Morning (2h) |
| Implementation Engineer | Implement CPU baseline | Morning (2.5h) |
| Optimization Specialist | Design shared memory histogram approach | Morning (2.5h) |
| **Team Integration** | Align on phase execution strategy | Midday (30m) |
| Kernel Architect | Implement phase 1 (histogram) | Afternoon (2h) |
| Infrastructure Engineer | Implement validation framework | Afternoon (2h) |
| Implementation Engineer | Implement phase 2 (scan) | Afternoon (2h) |
| Optimization Specialist | Implement phase 3 (scatter) | Afternoon (2h) |
| **Team Integration** | Final integration | Late afternoon (1h) |

**Achievable Goal**: Basic working implementation with limited data size optimization.

#### Fast Fourier Transform (FFT)

| Team Member | Responsibilities | Time Allocation |
|-------------|------------------|-----------------|
| Kernel Architect | Design butterfly pattern and memory layout | Morning (2.5h) |
| Infrastructure Engineer | Setup test cases and validation | Morning (2h) |
| Implementation Engineer | Implement CPU baseline | Morning (2.5h) |
| Optimization Specialist | Research optimal thread/block configuration | Morning (2h) |
| **Team Integration** | Review design and align on approach | Midday (30m) |
| Kernel Architect | Implement core FFT algorithm | Afternoon (2.5h) |
| Infrastructure Engineer | Create performance visualization | Afternoon (2h) |
| Implementation Engineer | Implement twiddle factor computation | Afternoon (2h) |
| Optimization Specialist | Optimize shared memory usage | Afternoon (2.5h) |
| **Team Integration** | Integration and demo preparation | Late afternoon (1h) |

**Achievable Goal**: Working implementation for power-of-2 sized inputs with basic optimizations.

#### Transformer Attention Block

| Team Member | Responsibilities | Time Allocation |
|-------------|------------------|-----------------|
| Kernel Architect | Design memory layout and compute strategy | Morning (3h) |
| Infrastructure Engineer | Setup environment with sample inputs | Morning (2h) |
| Implementation Engineer | Implement CPU reference version | Morning (3h) |
| Optimization Specialist | Design tiling strategy for QK^T computation | Morning (2h) |
| **Team Integration** | Review design approach | Midday (30m) |
| Kernel Architect | Implement Q, K, V projections | Afternoon (2.5h) |
| Infrastructure Engineer | Implement validation framework | Afternoon (2h) |
| Implementation Engineer | Implement softmax computation | Afternoon (2.5h) |
| Optimization Specialist | Implement final attention application | Afternoon (2h) |
| **Team Integration** | Partial integration, demo preparation | Late afternoon (1h) |

**Achievable Goal**: Simplified attention implementation with limited sequence length, focus on core algorithm correctness.

#### GPTQ Implementation Port

This project is too complex for a one-day hackathon with complete implementation, but a team could focus on one component:

| Team Member | Responsibilities | Time Allocation |
|-------------|------------------|-----------------|
| Kernel Architect | Understand original implementation, design porting strategy | Morning (3h) |
| Infrastructure Engineer | Setup test environment with pre-trained weights | Morning (2.5h) |
| Implementation Engineer | Implement CPU reference for quantization | Morning (3h) |
| Optimization Specialist | Research GPU-specific quantization optimizations | Morning (2.5h) |
| **Team Integration** | Scope reduction decision - select specific component | Midday (45m) |
| Kernel Architect | Implement core quantization kernel | Afternoon (3h) |
| Infrastructure Engineer | Create comparison tools for accuracy validation | Afternoon (2h) |
| Implementation Engineer | Implement weight packing/unpacking | Afternoon (2.5h) |
| Optimization Specialist | Optimize memory access patterns | Afternoon (2.5h) |
| **Team Integration** | Integration of components, demo preparation | Late afternoon (1h) |

**Achievable Goal**: Proof-of-concept for a single component (e.g., weight quantization or matrix multiplication with quantized weights).

## Collaboration Best Practices

1. **Morning Kickoff (30min)**
   - Select project based on team experience
   - Align on architecture and division of responsibilities
   - Establish communication channels and review points

2. **Development Environment**
   - Use Brev.dev with NVIDIA GPU for consistent environment
   - Set up shared repository following project structure standards
   - Prepare branch strategy for parallel development

3. **Follow Development Process Flow**
   - Start with project requirements understanding
   - Establish clear platform targets
   - Set up environment before coding
   - Apply GPU-specific optimizations only after baseline works
   - Implement testing and benchmarking framework early

4. **Integration Strategy**
   - Use scheduled integration points (midday, late afternoon)
   - Implement continuous integration if possible
   - Maintain modular code structure for easier merging
   - Keep communication open about interface changes

5. **Handling Limited Time**
   - Start with simplified problem definition
   - Create clear "minimum viable demo" goals
   - Have fallback plans for complex components
   - Prioritize correctness over performance initially
   - Prepare demo with visualization of both working code and performance metrics

## Recommended Project Selection

For a one-day hackathon with 4 team members, the most suitable projects (in order):

1. **Cumulative Sum** - Most achievable with time for optimizations
2. **Image Processing Kernels** - Visual results make for compelling demos
3. **Radix Sort** - Can be scoped appropriately with clear milestones
4. **FFT** - Consider only if team has prior experience with the algorithm

The Transformer Attention Block and GPTQ Implementation are too complex for complete implementation in a single day, but specific components could be targeted if the team has relevant expertise. 