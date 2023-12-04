#!/bin/bash

ARCH=$(arch)

# You need to provide your own creds because #security
docker login >> /dev/null 2>&1

if [ "x86_64" == "$ARCH" ]; then
  ARCH=amd64
elif [ "aarch64" == "$ARCH" ]; then
  ARCH=arm64
else
  echo "Architecture ${ARCH} not supported."
  exit 1
fi

./build.sh "base" $ARCH >> /dev/null 2>&1 &
./build.sh "base-legacy" $ARCH >> /dev/null 2>&1 &

wait

VERSIONS=($(find . -type d -regex '.*/[0-9]+\.[0-9]' | sort | sed 's/\.\///'))
for VERSION in "${VERSIONS[@]}"
do
  ./build.sh $VERSION $ARCH >> /dev/null 2>&1 &
done

wait
