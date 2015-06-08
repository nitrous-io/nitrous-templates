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
RUN \
  mkdir -p /nitrous/init /nitrous/initonce && \
    touch /nitrous/dont_delete_this_dir

RUN \
  rm /etc/legal && \
  # No such file in migrated box:
  # rm /etc/update-motd.d/10-help-text
  # rm /etc/motd instead
  rm /etc/motd

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

# Install oh-my-zsh
RUN \
  /bin/bash -c 'git clone https://github.com/robbyrussell/oh-my-zsh.git /home/$NITROUS_USERNAME/.oh-my-zsh && \
  cp /home/$NITROUS_USERNAME/.oh-my-zsh/templates/zshrc.zsh-template /home/$NITROUS_USERNAME/.zshrc && \
  sed -i "s|# DISABLE_AUTO_UPDATE|DISABLE_AUTO_UPDATE|g" /home/$NITROUS_USERNAME/.zshrc && \
  sudo chsh -s /bin/zsh $NITROUS_USERNAME && \
  sudo touch /etc/profile.d/dummy.sh && \
  sudo /bin/bash -c "echo source /etc/profile >> /etc/zsh/zprofile"'
