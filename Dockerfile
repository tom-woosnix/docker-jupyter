FROM python:3.13-slim

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install JupyterLab
RUN pip install --no-cache-dir jupyterlab

# Force PyTorch to look for CUDA 12.8 nightly/preview builds that support Blackwell (CC 12.0)
RUN pip install --no-cache-dir --pre torch torchvision \
    --index-url https://download.pytorch.org/whl/nightly/cu128

WORKDIR /workspace
