#!/bin/bash

docker-compose -f base/docker-compose.test.yml build --no-cache &&
  docker-compose -f base/docker-compose.test.yml run --rm sut

if [ $? -eq 0 ]; then
  echo "Base Image Test Passed"
else
  echo "Base Image Test Failed"
  exit
fi

VERSIONS=("2.7" "3.6" "3.7" "3.8" "3.9" "3.10" "3.11")
for VERSION in "${VERSIONS[@]}"; do
  docker-compose -f $VERSION/docker-compose.test.yml build --no-cache &&
    docker-compose -f $VERSION/docker-compose.test.yml run --rm sut

  if [ $? -eq 0 ]; then
    echo "$VERSION Image Test Passed"
  else
    echo "$VERSION Image Test Failed"
    exit
  fi

  docker-compose -f $VERSION/docker-compose.test.yml down
done
