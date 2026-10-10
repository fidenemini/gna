@echo off
setlocal EnableDelayedExpansion

echo Configuring GNA for Windows...

:: Check if CMake is installed
where cmake >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] CMake is not recognized as an internal or external command.
    echo Please install CMake and ensure it is added to your system PATH.
    exit /b 1
)

if not exist build (
    mkdir build
)
cd build

echo Generating CMake project...
cmake -A x64 ..
if %errorlevel% neq 0 (
    echo [ERROR] CMake configuration failed.
    exit /b %errorlevel%
)

echo Building GNA for Windows (Release with AVX2/VNNI optimizations)...
cmake --build . --config Release
if %errorlevel% neq 0 (
    echo [ERROR] Build failed. Please ensure Visual Studio Build Tools (C++) are installed.
    exit /b %errorlevel%
)

echo.
echo [SUCCESS] Build completed successfully.
cd ..
echo You can now install the Python wrapper for LLM acceleration using:
echo pip install .
