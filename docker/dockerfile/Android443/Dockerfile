FROM ubuntu:16.04
MAINTAINER kortanzh (contact@kortanzh.com)

#not show select dialog when installing dependency packages
ARG DEBIAN_FRONTEND=noninteractive

COPY jdk-6u45-linux-x64.bin /usr/lib/java/
COPY make-3.81.tar.gz /opt/

RUN echo "Installing packages==============================" \
&& apt-get update \
&& apt-get install -y --no-install-recommends software-properties-common \
&& add-apt-repository ppa:git-core/ppa \
&& apt-get update \
&& apt-get install -y --no-install-recommends liblzo2-dev liblzo2-2 liblz-dev uuid-dev uuid u-boot-tools lzop git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev libgl1-mesa-dev libxml2-utils xsltproc unzip \
&& apt-get install -y --no-install-recommends vim python file libatm1:amd64 libpopt0:amd64 sgml-base xml-core bc gawk\
&& echo "Installing Java==============================" \
&& cd /usr/lib/java/ \
&& chmod a+x jdk-6u45-linux-x64.bin \
&& ./jdk-6u45-linux-x64.bin \
&& echo 'export JAVA_HOME=/usr/lib/java/jdk1.6.0_45' >> /root/.bashrc \
&& echo 'export JRE_HOME=${JAVA_HOME}/jre' >> /root/.bashrc \
&& echo 'export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib' >> /root/.bashrc \
&& echo 'export PATH=${JAVA_HOME}/bin:$PATH' >> /root/.bashrc \
&& echo "Installing make 3.81==============================" \
&& cd /opt \
&& tar -xzvf make-3.81.tar.gz \
&& cd /opt/make-3.81 \
&& ./configure \
&& make \
&& make install \
&& cd / \
&& echo "Adding USER env==============================" \
&& echo "export USER=root" >> /root/.bashrc \
&& echo "Cleaning==============================" \
&& rm -rf /opt/make-3.81 \
&& rm -rf /opt/make-3.81.tar.gz \
&& rm -rf /usr/lib/java/jdk-6u45-linux-x64.bin \
&& apt-get clean \
&& apt-get autoremove \
&& rm -rf /var/lib/apt/lists/* \
&& rm -rf /tmp