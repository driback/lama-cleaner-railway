FROM python:3.10.11-slim-buster

ENV PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PORT=8080

RUN apt-get update && apt-get install -y --no-install-recommends \
    libsm6 \
    libxext6 \
    ffmpeg \
    libfontconfig1 \
    libxrender1 \
    libgl1-mesa-glx \
    curl \
    gcc \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip && \
    pip install torch==1.13.1 torchvision==0.14.1 \
      --extra-index-url https://download.pytorch.org/whl/cpu

ARG LAMA_CLEANER_VERSION=1.2.5

RUN pip install lama-cleaner==${LAMA_CLEANER_VERSION} && \
    lama-cleaner --install-plugins-package

ENV LD_PRELOAD=/usr/local/lib/python3.10/site-packages/skimage/_shared/../../scikit_image.libs/libgomp-d22c30c5.so.1.0.0

EXPOSE 8080

CMD ["sh", "-c", "exec lama-cleaner --model=lama --device=cpu --host=0.0.0.0 --port=${PORT:-8080}"]
