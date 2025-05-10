---
description: 
globs: 
alwaysApply: false
---
# Mojo GPU Development Workflow

This document outlines the development workflow through a series of Jira tickets, providing a step-by-step guide for implementing GPU kernels using Mojo on MacBook with AMD Radeon hardware.

## Epic: GPU Kernel Development Project Setup and Implementation

### SETUP-1: Project Overview and Platform Selection
**Priority:** Highest
**Story Points:** 3

**Description:**
Review project requirements and select appropriate target platform for Mojo GPU kernel development.

**Acceptance Criteria:**
1. Documented understanding of:
   - Project requirements and objectives
   - Types of GPU kernels to implement
   - Testing approach (CPU vs. GPU comparisons)
   - Selected target platform with justification

**Technical Details:**
- Review project-overview.mdc documentation
- Assess platforms.mdc for hardware compatibility
- Select from available platforms:
  - MacBook2018 with AMD Radeon Pro Vega 20
  - iMacM1 (SIMD only)
  - Google Colab
  - Brev with NVIDIA GPUs

**Steps:**
1. Study project requirements
2. Analyze hardware needs for selected kernel
3. Document platform selection decision
4. Identify hardware-specific constraints

**Deliverables:**
- Platform selection document
- Initial architectural diagram
- Preliminary performance targets

### SETUP-2: Environment Configuration
**Priority:** Highest
**Story Points:** 5

**Description:**
Set up the development environment based on selected platform for Mojo GPU kernel development.

**Acceptance Criteria:**
1. Successfully installed and configured:
   - OS environment (Parallels VM with Ubuntu 22.04 if MacBook2018)
   - Cursor IDE
   - Modular Platform 25.3
   - Mojo SDK
   - Required development tools

**Technical Details:**
- Follow environment-setup.mdc guidelines
- Platform-specific configuration:
  - MacBook Pro (2018): Parallels VM with GPU passthrough
  - iMacM1: Native installation
  - Colab/Brev: Cloud configuration

**Steps:**
1. Install OS/VM if required
   ```bash
   # Download from Parallels website
   # Install Ubuntu 22.04 ISO
   ```

2. Configure computing resources
   - Allocate memory appropriately
   - Enable GPU access
   - Configure CPU cores

3. Install development tools
   ```bash
   curl https://get.modular.com | sh -
   modular auth
   modular install mojo
   ```

4. **Important:** Verify the compatibility of all required libraries to avoid dependency conflicts.

**Verification:**
```bash
# Verify Mojo installation
mojo --version

# Verify GPU support
mojo gpu-check

# Test basic GPU kernel
mojo run tests/gpu_sanity_check.🔥
```

### SETUP-3: Project Structure Implementation
**Priority:** High
**Story Points:** 3

**Description:**
Establish project structure according to project standards and set up version control.

**Technical Details:**
- Follow project-structure.mdc guidelines
- Implement directory structure for:
  - Source code (kernels, utils)
  - Tests
  - Benchmarks
  - Documentation

**Steps:**
1. Create directory structure
   ```bash
   mkdir -p src/{kernels/{common,specialized},utils,tests}
   mkdir -p benchmarks/{baseline,gpu}
   mkdir -p {examples,docs/{api,tutorials},tools}
   ```

2. Initialize version control
   ```bash
   git init
   git branch -M main
   git branch develop
   git checkout develop
   ```

3. Add configuration files
   - Add .gitignore
   - Create build configuration
   - Set up test framework

**Deliverables:**
- Complete project skeleton
- Initial commit with README
- Build configuration

### SETUP-4: Code Standards Implementation
**Priority:** High
**Story Points:** 2

**Description:**
Establish code standards templates and documentation guidelines.

**Technical Details:**
- Based on code-standards.mdc
- Create template files for:
  - Kernel implementations
  - Documentation
  - Tests and benchmarks

**Steps:**
1. Create documentation templates
2. Establish linting configuration
3. Set up code style enforcement tools
4. Create example files demonstrating standards

**Deliverables:**
- Documentation templates
- Code style configuration
- Example files

### IMPL-1: Kernel Design and GPU Programming Approach
**Priority:** High
**Story Points:** 5

**Description:**
Design the GPU kernel architecture and optimization approach before implementation.

**Technical Details:**
- Follow gpu-programming.mdc guidelines
- Determine:
  - Thread organization
  - Memory access patterns
  - Optimization strategies

**Steps:**
1. Research optimal algorithms for target GPU
2. Design memory hierarchy usage
3. Plan thread organization
4. Create pseudocode for implementation
5. Document expected performance characteristics

**Deliverables:**
- Kernel design document
- Performance optimization strategy
- Thread/memory organization diagrams
- Pseudocode implementation

### IMPL-2: Transformer Attention Block Implementation
**Priority:** High
**Story Points:** 8

**Description:**
Implement the transformer attention block optimized for selected platform.

