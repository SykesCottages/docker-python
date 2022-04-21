FROM sykescottages/python:base

ARG PYTHON_VERSION=3.9.12

RUN curl https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz --output /tmp/Python.tgz && \
    echo "d7c4f31f3b01b7fb5e6101231421a1082b1f5aa5e6955f0ff276af2730ac7a503442986b37aaf0ed0caf8ccaff8ade84  /tmp/Python.tgz" | sha384sum --check && \
    tar -xvf /tmp/Python.tgz -C /tmp && \
    cd /tmp/Python-$PYTHON_VERSION && \
    ./configure && \
    make && \
    make install && \
    ln -s /usr/local/bin/python3 /usr/local/bin/python && \
    ln -s /usr/local/bin/pip3 /usr/local/bin/pip
