ARG ARCH=amd64
FROM sykescottages/python:base-$ARCH

ARG PYTHON_VERSION=3.12.3

RUN curl https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz --output /tmp/Python.tgz && \
    echo $(sha384sum /tmp/Python.tgz) && \
    echo "a17a463515ea4741f0c0b5bfc95fece01bffe8128e8c9fd41c0ba91b66d15e6e078505ee6306d36608b50d533f03a263  /tmp/Python.tgz" | sha384sum --check && \tar -xvf /tmp/Python.tgz -C /tmp && \
    tar -xvf /tmp/Python.tgz -C /tmp && \
    cd /tmp/Python-$PYTHON_VERSION && \
    ./configure && \
    make && \
    make install && \
    ln -s /usr/local/bin/python3 /usr/local/bin/python && \
    ln -s /usr/local/bin/pip3 /usr/local/bin/pip
