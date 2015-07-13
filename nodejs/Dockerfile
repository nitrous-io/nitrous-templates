FROM quay.io/nitrous/ubuntu:latest
MAINTAINER Nitrous, Inc. <eng@nitrous.io>

# 2015-07-14
# nvm             0.25.4
# node            0.10.39, 0.12.5 (Default)
# npm             2.11.3
# heroku-toolbelt 3.39.5

RUN \
  mkdir -p /usr/local/opt/nvm && \
  /bin/bash -c 'chown -R $NITROUS_USERNAME:$NITROUS_USERNAME /usr/local/opt/nvm'

RUN echo 'source /usr/local/opt/nvm/nvm.sh' >> /etc/profile

USER $NITROUS_USERNAME

RUN \
  /bin/bash -c \
    'git clone https://github.com/creationix/nvm.git /usr/local/opt/nvm && \
    cd /usr/local/opt/nvm && git checkout v0.25.4 2>/dev/null && \
    source /usr/local/opt/nvm/nvm.sh && \
    nvm install 0.10.39 && \
    nvm install 0.12.5 && \
    nvm alias default 0.12 && \
    nvm use 0.12 && \
    npm install -g npm@2.11.3'

USER root

# set up heroku toolbelt
RUN /bin/bash -c 'wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh'

ENV NITROUS_README_URL https://nitrous-readmes.s3.amazonaws.com/nodejs.2015-06-29.html
