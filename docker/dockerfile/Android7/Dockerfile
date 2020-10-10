FROM ubuntu:bionic

LABEL maintainer="Kortan Zh <kortanzh@gmail.com>"
ARG NB_USER="adam"
ARG NB_UID="1000"
ARG NB_GID="1000"

# Fix DL4006
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

USER root

ENV DEBIAN_FRONTEND noninteractive

# Install all OS dependencies
RUN apt-get update \
  && apt-get install -yq --no-install-recommends \
    wget \
    bzip2 \
    ca-certificates \
    git-core gnupg flex bison build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig \
    python openssl bc rsync openjdk-8-jdk \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

# Configure environment
ENV SHELL=/bin/bash \
    NB_USER=$NB_USER \
    NB_UID=$NB_UID \
    NB_GID=$NB_GID \

ENV HOME=/home/$NB_USER

# Create NB_USER
RUN useradd -m -s /bin/bash -U -u $NB_UID $NB_USER

USER $NB_UID

# Setup work directory for backward-compatibility
RUN mkdir /home/$NB_USER/work

WORKDIR $HOME
