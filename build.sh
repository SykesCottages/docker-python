#!/bin/bash

VERSION=$1
LATEST_VERSION=$2

docker build --no-cache -t sykescottages/python:${VERSION} $VERSION
docker push sykescottages/python:${VERSION}

# Tagging latest version
if [[ "$LATEST_VERSION" == "$VERSION" ]]; then
  docker tag sykescottages/python:${VERSION} sykescottages/python:latest
  docker push sykescottages/python:latest
  docker rmi sykescottages/python:latest
fi

docker rmi sykescottages/python:${VERSION}
