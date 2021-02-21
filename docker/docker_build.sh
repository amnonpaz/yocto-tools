#!/bin/bash

VERSION=${1}
if [ -z "$VERSION" ] ; then
    echo "Please provide version"
    exit 1
fi

docker build --build-arg "HOST_UID=$(id -u)"  --build-arg "HOST_GID=$(id -g)" --tag yocto/builder:${VERSION} .
