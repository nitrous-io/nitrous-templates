FROM ubuntu-upstart:trusty
MAINTAINER Nitrous, Inc. <eng@nitrous.io>

ENV NITROUS_IMAGE_VERSION 2
ENV NITROUS_USERNAME nitrous
ENV NITROUS_SSH_ENABLED true

# Disable root password
RUN passwd -l root

# Create nitrous user and give sudo
RUN \
  /bin/bash -c \
    'useradd --create-home -s /bin/bash $NITROUS_USERNAME && \
    adduser $NITROUS_USERNAME sudo && \
    mkdir -p /etc/sudoers.d && \
    echo $NITROUS_USERNAME ALL=NOPASSWD:ALL > /etc/sudoers.d/$NITROUS_USERNAME && \
    chmod 0440 /etc/sudoers.d/$NITROUS_USERNAME'

RUN \
  mkdir -p /nitrous/init /nitrous/initonce && \
  touch /nitrous/dont_delete_this_dir

RUN \
  rm /etc/legal && \
  rm /etc/update-motd.d/10-help-text

COPY files/motd /etc/update-motd.d/00-header
COPY files/nitrous_bootstrap.conf /etc/init/nitrous_bootstrap.conf
COPY files/bootstrap.sh /nitrous/bootstrap.sh
COPY files/dockerenv-inject /nitrous/dockerenv-inject
COPY files/sshd_config /etc/ssh/sshd_config

COPY files/nitrous-unison /nitrous/nitrous-unison
COPY files/nitrous-watcher /nitrous/nitrous-watcher

COPY files/init/0010-inject-env.sh  /nitrous/init/0010-inject-env.sh

COPY files/initonce/0010-generate-pw.sh /nitrous/initonce/0010-generate-pw.sh

COPY files/sources.list /etc/apt/sources.list

# Add fake Upstart job that emits events so that other services will run.
COPY files/fake-container-events.conf /etc/init/fake-container-events.conf

CMD ["/sbin/init", "--default-console", "none"]
