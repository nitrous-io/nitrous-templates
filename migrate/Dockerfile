FROM quay.io/nitrous/migrate-base:latest
MAINTAINER Nitrous, Inc. <eng@nitrous.io>

# Add fake Upstart job that emits events so that other services will run.
COPY files/fake-container-events.conf /etc/init/fake-container-events.conf

COPY files/sshd_config /etc/ssh/sshd_config

ENV NITROUS_IMAGE_VERSION 2
ENV NITROUS_SSH_ENABLED true

CMD ["/sbin/init", "--default-console", "none"]

ENV NITROUS_USERNAME action
ENV USER action

# Ensure compatibility with Pro

# From https://github.com/nitrous-io/nitrous-templates/blob/latest/ubuntu-bare/Dockerfile 5aa415d
# Disable root password
RUN passwd -l root

# Grant sudo privileges to 'action'
RUN \
 /bin/bash -c \
   'echo $NITROUS_USERNAME ALL=NOPASSWD:ALL > /etc/sudoers.d/$NITROUS_USERNAME && \
   chmod 0440 /etc/sudoers.d/$NITROUS_USERNAME'

RUN \
  mkdir -p /nitrous/init /nitrous/initonce && \
  touch /nitrous/dont_delete_this_dir

RUN \
  rm /etc/legal && \
  # No such file in migrated box:
  # rm /etc/update-motd.d/10-help-text
  # rm /etc/motd instead
  rm /etc/motd && \ 

  # Remove sudo shim so that sudo command can be run.
  # https://github.com/nitrous-io/bombay/blob/master/ansible/base_container_template/files/alias_sudo.sh
  rm /etc/profile.d/alias_sudo.sh

COPY files/motd /etc/update-motd.d/00-header
COPY files/nitrous_bootstrap.conf /etc/init/nitrous_bootstrap.conf
COPY files/bootstrap.sh /nitrous/bootstrap.sh
COPY files/dockerenv-inject /nitrous/dockerenv-inject

COPY files/nitrous-unison /nitrous/nitrous-unison
COPY files/nitrous-watcher /nitrous/nitrous-watcher

COPY files/init/0010-inject-env.sh  /nitrous/init/0010-inject-env.sh

COPY files/initonce/0010-generate-pw.sh /nitrous/initonce/0010-generate-pw.sh

COPY files/sources.list /etc/apt/sources.list

# From https://github.com/nitrous-io/nitrous-templates/blob/latest/ubuntu/Dockerfile d9e141e
# hushlogin
 RUN \
   /bin/bash -c 'touch /home/$NITROUS_USERNAME/.hushlogin'

# use ~/workspace to sync instead of ~/code
ENV NITROUS_ROOT_SYNC /home/$NITROUS_USERNAME/workspace

ENV NITROUS_README_URL https://nitrous-readmes.s3.amazonaws.com/migrate.2015-06-08.html
