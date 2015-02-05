FROM quay.io/nitrous/nodejs:latest
MAINTAINER Nitrous, Inc. <eng@nitrous.io>

# 2015-01-28
# apache2               2.4.7-1ubuntu4.1
# libapache2-mod-php5   5.5.9+dfsg-1ubuntu4.5
# mysql-server          5.5.41-0ubuntu0.14.04.1
# libmysqlclient-dev    5.5.41-0ubuntu0.14.04.1
# composer              1.0.0-alpha9

ENV NITROUS_PREVIEW_PORT 3000

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get -y install \
    apache2=2.4.7-1ubuntu4.1 \
    libapache2-mod-php5=5.5.9+dfsg-1ubuntu4.5 \
    mysql-server=5.5.41-0ubuntu0.14.04.1 \
    libmysqlclient-dev=5.5.41-0ubuntu0.14.04.1 \
    php5-curl \
    php5-gd \
    php5-mysql \
    php5-mcrypt \
    php-apc \
    php-pear && \
  apt-get clean

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer version=1.0.0-alpha9

RUN \
  /bin/bash -c \
    'rm /var/www/html/index.html && \
    echo "<?php phpinfo(); ?>" > /var/www/html/index.php && \
    mv /var/www/html /home/$NITROUS_USERNAME/code/public_html && \
    ln -s /home/$NITROUS_USERNAME/code/public_html /var/www/html && \
    ln -s /home/$NITROUS_USERNAME/code/public_html /home/$NITROUS_USERNAME/public_html && \
    ln -s /home/$NITROUS_USERNAME/code/public_html /home/$NITROUS_USERNAME/www && \
    chown -R $NITROUS_USERNAME:www-data /home/$NITROUS_USERNAME/code/public_html && \
    chmod 775 /home/$NITROUS_USERNAME/code/public_html && \
    chown -h $NITROUS_USERNAME:www-data /var/www/html && \
    chown -h $NITROUS_USERNAME:$NITROUS_USERNAME /home/$NITROUS_USERNAME/public_html && \
    chown -h $NITROUS_USERNAME:$NITROUS_USERNAME /home/$NITROUS_USERNAME/www'

RUN \
  sed -i 's|variables_order.*|variables_order = "EGPCS"|g' /etc/php5/apache2/php.ini && \
  sed -i 's|upload_max_filesize.*|upload_max_filesize = 100M|g' /etc/php5/apache2/php.ini && \
  sed -i 's|post_max_size.*|post_max_size = 100M|g' /etc/php5/apache2/php.ini && \
  sed -i 's|bind-address.*|bind-address = 0.0.0.0|g' /etc/mysql/my.cnf && \
  sed -i 's|Listen 80|Listen 3000|g' /etc/apache2/ports.conf && \
  sed -i 's|VirtualHost \*:80|VirtualHost *:3000|g' /etc/apache2/sites-available/000-default.conf

EXPOSE $NITROUS_PREVIEW_PORT
