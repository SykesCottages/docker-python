FROM sykescottages/python:base

ARG PYTHON_VERSION=2.7.18

RUN apt-get update && \
    apt-get install -yy \
      zlib1g-dev \
      libssl-dev

RUN apt-get autoremove -y -q && \
    apt-get autoclean -y -q && \
    rm -rf /var/lib/apt/lists/*

RUN curl https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz --output /tmp/Python.tgz && \
    echo $(sha384sum /tmp/Python.tgz) && \
    echo "81fa0640aacad8acc1b2682358956cbef2327f1f543c558f8fd7074bcfc53bff4223860105f6ab0323c9ae2e4401b3c2  /tmp/Python.tgz" | sha384sum --check && \tar -xvf /tmp/Python.tgz -C /tmp && \
    tar -xvf /tmp/Python.tgz -C /tmp && \
    cd /tmp/Python-$PYTHON_VERSION && \
    ./configure && \
    make && \
    make install && \
    curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output /tmp/get-pip.py && \
    python /tmp/get-pip.py
