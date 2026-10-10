@echo off
echo Configuring GNA for Windows...
mkdir build
cd build
cmake -A x64 ..
if %errorlevel% neq 0 (
    echo CMake configuration failed. Please ensure CMake is installed and in your PATH.
    exit /b %errorlevel%
)
echo Building GNA for Windows...
cmake --build . --config Release
if %errorlevel% neq 0 (
    echo Build failed. Please ensure Visual Studio build tools are installed.
    exit /b %errorlevel%
)
echo Build completed successfully.
cd ..
echo You can now install the Python wrapper for LLM acceleration using:
echo pip install .
