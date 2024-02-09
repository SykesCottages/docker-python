ARG ARCH=amd64
FROM sykescottages/python:base-$ARCH

ARG PYTHON_VERSION=3.12.2

RUN curl https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz --output /tmp/Python.tgz && \
    echo $(sha384sum /tmp/Python.tgz) && \
    echo "42cf1535a01fa8bab166d6216a03d477bd9b3f0fddd28396eceea509be76c5268dde73892c8b18fa3caef4afefdef086  /tmp/Python.tgz" | sha384sum --check && \tar -xvf /tmp/Python.tgz -C /tmp && \
    tar -xvf /tmp/Python.tgz -C /tmp && \
    cd /tmp/Python-$PYTHON_VERSION && \
    ./configure && \
    make && \
    make install && \
    ln -s /usr/local/bin/python3 /usr/local/bin/python && \
    ln -s /usr/local/bin/pip3 /usr/local/bin/pip
