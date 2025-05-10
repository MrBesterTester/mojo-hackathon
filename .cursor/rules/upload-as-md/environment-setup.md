---
description: This document outlines the steps to set up a complete environment for Mojo GPU programming using Modular Platform 25.3.nt outlines the steps to set up a complete environment for Mojo GPU programming using Modular Platform 25.3.
globs: 
alwaysApply: false
---
# Mojo GPU Programming Environment Setup

This document outlines the steps to set up a complete environment for Mojo GPU programming using Modular Platform 25.3.

The environment for running the Modular Platform breaks down into three aspects:
- Operating system: macOS (both Intel and M-series), Ubuntu
- Cloud services: Google Colab, @web https://brev.nvidia.com
- GPU targets: mostly nVidia with some AMD and no M-series GPUs

Each combination of three aspects is a platform and are itemized and described in [platforms.mdc](mdc:.cursor/rules/platforms.mdc). 

## Installation Steps for Ubuntu or macOS on M-series processor

For Intel macOS, set up Ubuntu 22.04 or 20
- Ensure the Parallels VM is properly configured with appropriate RAM and CPU allocation
- Enable GPU pass-through in Parallels settings if available
- Recommended: Enable file sharing so that files are stored on macOS host but r/w/x on the Ubuntu VM.

Forr nVidia's Brev cloud for Ubuntu 22.04 or 20

- Configure the launchable for the GPU you're targeting and the Docker container or VM you want to use.
- If you're using a Docker container the Modular Platform may already be installed.  But be sure the Modular Platform is up to date to 25.3. 

### 2. Install Modular Platform using Magic

```bash
# Update package lists
sudo apt-get update

# Install dependencies
sudo apt-get install -y curl

# Download and install the Magic CLI tool
curl https://get.modular.com | sh -

# Add Magic to your PATH (you may need to restart your terminal)
modular auth

# Install Modular MAX
modular install max
```

### 3. Verify Installation

```bash
# Check installed version
modular --version

# Verify Mojo is installed properly
mojo --version
```

### 4. Set up GPU Development Environment

```bash
# Install required GPU development packages as needed
# This will depend on your specific hardware and requirements
```

### 5. Configure Environment Variables

```bash
# Add these to your ~/.bashrc or ~/.zshrc
echo 'export PATH="$HOME/.modular/pkg/packages.modular.com_max/bin:$PATH"' >> ~/.bashrc
echo 'export MODULAR_HOME="$HOME/.modular"' >> ~/.bashrc
source ~/.bashrc
```

### 6. Test GPU Access

Note: there is no support for M-series Apple GPUs, and not much for AMD GPUs.  So the number of GPUs returned here will be like be zero.

```bash
# Create a simple test file to verify GPU access
mojo -c "from sys import gpu_count; print('Number of GPUs:', gpu_count())"
```

## Development Tools Setup

### IDE Configuration
- VS Code with Mojo extension
- Cursor editor with Mojo support
Note: this may require for the IDE to be running on the platform rather than thru SSH.

### Debugging Tools - Linux only
- Install necessary debugging tools
```bash
sudo apt-get install -y gdb
```
### Debugging Tools - macOS M-series
- Use the equivalent brew tool.

## Installation for Google Colab

In the Colab notebook:
```python
!pip install mojo
```

## Resources and Documentation
- Modular Documentation: @web https://docs.modular.com
- Mojo Programming Manual: @web https://docs.modular.com/mojo/manual/
- Mojo Tutorials: @web https://docs.modular.com/max/tutorials
- Example Source Code: @web https://github.com/modular/modular/tree/main/examples/mojo
