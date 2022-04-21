FROM sykescottages/python:base

ARG PYTHON_VERSION=2.7.18

RUN apt-get autoremove -y -q && \
    apt-get autoclean -y -q && \
    rm -rf /var/lib/apt/lists/*

RUN curl https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz --output /tmp/Python.tgz && \
    echo "81fa0640aacad8acc1b2682358956cbef2327f1f543c558f8fd7074bcfc53bff4223860105f6ab0323c9ae2e4401b3c2  /tmp/Python.tgz" | sha384sum --check && \
    tar -xvf /tmp/Python.tgz -C /tmp && \
    cd /tmp/Python-$PYTHON_VERSION && \
    ./configure && \
    make && \
    make install

RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output /tmp/get-pip.py && \
    echo "eb9155ad7e5b8bd63fa22858ba1929cd141ec782210d37d30bd37ec9554597d0d145c8ce629df5e1ce282a832a856e5b  /tmp/get-pip.py" | sha384sum --check && \
    python /tmp/get-pip.py
