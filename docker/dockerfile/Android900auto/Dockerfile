FROM ubuntu:16.04
MAINTAINER kortanzh (contact@kortanzh.com)

# use root as user
USER root

# copy files
COPY gcc-arm-none-eabi-9-2019-q4-major-x86_64-linux.tar.bz2 /
COPY cmake-3.16.1-Linux-x86_64.tar.gz /

ENV ARMGCC_DIR=/opt/gcc-arm-none-eabi-9-2019-q4-major

#not show select dialog when installing dependency packages
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
&& apt-get install -y --no-install-recommends git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache libgl1-mesa-dev libxml2-utils xsltproc unzip \
&& apt-get install -y --no-install-recommends python openssl bc rsync \
&& tar -xjf gcc-arm-none-eabi-9-2019-q4-major-x86_64-linux.tar.bz2 -C /opt \
&& tar -xzvf cmake-3.16.1-Linux-x86_64.tar.gz --strip-components 1 -C /usr/local \
&& rm -rf gcc-arm-none-eabi-9-2019-q4-major-x86_64-linux.tar.bz2 \
&& rm -rf cmake-3.16.1-Linux-x86_64.tar.gz \
&& apt-get clean && apt-get autoremove \
&& rm -rf /var/lib/apt/lists/* \
&& rm -rf /tmp/*

