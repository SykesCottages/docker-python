ARG ARCH=amd64
FROM sykescottages/base:ubuntu-20-04-$ARCH

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime

RUN apt-get update && \
    apt-get install -yy \
        gcc \
        make \
        zlib1g-dev \
        libssl-dev \
        libbz2-dev \
        libffi-dev \
        liblzma-dev

RUN apt-get autoremove -y -q && \
    apt-get autoclean -y -q && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint /usr/local/bin/

ENTRYPOINT [ "entrypoint" ]