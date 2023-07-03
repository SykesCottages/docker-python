#!/bin/bash

LATEST_VERSION="3.11"

# You need to provide your own creds because #security
docker login >> /dev/null 2>&1

VERSIONS=( "base" "base-legacy" "2.7" "3.6" "3.7" "3.8" "3.9" "3.10" "3.11" )
for VERSION in "${VERSIONS[@]}"
do
  ./build.sh $VERSION $LATEST_VERSION >> /dev/null 2>&1 &
done

wait
