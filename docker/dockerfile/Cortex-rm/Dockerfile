FROM frolvlad/alpine-glibc:latest

RUN apk add --no-cache \
    cmake \
    && apk --no-cache add --virtual build-dependencies \
    bzip2-dev \
    ca-certificates \
    openssl \
    tar \
    w3m \
    && wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/8-2019q3/RC1.1/gcc-arm-none-eabi-8-2019-q3-update-linux.tar.bz2 \
    && tar xvf gcc-arm-none-eabi-8-2019-q3-update-linux.tar.bz2 \
    && rm gcc-arm-none-eabi-8-2019-q3-update-linux.tar.bz2 \
    && apk del build-dependencies \
    && rm -rf /home/dev/gcc-arm-none-eabi-8-2019-q3-update/share/doc

ENV PATH="/home/dev/gcc-arm-none-eabi-8-2019-q3-update/bin:${PATH}"

WORKDIR /usr/project
