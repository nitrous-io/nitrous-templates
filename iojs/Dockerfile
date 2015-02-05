FROM quay.io/nitrous/ubuntu:latest
MAINTAINER Nitrous, Inc. <eng@nitrous.io>

# 2015-01-28
# nvm     0.23.3
# iojs    1.1.0
# npm     2.4.1

RUN \
  mkdir -p /usr/local/opt/nvm && \
  /bin/bash -c 'chown -R $NITROUS_USERNAME:$NITROUS_USERNAME /usr/local/opt/nvm'

RUN echo 'source /usr/local/opt/nvm/nvm.sh' >> /etc/profile

USER $NITROUS_USERNAME

RUN \
  /bin/bash -c \
    'git clone https://github.com/creationix/nvm.git /usr/local/opt/nvm && \
    cd /usr/local/opt/nvm && git checkout v0.23.3 2>/dev/null && \
    source /usr/local/opt/nvm/nvm.sh && \
    nvm install iojs-v1.1.0 && \
    nvm alias default iojs-v1.1 && \
    nvm use iojs-v1.1 && \
    npm install -g npm@2.4.1'

USER root
