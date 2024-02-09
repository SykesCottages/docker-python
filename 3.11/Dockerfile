ARG ARCH=amd64
FROM sykescottages/python:base-$ARCH

ARG PYTHON_VERSION=3.11.8

RUN curl https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz --output /tmp/Python.tgz && \
    echo $(sha384sum /tmp/Python.tgz) && \
    echo "f11b64d00f4eb24188508b446a26f5f351a76d3038583131cd0e84acc98656746a4a6e3e95313745d50eaea000e8cc06  /tmp/Python.tgz" | sha384sum --check && \tar -xvf /tmp/Python.tgz -C /tmp && \
    tar -xvf /tmp/Python.tgz -C /tmp && \
    cd /tmp/Python-$PYTHON_VERSION && \
    ./configure && \
    make && \
    make install && \
    ln -s /usr/local/bin/python3 /usr/local/bin/python && \
    ln -s /usr/local/bin/pip3 /usr/local/bin/pip
