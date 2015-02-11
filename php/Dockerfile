FROM quay.io/nitrous/nodejs:latest
MAINTAINER Nitrous, Inc. <eng@nitrous.io>

# 2015-01-28
# php5                  5.5.9+dfsg-1ubuntu4.5
# mysql-server          5.5.41-0ubuntu0.14.04.1
# libmysqlclient-dev    5.5.41-0ubuntu0.14.04.1
# composer              1.0.0-alpha9

ENV NITROUS_PREVIEW_PORT 3000

# setup mysql

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get -y install \
    mysql-server=5.5.41-0ubuntu0.14.04.1 \
    libmysqlclient-dev=5.5.41-0ubuntu0.14.04.1 && \
  apt-get clean

COPY support/setup_mysql tmp/setup_mysql

RUN /bin/bash -l -c 'service mysql start && \
  tmp/setup_mysql && \
  rm tmp/setup_mysql && \
  service mysql stop'

# setup php

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get -y install \
    php5=5.5.9+dfsg-1ubuntu4.5 \
    php5-curl php5-gd php5-mysql php5-mcrypt \
    php5-geoip php5-cgi php5-dev php5-intl \
    php-apc php-pear \
    mcrypt && \
  apt-get clean

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer version=1.0.0-alpha9
