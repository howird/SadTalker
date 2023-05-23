# choose ubuntu 20 since it comes with python3.8
ARG UBUNTU_VERSION=12.0.0-devel-ubuntu20.04

FROM nvidia/cuda:${UBUNTU_VERSION}

# bypass any required inputs
ENV DEBIAN_FRONTEND=noninteractive

# Set up dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential \ 
    wget curl software-properties-common git unzip

# install pip
RUN apt-get update && \
    apt-get install -y --no-install-recommends python3-pip && \
    ln -s $(which python3) /bin/python