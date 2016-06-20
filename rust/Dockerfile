FROM quay.io/nitrous/nodejs-base:latest
MAINTAINER Nitrous, Inc. <eng@nitrous.io>

# 2016-04-28
# multirust 0.8.0
# rust      1.8.0

RUN \
  mkdir -p /usr/local/opt/multirust && \
  chown -R $NITROUS_USERNAME:$NITROUS_USERNAME /usr/local/opt/multirust

USER $NITROUS_USERNAME

RUN \
  /bin/bash -l -c \
    'git clone --recursive https://github.com/brson/multirust /usr/local/opt/multirust && \
    cd /usr/local/opt/multirust && \
    git checkout 0.8.0 && \
    git submodule update --init && \
    ./build.sh && \
    sudo ./install.sh && \
    cd && \
    SHELL=/bin/bash multirust default 1.8.0'

USER nitrous
RUN /bin/bash -l -c 'npm install -g pubstorm@0.1.3'

# init should be executed by root
USER root

ENV NITROUS_README_URL https://nitrous-readmes.s3.amazonaws.com/rust.2015-06-29.html
