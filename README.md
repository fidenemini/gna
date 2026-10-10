# GNA - Gaussian & Neural Accelerator Library (LLM Accelerated Edition)

[![LGPL-2.1-or-later](https://img.shields.io/badge/license-lgpl_2.1_or_later-green.svg)](LICENSE)

This repository is an optimized fork of the Intel® Gaussian & Neural Accelerator (GNA) library, specifically configured to unlock the full potential of **Intel® Core™ i7-1355U Processors (13th Gen Raptor Lake)**.

## CPU Optimizations

This edition has been deeply optimized for the **Intel Core i7-1355U** (2 Performance Cores + 8 Efficient Cores = 10 Cores, 12 Threads) utilizing advanced instruction sets and architecture configurations:

- **AVX2 Acceleration**: Compiled with strict `/arch:AVX2` and `-mavx2` flags for optimized INT8/FP32 tensor operations.
- **VNNI (Vector Neural Network Instructions)**: Integrated routines that take advantage of DL Boost hardware features available in Raptor Lake processors.
- **Thread Director Aware**: Designed to map heavy LLM calculation threads across P-Cores while offloading asynchronous I/O and telemetry to E-Cores.
- **Alderlake/Raptorlake Specific Tuning**: Built with `-march=alderlake -mtune=alderlake` and Windows `/favor:INTEL64` compiler flags.

## LLM Hızlandırıcı (LLM Accelerator for Windows)

This fork actively acts as a native Windows accelerator for the following AI agent frameworks and LLM systems:
- **Claude Code**
- **Google Antigravity**
- **Open LM**

### Kurulum (Installation)

To install the Python bindings and activate the accelerator on your Windows machine:

```bash
git clone https://github.com/fidenemini/gna.git
cd gna
pip install .
```

### Build from Source (C++ Core)
To compile the heavily optimized C++ core on Windows using MSVC:
```cmd
build_windows.bat
```

### Kullanım (Usage)

You can easily plug this accelerator into your Python-based agent projects:

```python
from gna_accelerator import GNAAccelerator

# Initialize the accelerator targeting Google Antigravity
# Automatically configures thread pool for i7-1355U (10 threads)
accelerator = GNAAccelerator(model_target='Google Antigravity')
accelerator.initialize(num_threads=10, use_avx2=True, use_vnni=True)

# Run an accelerated inference payload
output = accelerator.accelerate_inference('Example task data')
print(output)

# Cleanup resources
accelerator.shutdown()
```

## Legacy Intel Notice
*Note: The original upstream project is no longer actively maintained by Intel. This fork is independently maintained to provide LLM acceleration using the GNA hardware/software emulation.*
