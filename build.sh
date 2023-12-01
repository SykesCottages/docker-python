#!/bin/bash

VERSION=$1
LATEST_VERSION=$2

docker buildx build \
  --platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm64/v8 \
  --quiet \
  --no-cache \
  --push \
  -t sykescottages/python:${VERSION} \
  $VERSION

# Tagging latest version
if [[ "$LATEST_VERSION" == "$VERSION" ]]; then
  docker buildx build \
    --platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm64/v8 \
    --quiet \
    --no-cache \
    --push \
    -t sykescottages/python:latest \
    $VERSION
fi
