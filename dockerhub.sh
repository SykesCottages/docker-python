#!/bin/bash

LATEST_VERSION="3.12"

# You need to provide your own creds because #security
docker login >> /dev/null 2>&1

./build.sh "base" $LATEST_VERSION >> /dev/null 2>&1 &
./build.sh "base-legacy" $LATEST_VERSION >> /dev/null 2>&1 &

wait

VERSIONS=("3.10" "3.11" "3.12") #$(find . -type d -regex '.*/[0-9]+\.[0-9]' | sort | sed 's/\.\///'))
for VERSION in "${VERSIONS[@]}"
do
  ./build.sh $VERSION $LATEST_VERSION >> /dev/null 2>&1 &
done

wait
