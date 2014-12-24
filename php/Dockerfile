FROM nitrousio/nodejs:latest
MAINTAINER Nitrous.IO <hello@nitrous.io>

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get -y install \
    apache2 \
    libapache2-mod-php5 \
    mysql-server \
    php5-curl \
    php5-gd \
    php5-mysql \
    php-apc \
    php-pear

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN \
  ln -s /var/www/html /home/action/www && \
  rm /home/action/www/index.html && \
  echo '<?php phpinfo(); ?>' > /home/action/www/index.php && \
  chown -R action:www-data /var/www && \
  chmod 775 /var/www && \
  chown -h action:www-data /home/action/www

RUN \
  sed -i 's|variables_order.*|variables_order = "EGPCS"|g' /etc/php5/apache2/php.ini && \
  sed -i 's|upload_max_filesize.*|upload_max_filesize = 100M|g' /etc/php5/apache2/php.ini && \
  sed -i 's|post_max_size.*|post_max_size = 100M|g' /etc/php5/apache2/php.ini && \
  sed -i 's|bind-address.*|bind-address = 0.0.0.0|g' /etc/mysql/my.cnf

EXPOSE 80
