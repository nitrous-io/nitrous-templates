FROM quay.io/nitrous/ruby:latest
MAINTAINER Nitrous, Inc. <eng@nitrous.io>

# 2015-01-28
# rails               4.2.0
# postgresql          9.3+154
# postgresql-contrib  9.3+154
# libpq-dev           9.3.6-0ubuntu0.14.04

ENV NITROUS_PREVIEW_PORT 3000

# set up postgres
RUN \
  apt-get update && \
  apt-get install -y \
    postgresql=9.3+154 \
    postgresql-contrib=9.3+154 \
    libpq-dev=9.3.6-0ubuntu0.14.04 && \
  apt-get clean

COPY support/pg_hba.conf /etc/postgresql/9.3/main/pg_hba.conf

RUN service postgresql start && \
  su postgres -c 'createdb example_development && \
  createuser --superuser $NITROUS_USERNAME' && \
  service postgresql stop

USER $NITROUS_USERNAME

# set up example app

RUN /bin/bash -l -c 'sudo service postgresql start && \
  gem install rails -v 4.2.0 && \
  rbenv rehash && \
  cd /home/$NITROUS_USERNAME/code && \
  rails new example -d postgresql && \
  cd example && \
  bundle install && \
  rake db:create db:migrate && \
  sudo service postgresql stop'

USER root

COPY support/start-app /home/$NITROUS_USERNAME/code/example/start-app
RUN /bin/bash -c 'chown $NITROUS_USERNAME:$NITROUS_USERNAME /home/$NITROUS_USERNAME/code/example/start-app'

EXPOSE $NITROUS_PREVIEW_PORT
