FROM quay.io/nitrous/nodejs:latest
MAINTAINER Nitrous, Inc. <eng@nitrous.io>

# 2015-01-28
# ruby      2.2.0 (not yet available as bin pkg), 2.1.5 (Default), 2.0.0-p598, 1.9.3-p551
# bundler   1.7.12

RUN \
  mkdir -p /usr/local/opt/rbenv && \
  /bin/bash -c 'chown -R $NITROUS_USERNAME:$NITROUS_USERNAME /usr/local/opt/rbenv'

RUN \
  echo 'export RBENV_ROOT=/usr/local/opt/rbenv' >> /etc/profile && \
  echo 'export PATH=$RBENV_ROOT/bin:$PATH' >> /etc/profile && \
  echo 'eval "$($RBENV_ROOT/bin/rbenv init -)"' >> /etc/profile && \
  echo 'export PATH=.bundle/binstubs:$PATH' >> /etc/profile

COPY files/gemrc /home/$NITROUS_USERNAME/.gemrc
COPY files/bundle-config /home/$NITROUS_USERNAME/.bundle/config

RUN \
  /bin/bash -c 'chown -R $NITROUS_USERNAME:$NITROUS_USERNAME /home/$NITROUS_USERNAME/.gemrc /home/$NITROUS_USERNAME/.bundle'

USER $NITROUS_USERNAME

RUN \
  /bin/bash -c \
    'git clone https://github.com/sstephenson/rbenv.git /usr/local/opt/rbenv && \
    git clone https://github.com/sstephenson/ruby-build.git /usr/local/opt/rbenv/plugins/ruby-build && \
    git clone https://github.com/nitrous-io/rvm-download.git /usr/local/opt/rbenv/plugins/rvm-download'

RUN \
  /bin/bash -l -c \
    'rbenv download 1.9.3-p551 && \
    rbenv shell 1.9.3-p551 && \
    rbenv rehash && \
    ruby -v && \
    gem install bundler --version=1.7.12 && \
    rbenv rehash'

RUN \
  /bin/bash -l -c \
    'rbenv download 2.0.0-p598 && \
    rbenv shell 2.0.0-p598 && \
    rbenv rehash && \
    ruby -v && \
    gem install bundler --version=1.7.12 && \
    rbenv rehash'

RUN \
  /bin/bash -l -c \
    'rbenv download 2.1.5 && \
    rbenv global 2.1.5 && \
    rbenv rehash && \
    ruby -v && \
    gem install bundler --version=1.7.12 && \
    rbenv rehash'

RUN \
  /bin/bash -l -c \
    'rbenv install -v 2.2.0 && \
    rbenv shell 2.2.0 && \
    rbenv rehash && \
    ruby -v && \
    gem install bundler --version=1.7.12 && \
    rbenv rehash'

USER root
