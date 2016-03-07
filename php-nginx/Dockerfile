FROM quay.io/nitrous/php:latest
MAINTAINER Nitrous, Inc. <eng@nitrous.io>

# 2015-07-14
# nginx           1.8.1-1+trusty0
# php5-fpm        5.5.9+dfsg-1ubuntu4.14
# heroku-toolbelt 3.39.5

ENV NITROUS_PREVIEW_PORT 3000

# install nginx / php-fpm

RUN \
  echo "deb http://ppa.launchpad.net/nginx/stable/ubuntu $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/nginx-stable.list && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C300EE8C && \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get -y install \
    nginx=1.8.1-1+trusty0 \
    php5-fpm=5.5.9+dfsg-1ubuntu4.14 && \
  apt-get clean

# nginx upstart conf scripts are still buggy and doesn't work, use sysvinit instead

RUN \
  rm /etc/init/nginx.conf && \
  update-rc.d nginx defaults

# setup public_html dir

RUN \
  /bin/bash -c \
    'mkdir /home/$NITROUS_USERNAME/code/public_html && \
    echo "<?php phpinfo(); ?>" > /home/$NITROUS_USERNAME/code/public_html/index.php && \
    chown -R $NITROUS_USERNAME:$NITROUS_USERNAME /home/$NITROUS_USERNAME/code/public_html && \
    chmod 775 /home/$NITROUS_USERNAME/code/public_html'

COPY support/nginx-default /etc/nginx/sites-available/default

# symlink public_html dir to nginx's webroot

RUN \
  /bin/bash -c \
    'rm -rf /var/www/html && \
    ln -s /home/$NITROUS_USERNAME/code/public_html /var/www/html && \
    chown -R $NITROUS_USERNAME:www-data /home/$NITROUS_USERNAME/code/public_html && \
    chown -h $NITROUS_USERNAME:www-data /var/www/html'

RUN \
  sed -i 's|variables_order.*|variables_order = "EGPCS"|g' /etc/php5/fpm/php.ini && \
  sed -i 's|upload_max_filesize.*|upload_max_filesize = 100M|g' /etc/php5/fpm/php.ini && \
  sed -i 's|post_max_size.*|post_max_size = 100M|g' /etc/php5/fpm/php.ini && \
  sed -i 's|;cgi.fix_pathinfo=1|cgi.fix_pathinfo=0|g' /etc/php5/fpm/php.ini && \
  sed -i 's|listen =.*|listen = /var/run/php5-fpm.sock|g' /etc/php5/fpm/pool.d/www.conf

EXPOSE $NITROUS_PREVIEW_PORT

ENV NITROUS_README_URL https://s3.amazonaws.com/nitrous-readmes/php-nginx.2015-06-29.html
