# GNA - Gaussian & Neural Accelerator Library (LLM Accelerated Edition)

[![LGPL-2.1-or-later](https://img.shields.io/badge/license-lgpl_2.1_or_later-green.svg)](LICENSE)

This repository is a deeply optimized fork of the Intel® Gaussian & Neural Accelerator (GNA) library. It has been actively re-engineered to act as a robust **LLM Accelerator** on Windows for **Claude Code, Google Antigravity, and Open LM**.

While it was initially fine-tuned to unlock the full potential of the **Intel® Core™ i7-1355U (13th Gen Raptor Lake)**, its configuration has been made dynamic and highly portable. The code is now clear, optimized, and guaranteed to work seamlessly across all relevant modern CPUs.

## Universal CPU Optimizations

This edition dynamically scales and utilizes the advanced capabilities of the host processor:

- **Dynamic Topology Detection**: Automatically identifies the physical/logical core layout (e.g., properly assigning thread pools for hybrid architectures like Intel's 2 P-Cores + 8 E-Cores).
- **AVX2 & FMA Acceleration**: Hardened with strict compiler flags (`/arch:AVX2 /favor:INTEL64` on MSVC, `-mavx2 -mfma` on GCC/Clang) for high-throughput INT8 and FP32 tensor math.
- **VNNI (DL Boost) Integration**: Activates Vector Neural Network Instructions dynamically when supported by the processor, vastly improving AI inference tasks.
- **Portable Optimizations**: Built with aggressive `-O3` / `/O2` and fast-math enabled across all relevant x64 processors without artificially restricting architecture support.

## Installation

To install the Python bindings and activate the accelerator natively on your Windows machine:

```bash
git clone https://github.com/fidenemini/gna.git
cd gna
pip install .
```

### Build from Source (C++ Core)
To compile the heavily optimized C++ core natively using MSVC (Visual Studio Build Tools):
```cmd
build_windows.bat
```

## Usage

You can easily integrate this accelerator into your LLM and Python-based agent projects:

```python
from gna_accelerator import GNAAccelerator

# Initialize the accelerator targeting Google Antigravity
# The wrapper will auto-detect your CPU and spin up the optimized thread pool
accelerator = GNAAccelerator(model_target='Google Antigravity')
accelerator.initialize(use_avx2=True, use_vnni=True)

# Run an accelerated inference payload
output = accelerator.accelerate_inference('Example task data')
print(output)

# Cleanup resources
accelerator.shutdown()
```

## Notice
*Note: The original upstream project is no longer actively maintained by Intel. This fork is independently developed to provide LLM acceleration utilizing GNA hardware/software emulation on modern PCs.*
