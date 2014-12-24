FROM nitrousio/ubuntu:trusty
MAINTAINER Nitrous.IO <hello@nitrous.io>

RUN \
  mkdir -p /usr/local/opt/nvm && \
  chown -R action:action /usr/local/opt/nvm

RUN \
  su action -c /bin/bash -c 'git clone https://github.com/creationix/nvm.git /usr/local/opt/nvm'

RUN echo 'source /usr/local/opt/nvm/nvm.sh' >> /etc/profile

RUN \
  su action -l -c /bin/bash -c \
  'source /usr/local/opt/nvm/nvm.sh && \
  nvm install stable && \
  nvm alias default stable'
