FROM ubuntu:22.04
LABEL MAINTAINER="Amnon Paz" MAINTAINER_EMAIL="<pazamnon@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive

ARG HOST_GID
ARG HOST_UID
ARG USERNAME

ENV USER=${USERNAME}
ARG PASSWORD

ENV HOME=/home/${USER}

# Installing required packages
RUN apt-get update && apt-get -y install \
    apt-utils \
    build-essential \
    chrpath \
    cpio \
    curl \
    daemon \
    debianutils \
    diffstat \
    file \
    gawk \
    gcc-multilib \
    git-core \
    iputils-ping \
    kmod \
    liblz4-dev \
    libsdl1.2-dev \
    lighttpd \
    locales \
    lz4 \
    openssl \
    python3 \
    python3-aptdaemon.gtk3widgets \
    python3-gi \
    python3-pexpect \
    python3-pip \
    python3-pip \
    python3-virtualenv \
    socat \
    sudo \
    texinfo \
    tzdata \
    uml-utilities \
    unzip \
    vim \
    wget \
    xterm \
    xz-utils \
    zstd && \
    apt-get autoremove -y && apt-get autoclean -y && \
    rm -rf /var/lib/apt/lists/*

# Install repo
RUN curl -o /usr/local/bin/repo https://storage.googleapis.com/git-repo-downloads/repo && chmod a+x /usr/local/bin/repo

RUN dpkg-reconfigure locales && locale-gen en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LANG=en_US.utf8

# Replace dash with bash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN groupadd -g ${HOST_GID} ${USER} && useradd --password $(openssl passwd -1 ${PASSWORD}) --shell /bin/bash -g ${HOST_GID} ${USER} -d ${HOME} --uid ${HOST_UID}
RUN usermod -aG sudo ${USER} && usermod -aG users ${USER}
USER ${USER}

WORKDIR ${HOME}
