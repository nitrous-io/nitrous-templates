FROM quay.io/nitrous/ubuntu:latest
MAINTAINER Nitrous, Inc. <eng@nitrous.io>

# 2015-10-20
# nvm             0.29.0
# node            4.2.1
# npm             3.3.8
# heroku-toolbelt 3.42.20
# heroku-cli      4.26.1

RUN \
  mkdir -p /usr/local/opt/nvm && \
  /bin/bash -c 'chown -R $NITROUS_USERNAME:$NITROUS_USERNAME /usr/local/opt/nvm'

RUN echo 'source /usr/local/opt/nvm/nvm.sh' >> /etc/profile

USER $NITROUS_USERNAME

RUN \
  /bin/bash -c \
    'git clone https://github.com/creationix/nvm.git /usr/local/opt/nvm && \
    cd /usr/local/opt/nvm && git checkout v0.29.0 2>/dev/null && \
    source /usr/local/opt/nvm/nvm.sh && \
    nvm install 4.2.1 && \
    nvm alias default 4.2.1 && \
    nvm use 4.2.1 && \
    npm install -g npm@3.3.8'


# set up heroku toolbelt
USER root
RUN /bin/bash -c 'wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh'
USER $NITROUS_USERNAME
RUN /bin/bash -c 'heroku'

USER root
ENV NITROUS_README_URL https://nitrous-readmes.s3.amazonaws.com/nodejs.2015-10-20.html
