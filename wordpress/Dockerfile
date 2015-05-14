FROM quay.io/nitrous/php-apache:latest
MAINTAINER Nitrous, Inc. <eng@nitrous.io>

# 2015-05-14
# wordpress 4.2.2

# create database
RUN /bin/bash -l -c 'service mysql start && \
  mysql -u nitrous -e "CREATE DATABASE wordpress DEFAULT CHARACTER SET = utf8;" && \
  service mysql stop'

USER $NITROUS_USERNAME

# set up wordpress
RUN \
  /bin/bash -c \
    'cd /home/$NITROUS_USERNAME && \
    wget https://wordpress.org/wordpress-4.2.2.tar.gz && \
    tar xvzf wordpress-4.2.2.tar.gz && \
    mv wordpress/* /home/$NITROUS_USERNAME/code/public_html/ && \
    rm -rf wordpress wordpress-4.2.2.tar.gz'

RUN \
  sed -i "s|_x( 'username'|_x( 'nitrous'|g" /home/$NITROUS_USERNAME/code/public_html/wp-admin/setup-config.php && \
  sed -i "s|_x( 'password'|_x( ''|g" /home/$NITROUS_USERNAME/code/public_html/wp-admin/setup-config.php

USER root

# give Apache user ownership to perform upgrades, install plugins/themes
RUN /bin/bash -c 'chown -R www-data:www-data /home/$NITROUS_USERNAME/code/public_html'

ENV NITROUS_README_URL https://s3.amazonaws.com/nitrous-readmes/wordpress.2015-05-14.html
