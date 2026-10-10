from setuptools import setup, find_packages

setup(
    name="gna-accelerator",
    version="1.0.0",
    description="Intel GNA Accelerator Wrapper for Claude Code, Google Antigravity, and Open LM",
    author="GNA Team",
    packages=find_packages(),
    py_modules=["gna_accelerator"],
    install_requires=[],
    classifiers=[
        "Programming Language :: Python :: 3",
        "Operating System :: Microsoft :: Windows",
    ],
)
