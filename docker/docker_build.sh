#!/bin/bash

IMAGE_NAME=${1}
if [ -z "$IMAGE_NAME" ] ; then
    echo "Please provide image name"
    exit 1
fi

docker build --build-arg USERNAME=$(id -nu) --build-arg PASSWORD=$(id -nu) --build-arg HOST_UID=$(id -u) --build-arg HOST_GID=$(id -g) --tag ${IMAGE_NAME} .
