#!/bin/bash

PYTHON_VERSION=2.7.18
PIP_VERSION=20.3.4

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
    VERSION=$(python -c 'import sys; print(sys.version)'|head -n 1|awk '{print $1}')
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