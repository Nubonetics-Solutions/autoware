#!/bin/bash

# Autoware options
IMAGE_NAME="chimney/autoware"
IMAGE_TAG=${IMAGE_TAG:-latest}
USER_ID=${USER_ID:-"$(id -u)"}
IMAGE=$IMAGE_NAME:$IMAGE_TAG

#RUNTIME="--runtime=nvidia"
RUNTIME="--gpus all"

XSOCK=/tmp/.X11-unix
XAUTH=$HOME/.Xauthority

SHARED_DOCKER_DIR=/home/autoware/shared_dir
SHARED_HOST_DIR=/home/$USER/shared_dir

VOLUMES="--volume=$XSOCK:$XSOCK:rw
         --volume=$XAUTH:$XAUTH:rw
         --volume=$SHARED_HOST_DIR:$SHARED_DOCKER_DIR:rw"

# Run Autoware
echo "Running ${IMAGE}"
docker run \
    -it --rm \
    $VOLUMES \
    --env="XAUTHORITY=${XAUTH}" \
    --env="DISPLAY=${DISPLAY}" \
    --env="USER_ID=$USER_ID" \
    --privileged \
    --net=host \
    $RUNTIME \
    $IMAGE \
    /bin/bash