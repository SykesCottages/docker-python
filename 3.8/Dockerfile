ARG ARCH=amd64
FROM sykescottages/python:base-$ARCH

ARG PYTHON_VERSION=3.8.18

RUN curl https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz --output /tmp/Python.tgz && \
    echo $(sha384sum /tmp/Python.tgz) && \
    echo "b41dc5469bbf9571bb82ffffa2e23235b33677231ccfce7d3d8c8b86eaaf8921ece4bedfe9947ea58943cf1cb5b36f98  /tmp/Python.tgz" | sha384sum --check && \tar -xvf /tmp/Python.tgz -C /tmp && \
    tar -xvf /tmp/Python.tgz -C /tmp && \
    cd /tmp/Python-$PYTHON_VERSION && \
    ./configure && \
    make && \
    make install && \
    ln -s /usr/local/bin/python3 /usr/local/bin/python && \
    ln -s /usr/local/bin/pip3 /usr/local/bin/pip
