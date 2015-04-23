FROM quay.io/nitrous/nodejs:latest
MAINTAINER Nitrous, Inc. <eng@nitrous.io>

# 2015-04-22
# multirust 40cd3e8e66625a48f652f9d2fa1bf65b2c9bda1d
# rust      beta 1.0.0-beta2

RUN \
  mkdir -p /usr/local/opt/multirust && \
  chown -R $NITROUS_USERNAME:$NITROUS_USERNAME /usr/local/opt/multirust

USER $NITROUS_USERNAME

RUN \
  /bin/bash -l -c \
    'git clone --recursive https://github.com/brson/multirust /usr/local/opt/multirust && \
    cd /usr/local/opt/multirust && \
    git submodule update --init && \
    ./build.sh && \
    sudo ./install.sh && \
    cd && \
    SHELL=/bin/bash multirust default beta'

USER root

ENV NITROUS_README_URL https://nitrous-readmes.s3.amazonaws.com/rust.2015-04-23.html
