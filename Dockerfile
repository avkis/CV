# FROM nvidia/cuda:12.2.0-runtime-ubuntu22.04
# ENV DEBIAN_FRONTEND=noninteractive LANG=C TZ=UTC

FROM nvidia/cuda:12.0.1-cudnn8-runtime-ubuntu22.04

# install some basic utilities
RUN set -xue ;\
    apt update ;\
    apt install -y --no-install-recommends \
        build-essential \
        libsm6 \
        libxext6 \
        libxrender-dev \
        libglib2.0-0 \
        libgl1-mesa-glx \ 
        wget \
        python3-dev \
        python3-pip \
    ;\
    rm -rf /var/lib/apt/lists/*

# install libs and frameworks
RUN pip3 install --upgrade pip ;\
    pip3 install setuptools ;\
    pip3 install numpy ;\
    pip3 install matplotlib ;\
    pip3 install opencv-python ;\
    pip3 install torch torchvision ;\
    pip3 install tensorflow ;\
    pip3 install patched_yolo_infer ;\
    pip3 install scikit-learn ;\
    pip3 install jupyterlab

WORKDIR /playground

# run the command
# CMD ["/bin/bash"]
CMD ["jupyter", "lab", "--port=8789", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
