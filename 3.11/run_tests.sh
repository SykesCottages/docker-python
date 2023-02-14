#!/bin/bash

PYTHON_VERSION=3.11.2
PIP_VERSION=22.3.1

itShouldCheckThatAllInstalledSoftwareExists() {
    doesCommandExist python
    doesCommandExist pip
}

itShouldMatchTheDesiredVersionOfPython() {
  doesPythonMatchVersion $PYTHON_VERSION
  doesPipMatchVersion $PIP_VERSION
}

doesCommandExist() {
    if ! [ -x "$(command -v $1)" ]; then
      echo "Error: $1 is not installed." >&2
      exit 1
    else
      echo "Success: $1 is installed." >&2
    fi
}

doesPythonMatchVersion() {
    VERSION=$(python --version|awk '{print $2}')
    if [ "$1" != "$VERSION" ]; then
      echo "Error: Python version expected \"$1\", but found \"$VERSION\"." >&2
      exit 1
    else
      echo "Success: Python version expected \"$1\" and found \"$VERSION\"." >&2
    fi
}

doesPipMatchVersion() {
    VERSION=$(pip --version|awk '{print $2}')
    if [ "$1" != "$VERSION" ]; then
      echo "Error: Pip version expected \"$1\", but found \"$VERSION\"." >&2
      exit 1
    else
      echo "Success: Pip version expected \"$1\" and found \"$VERSION\"." >&2
    fi
}

itShouldCheckThatAllInstalledSoftwareExists
itShouldMatchTheDesiredVersionOfPython