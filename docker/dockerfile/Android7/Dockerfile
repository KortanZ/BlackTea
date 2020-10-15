FROM ubuntu:bionic

LABEL maintainer="Kortan Zh <kortanzh@gmail.com>"

USER root

COPY entrypoint.sh /script/

ENV DEBIAN_FRONTEND noninteractive

# Install all OS dependencies
RUN apt-get update \
  && apt-get install -yq --no-install-recommends \
    wget \
    bzip2 \
    ca-certificates \
    git-core gnupg flex bison build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig \
    python openssl bc rsync openjdk-8-jdk \
    gosu \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir /work

# Configure environment
ENV SHELL=/bin/bash

ENV WORK=/work

WORKDIR /work

RUN chmod +x /script/entrypoint.sh

ENTRYPOINT ["/script/entrypoint.sh"]
