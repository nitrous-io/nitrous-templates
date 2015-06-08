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
