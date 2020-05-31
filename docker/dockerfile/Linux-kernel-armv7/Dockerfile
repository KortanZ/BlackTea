FROM dockcross/linux-armv7

ENV DEFAULT_DOCKCROSS_IMAGE linux-kernel-armv7
RUN apt-get update && apt-get install -y --no-install-recommends libssl-dev u-boot-tools \
&& apt-get clean && apt-get autoremove && rm -rf /tmp
