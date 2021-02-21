FROM ubuntu:18.04
MAINTAINER Amnon Paz <pazamnon@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

ARG HOST_GID
ARG HOST_UID

# Installing required packages
RUN apt-get update && apt-get -y install kmod gawk wget git-core diffstat unzip texinfo \
gcc-multilib build-essential chrpath socat cpio python python3 python3-pip python3-pexpect xz-utils debianutils \
iputils-ping libsdl1.2-dev xterm curl vim tzdata locales apt-utils

# for tunctl (qemu)
RUN apt-get -y install uml-utilities

# for toaster
RUN apt-get -y install python-virtualenv daemon

# for package feeds
RUN apt-get -y install lighttpd

# for bitbake -g
RUN apt-get -y install python3-gi python-pip python3-aptdaemon.gtk3widgets

# Configure a UTF8-capable locale
RUN apt-get -y install locales apt-utils sudo && dpkg-reconfigure locales && locale-gen en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LANG en_US.utf8

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Replace dash with bash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Install repo
RUN curl -o /usr/local/bin/repo https://storage.googleapis.com/git-repo-downloads/repo && chmod a+x /usr/local/bin/repo

ENV USER yocto
ENV HOME /home/${USER}

# Creating a new user "yocto" with an empty password
RUN groupadd -g ${HOST_GID} ${USER} && useradd --password U6aMy0wojraho --shell /bin/bash -g ${HOST_GID} ${USER} -d ${HOME} --uid ${HOST_UID}
RUN usermod -aG sudo ${USER} && usermod -aG users ${USER}
RUN mkdir -p ${HOME}/workspace 

RUN apt-get autoremove -y && apt-get autoclean -y

USER yocto
WORKDIR ${HOME}

