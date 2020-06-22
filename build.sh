#!/bin/bash -ex

MAJOR=1
MINOR=1
REVISION=${MAJOR}.${MINOR}.`git rev-list --count HEAD`
if [ -f version ]; then
    VERSION=`cat version`
    REVISION=$(echo $VERSION|tr -d '\n')
fi


SCRIPT_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
export PROJECT_ID=rapidfort

export DOCKER_IMAGE_NAME=${PROJECT_ID}/alpshell
docker build -t ${DOCKER_IMAGE_NAME}:${REVISION} -t ${DOCKER_IMAGE_NAME}:latest -f Dockerfile.alpine .
docker push ${DOCKER_IMAGE_NAME}:latest

export DOCKER_IMAGE_NAME=${PROJECT_ID}/debshell
docker build -t ${DOCKER_IMAGE_NAME}:${REVISION} -t ${DOCKER_IMAGE_NAME}:latest -f Dockerfile.debian .
docker push ${DOCKER_IMAGE_NAME}:latest

export DOCKER_IMAGE_NAME=${PROJECT_ID}/pyshell
docker build -t ${DOCKER_IMAGE_NAME}:${REVISION} -t ${DOCKER_IMAGE_NAME}:latest -f Dockerfile.python .
docker push ${DOCKER_IMAGE_NAME}:latest

export DOCKER_IMAGE_NAME=${PROJECT_ID}/gcp-platform
docker build -t ${DOCKER_IMAGE_NAME}:${REVISION} -t ${DOCKER_IMAGE_NAME}:latest -f Dockerfile.gcp-alpine .
docker push ${DOCKER_IMAGE_NAME}:latest

