FROM quay.io/nitrous/nodejs:latest
MAINTAINER Nitrous, Inc. <eng@nitrous.io>

# 2015-01-28
# mongodb-org   2.6.7
# bower         1.3.12
# npm           2.1.18 (required by grunt-cli)
# grunt-cli     0.1.13
# mean-cli      0.9.20
# mean          0.4.2 (install-app)

ENV NITROUS_PREVIEW_PORT 3000

# https://github.com/docker/docker/issues/1024
RUN \
  cp /sbin/initctl /sbin/initctlbak && \
  dpkg-divert --local --rename --add /sbin/initctl && \
  ln -sf /bin/true /sbin/initctl

RUN \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
  echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list && \
  apt-get update && \
  apt-get install -yy mongodb-org=2.6.7 && \
  apt-get clean

RUN mv /sbin/initctlbak /sbin/initctl

USER $NITROUS_USERNAME

RUN \
  /bin/bash -l -c \
    'npm install -g npm@2.1.18 && \
    npm install -g bower@1.3.12 grunt-cli@0.1.13 mean-cli@0.9.20'

COPY support/install-app /tmp/install-app
RUN /bin/bash -l -c /tmp/install-app

EXPOSE $NITROUS_PREVIEW_PORT

USER root

COPY support/start-app /home/$NITROUS_USERNAME/code/example/start-app
RUN /bin/bash -c 'chown $NITROUS_USERNAME:$NITROUS_USERNAME /home/$NITROUS_USERNAME/code/example/start-app'
