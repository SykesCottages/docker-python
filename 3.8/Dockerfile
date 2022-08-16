FROM sykescottages/python:base

ARG PYTHON_VERSION=3.8.13

RUN curl https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz --output /tmp/Python.tgz && \
    echo $(sha384sum /tmp/Python.tgz) && \
    echo "38edc54024d58277b0dbfe95070283838badeeafff28c53148bfa9036550d04fea02b6ab29f305c857e95dd5b0d7af64  /tmp/Python.tgz" | sha384sum --check && \tar -xvf /tmp/Python.tgz -C /tmp && \
    tar -xvf /tmp/Python.tgz -C /tmp && \
    cd /tmp/Python-$PYTHON_VERSION && \
    ./configure && \
    make && \
    make install && \
    ln -s /usr/local/bin/python3 /usr/local/bin/python && \
    ln -s /usr/local/bin/pip3 /usr/local/bin/pip
