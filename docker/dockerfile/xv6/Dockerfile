FROM archlinux:base-devel

LABEL maintainer="Kortan Zh <kortanzh@gmail.com>"

USER root

COPY entrypoint.sh /script/

# Install all OS dependencies
RUN pacman -Syu --noconfirm \
  && pacman -S --noconfirm \
    riscv64-linux-gnu-binutils riscv64-linux-gnu-gcc riscv64-linux-gnu-gdb qemu-arch-extra \
    git vim \
 && pacman -Scc --noconfirm

RUN mkdir /work

# Configure environment
ENV SHELL=/bin/bash

ENV WORK=/work

WORKDIR /work

RUN chmod +x /script/entrypoint.sh

ENTRYPOINT ["/script/entrypoint.sh"]
