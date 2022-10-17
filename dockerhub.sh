#!/bin/bash

# You need to provide your own creds because #security
docker login

docker build --no-cache -t sykescottages/python:base base
docker push sykescottages/python:base

VERSIONS=( "2.7" "3.6" "3.7" "3.8" "3.9" "3.10" "3.11" )
for VERSION in "${VERSIONS[@]}"
do
  docker build --no-cache -t sykescottages/python:${VERSION} $VERSION
  docker push sykescottages/python:${VERSION}

  docker rmi sykescottages/python:${VERSION}
done

docker rmi sykescottages/python:base