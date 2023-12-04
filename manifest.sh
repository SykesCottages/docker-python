#!/bin/bash

export DOCKER_CLI_EXPERIMENTAL=enabled
LATEST_VERSION="3.12"

docker login >>/dev/null 2>&1

TAG="sykescottages/python:base"
docker manifest create $TAG \
  --amend "$TAG-amd64" \
  --amend "$TAG-arm64"
docker manifest push $TAG

TAG="sykescottages/python:base-legacy"
docker manifest create $TAG \
  --amend "$TAG-amd64" \
  --amend "$TAG-arm64"
docker manifest push $TAG

VERSIONS=($(find . -type d -regex '.*/[0-9]+\.[0-9]+' | sort | sed 's/\.\///'))
for VERSION in "${VERSIONS[@]}"; do
  TAG="sykescottages/python:${VERSION}"
  docker manifest create $TAG \
    --amend "$TAG-amd64" \
    --amend "$TAG-arm64"
  docker manifest push $TAG
done

TAG="sykescottages/python:latest"
LATEST_TAG="sykescottages/python:$LATEST_VERSION"
docker manifest create $TAG \
  --amend "$LATEST_TAG-amd64" \
  --amend "$LATEST_TAG-arm64"
docker manifest push $TAG
