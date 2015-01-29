FROM quay.io/nitrous/php:latest
MAINTAINER Nitrous, Inc. <eng@nitrous.io>

# 2015-01-28
# postgresql          9.3+154
# laravel-installer   1.1.3
# laravel             4.2

ENV NITROUS_PREVIEW_PORT 3000

# set up postgres
RUN \
  apt-get update && \
  apt-get install -y postgresql=9.3+154 libpq-dev && \
  apt-get clean

COPY support/pg_hba.conf /etc/postgresql/9.3/main/pg_hba.conf

RUN service postgresql start && \
  su postgres -c 'createdb example_development && \
  createuser --superuser $NITROUS_USERNAME' && \
  service postgresql stop

# enable mcrypt in php
RUN php5enmod mcrypt

# remove apache2
RUN \
  DEBIAN_FRONTEND=noninteractive apt-get purge -y apache2 && \
  DEBIAN_FRONTEND=noninteractive apt-get autoremove -y

USER $NITROUS_USERNAME

# install laravel
RUN /bin/bash -c 'composer global require "laravel/installer=1.1.3"'

# create laravel app
RUN /bin/bash -c 'mkdir -p /home/$NITROUS_USERNAME/code/example && \
  composer create-project laravel/laravel /home/$NITROUS_USERNAME/code/example 4.2 --prefer-dist'

# database configuration
COPY support/database.php /home/$NITROUS_USERNAME/code/example/config/database.php
COPY support/start-app /home/$NITROUS_USERNAME/code/example/start-app

USER root

# set proper ownership
RUN /bin/bash -c 'chown -R $NITROUS_USERNAME:$NITROUS_USERNAME /home/$NITROUS_USERNAME/code/example'

EXPOSE $NITROUS_PREVIEW_PORT
