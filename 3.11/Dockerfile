FROM sykescottages/python:base

ARG PYTHON_VERSION=3.11.0
ARG SUFFIX=rc2

RUN curl https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION$SUFFIX.tgz --output /tmp/Python.tgz && \
    echo $(sha384sum /tmp/Python.tgz) && \
    echo "6bab625470ce339905b2348c577eb6e5a1b9317509158b5f4f7a7b5054ef560b3aee2518d207a83ab6a53bd8cc808f71  /tmp/Python.tgz" | sha384sum --check && \tar -xvf /tmp/Python.tgz -C /tmp && \
    tar -xvf /tmp/Python.tgz -C /tmp && \
    cd /tmp/Python-$PYTHON_VERSION$SUFFIX && \
    ./configure && \
    make && \
    make install && \
    ln -s /usr/local/bin/python3 /usr/local/bin/python && \
    ln -s /usr/local/bin/pip3 /usr/local/bin/pip
