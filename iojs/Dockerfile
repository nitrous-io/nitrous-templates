FROM quay.io/nitrous/ubuntu:latest
MAINTAINER Nitrous, Inc. <eng@nitrous.io>

# 2015-04-23
# nvm     0.24.1
# iojs    1.8.1
# npm     2.8.3

RUN \
  mkdir -p /usr/local/opt/nvm && \
  /bin/bash -c 'chown -R $NITROUS_USERNAME:$NITROUS_USERNAME /usr/local/opt/nvm'

RUN echo 'source /usr/local/opt/nvm/nvm.sh' >> /etc/profile

USER $NITROUS_USERNAME

RUN \
  /bin/bash -c \
    'git clone https://github.com/creationix/nvm.git /usr/local/opt/nvm && \
    cd /usr/local/opt/nvm && git checkout v0.24.1 2>/dev/null && \
    source /usr/local/opt/nvm/nvm.sh && \
    nvm install iojs-v1.8.1 && \
    nvm alias default iojs-v1.8.1 && \
    nvm use iojs-v1.8.1 && \
    npm install -g npm@2.8.3'

USER root