**Technical Specifications:**
- Multi-head attention support
- Configurable sequence lengths
- Optimized memory access patterns
- SIMD vectorization

**Implementation Details:**
1. Create CPU reference implementation
2. Develop optimized GPU implementation
3. Apply platform-specific optimizations
4. Document implementation details

### IMPL-3: Fast Fourier Transform (FFT) Implementation
**Priority:** High
**Story Points:** 8

**Description:**
Implement GPU-accelerated FFT supporting 1D, 2D, and 3D transforms.

**Technical Specifications:**
- Support for multiple dimensions
- In-place and out-of-place transforms
- Power-of-two size optimization
- Batched operation support

### IMPL-4: Cumulative Sum Implementation
**Priority:** Medium
**Story Points:** 5

**Description:**
Implement parallel cumulative sum operation.

**Technical Specifications:**
- Support for arbitrary input sizes
- Both inclusive and exclusive scan
- Work-efficient parallel algorithm
- Optimized memory access pattern

### IMPL-5: Image Processing Kernels
**Priority:** Medium
**Story Points:** 6

**Description:**
Implement convolution and NMS operations.

**Technical Specifications:**
- Configurable kernel sizes
- Optimized border handling
- Efficient memory access patterns
- Support for various input formats

### IMPL-6: Radix Sort Implementation
**Priority:** Medium
**Story Points:** 5

**Description:**
Implement GPU-accelerated radix sort.

**Technical Specifications:**
- Configurable radix size
- Key-value pair support
- Work-efficient algorithm
- Optimized memory access

### TEST-1: Testing and Benchmarking Implementation
**Priority:** High
**Story Points:** 5

**Description:**
Develop comprehensive testing and benchmarking suite following project guidelines.

**Technical Details:**
- Follow testing-benchmarking.mdc specifications
- Implement both unit and integration tests
- Create performance benchmarks
- Develop automated test pipelines

**Steps:**
1. Create test harness for CPU/GPU comparison
2. Implement unit tests for all kernels
3. Develop benchmarking framework
4. Create performance regression tests
5. Document testing methodology

**Deliverables:**
- Complete test suite
- Benchmark framework
- Test documentation
- Initial performance results

### DOC-1: Documentation and Example Usage
**Priority:** Medium
**Story Points:** 3

**Description:**
Create comprehensive documentation and usage examples.

**Technical Details:**
- Follow README.mdc format for examples
- Document API and usage patterns
- Provide performance characteristics
- Include optimization guidelines

**Steps:**
1. Write API documentation
2. Create usage examples
3. Document performance characteristics
4. Write troubleshooting guides

**Deliverables:**
- API documentation
- Example code
- Performance guidelines
- Troubleshooting documentation

## Development Guidelines

### Sequential Development Approach
Follow the documented development reading order:
1. Understand project requirements (project-overview.mdc)
2. Identify target platform constraints (platforms.mdc)
3. Configure development environment (environment-setup.mdc)
4. Structure project appropriately (project-structure.mdc)
5. Adhere to coding standards (code-standards.mdc)
6. Apply GPU optimization techniques (gpu-programming.mdc)
7. Implement testing strategy (testing-benchmarking.mdc)
8. Follow usage patterns (README.mdc)

### Performance Requirements
- Target 80% GPU utilization
- Minimize host-device transfers
- Optimize memory access patterns
- Use efficient algorithms

### Testing Requirements
- 100% test coverage for critical paths
- Performance regression tests
- Memory leak checks
- Error handling verification

## Delivery Process

1. **Development:**
   - Create feature branch from develop
   - Implement functionality following design
   - Add unit and integration tests
   - Document code according to standards

2. **Review:**
   - Code review against standards
   - Performance review with benchmarks
   - Documentation completeness check
   - Test coverage verification

3. **Testing:**
   - Run comprehensive test suite
   - Verify against CPU implementation
   - Execute benchmarks on target hardware
   - Validate documentation

4. **Deployment:**
   - Merge to develop branch
   - Create release candidate
   - Final verification
   - Merge to main and tag release

## Dependencies

- Mojo SDK 25.3
- Modular Platform Tools
- Platform-specific requirements
- Testing Framework
- Benchmark Suite

## Risk Management

1. **Technical Risks:**
   - GPU driver compatibility
   - Performance optimization challenges
   - Memory management issues
   - Platform-specific limitations

2. **Mitigation Strategies:**
   - Regular testing on target hardware
   - Performance profiling
   - Frequent code reviews
   - Memory analysis
   - Platform-specific testing

## Success Criteria

1. All kernels pass unit and integration tests
2. Performance meets or exceeds targets on selected platform
3. Documentation follows project standards
4. Code adheres to established conventions
5. Both CPU and GPU implementations function correctly
6. Results comparison within tolerance threshold

## Support and Maintenance

- Regular updates for compatibility
- Performance optimization
- Bug fixes
- Documentation updates