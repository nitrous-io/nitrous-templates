FROM quay.io/nitrous/php:latest
MAINTAINER Nitrous, Inc. <eng@nitrous.io>

# 2015-12-29
# apache2               2.4.7-1ubuntu4.8
# libapache2-mod-php5   5.5.9+dfsg-1ubuntu4.11
# heroku-toolbelt       3.39.5

ENV NITROUS_PREVIEW_PORT 3000

# install apache

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get -y install \
    apache2=2.4.7-1ubuntu4.8 \
    libapache2-mod-php5=5.5.9+dfsg-1ubuntu4.14 && \
  apt-get clean

# setup public_html dir

RUN \
  /bin/bash -c \
    'mkdir /home/$NITROUS_USERNAME/code/public_html && \
    echo "<?php phpinfo(); ?>" > /home/$NITROUS_USERNAME/code/public_html/index.php && \
    chown -R $NITROUS_USERNAME:$NITROUS_USERNAME /home/$NITROUS_USERNAME/code/public_html && \
    chmod 775 /home/$NITROUS_USERNAME/code/public_html'

# symlink public_html dir to apache's webroot

RUN \
  /bin/bash -c \
    'rm -rf /var/www/html && \
    ln -s /home/$NITROUS_USERNAME/code/public_html /var/www/html && \
    chown -R $NITROUS_USERNAME:www-data /home/$NITROUS_USERNAME/code/public_html && \
    chown -h $NITROUS_USERNAME:www-data /var/www/html'

RUN \
  sed -i 's|variables_order.*|variables_order = "EGPCS"|g' /etc/php5/apache2/php.ini && \
  sed -i 's|upload_max_filesize.*|upload_max_filesize = 100M|g' /etc/php5/apache2/php.ini && \
  sed -i 's|post_max_size.*|post_max_size = 100M|g' /etc/php5/apache2/php.ini && \
  sed -i 's|;cgi.fix_pathinfo=1|cgi.fix_pathinfo=0|g' /etc/php5/apache2/php.ini && \
  sed -i 's|Listen 80|Listen 3000|g' /etc/apache2/ports.conf && \
  sed -i 's|VirtualHost \*:80|VirtualHost *:3000|g' /etc/apache2/sites-available/000-default.conf

EXPOSE $NITROUS_PREVIEW_PORT

ENV NITROUS_README_URL https://s3.amazonaws.com/nitrous-readmes/php-apache.2015-04-01.html
