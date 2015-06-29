FROM quay.io/nitrous/nodejs:latest
MAINTAINER Nitrous, Inc. <eng@nitrous.io>

# 2015-06-29
# multirust 0.0.6
# rust      1.1.0

RUN \
  mkdir -p /usr/local/opt/multirust && \
  chown -R $NITROUS_USERNAME:$NITROUS_USERNAME /usr/local/opt/multirust

USER $NITROUS_USERNAME

RUN \
  /bin/bash -l -c \
    'git clone --recursive https://github.com/brson/multirust /usr/local/opt/multirust && \
    cd /usr/local/opt/multirust && \
    git checkout 0.0.6 && \
    git submodule update --init && \
    ./build.sh && \
    sudo ./install.sh && \
    cd && \
    SHELL=/bin/bash multirust default 1.1.0'

USER root

ENV NITROUS_README_URL https://nitrous-readmes.s3.amazonaws.com/rust.2015-06-29.html
