---
description: This document defines the standard project structure and organization for our Mojo GPU programming project.
globs: 
alwaysApply: false
---
# Project Structure and Organization

This document defines the standard project structure and organization for our Mojo GPU programming project.

## Directory Structure

```
project_root/
├── src/
│   ├── kernels/          # GPU kernel implementations
│   │   ├── common/       # Shared kernel utilities
│   │   └── specialized/  # Task-specific kernels
│   ├── utils/           # Common utility functions
│   └── tests/           # Unit tests for kernels
├── benchmarks/          # Performance benchmarking code
│   ├── baseline/        # CPU baseline implementations
│   └── gpu/             # GPU implementation benchmarks
├── examples/            # Example usage and demonstrations
├── docs/               # Documentation
│   ├── api/            # API documentation
│   └── tutorials/      # Usage tutorials
└── tools/              # Development and build tools
```

## File Naming Conventions

- All Mojo source files use the `.🔥` extension
- Test files are prefixed with `test_`
- Benchmark files are prefixed with `bench_`
- Utility modules use lowercase with underscores
- Kernel files use descriptive names indicating their purpose

## Module Organization

### Kernel Modules
- Each kernel should be in its own file
- Complex kernels may be split into multiple files within a directory
- Include a `__init__.🔥` file in each directory to define the public API

### Test Organization
- Tests mirror the structure of the source code
- Each kernel has a corresponding test file
- Integration tests are in separate directories from unit tests

### Documentation Organization
- Each kernel has its own documentation file
- API documentation is generated from docstrings
- Examples include both code and explanation
- Performance characteristics are documented in benchmark results

## Version Control

### Branch Structure
- `main`: Stable production code
- `develop`: Integration branch for features
- `feature/*`: Individual feature branches
- `benchmark/*`: Performance testing branches
- `hotfix/*`: Emergency fixes

### Commit Guidelines
- Follow conventional commits format
- Reference issue numbers in commits
- Keep commits focused and atomic
- Include benchmark results for performance changes

## Build and Distribution

### Build Structure
- Use Modular's build system
- Keep build configuration in project root
- Separate debug and release builds
- Include optimization flags for GPU targets

### Distribution Package
- Include all necessary dependencies
- Provide clear installation instructions
- Include version information
- Document hardware requirements

## Development Workflow

### Feature Development
1. Create feature branch from `develop`
2. Implement feature with tests
3. Run benchmarks if performance-critical
4. Update documentation
5. Create pull request

### Code Review Process
1. Automated checks must pass
2. Performance regression tests reviewed
3. Documentation completeness verified
4. Code style compliance checked
5. Peer review required

### Integration Process
1. Merge feature to `develop`
2. Run full test suite
3. Run benchmark suite
4. Update documentation
5. Create release candidate

## Dependencies

### External Dependencies
- List all required Modular packages
- Document version requirements
- Include installation instructions
- Note any hardware dependencies

### Internal Dependencies
- Maintain clear module boundaries
- Document inter-module dependencies
- Version internal APIs
- Track breaking changes

## Configuration Management

### Environment Configuration
- Use environment variables for runtime config
- Document all configuration options
- Provide default configurations
- Include validation checks

### Build Configuration
- Separate debug/release configs
- Define optimization levels
- Configure for different GPU targets
- Document build options

## Monitoring and Profiling

### Performance Metrics
- Define key performance indicators
- Track kernel execution times
- Monitor memory usage
- Record GPU utilization

### Debug Information
- Include debug symbols in development
- Log relevant runtime information
- Track resource allocation
- Monitor error conditions

## Compliance

### Code Standards
- Follow rules in code-standards.mdc
- Maintain consistent style
- Document deviations
- Regular compliance checks

### GPU Programming Standards
- Follow rules in gpu-programming.mdc
- Optimize for target hardware
- Document performance characteristics
- Regular performance reviews

### Testing Standards
- Follow rules in testing-benchmarking.mdc
- Maintain test coverage
- Regular benchmark runs
- Document test cases