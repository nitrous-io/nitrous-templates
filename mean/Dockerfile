FROM nitrousio/nodejs:latest

RUN apt-get update

# install dependencies
RUN \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
  echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list && \
  apt-get update

# https://github.com/docker/docker/issues/1024
RUN \
  cp /sbin/initctl /sbin/initctlbak && \
  dpkg-divert --local --rename --add /sbin/initctl && \
  ln -sf /bin/true /sbin/initctl
RUN apt-get install -yy mongodb-org=2.6.6
RUN mv /sbin/initctlbak /sbin/initctl

RUN \
  su nitrous -l -c /bin/bash -c 'npm install -g npm@2.1.12' && \
  su nitrous -l -c /bin/bash -c 'npm install -g bower@1.3.12 grunt-cli@0.1.13 mean-cli@0.9.10'

COPY support/install-app /tmp/install-app
RUN su nitrous -l -c /bin/bash -c /tmp/install-app

COPY support/start-app /usr/local/bin/start-app

EXPOSE 3000

ENV NITROUS_USERNAME nitrous
ENV NITROUS_CMD /usr/local/bin/start-app
ENV NITROUS_PREVIEW_PORT 3000
