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
    php-pear && \
  apt-get clean

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer version=1.0.0-alpha9

RUN \
  ln -s /var/www/html /home/nitrous/www && \
  rm /home/nitrous/www/index.html && \
  echo '<?php phpinfo(); ?>' > /home/nitrous/www/index.php && \
  chown -R nitrous:www-data /var/www && \
  chmod 775 /var/www && \
  chown -h nitrous:www-data /home/nitrous/www

RUN \
  sed -i 's|variables_order.*|variables_order = "EGPCS"|g' /etc/php5/apache2/php.ini && \
  sed -i 's|upload_max_filesize.*|upload_max_filesize = 100M|g' /etc/php5/apache2/php.ini && \
  sed -i 's|post_max_size.*|post_max_size = 100M|g' /etc/php5/apache2/php.ini && \
  sed -i 's|bind-address.*|bind-address = 0.0.0.0|g' /etc/mysql/my.cnf

EXPOSE 80
