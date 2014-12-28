FROM nitrousio/php:latest

RUN apt-get update

# install dependencies
RUN apt-get install -y postgresql=9.3+154 libpq-dev

# setup postgres
ADD support/pg_hba.conf /etc/postgresql/9.3/main/pg_hba.conf
ENV DATABASE_URL postgres://postgres@localhost/development
ENV PGUSER postgres
ENV PGDATABASE development

# install latest composer
RUN composer self-update

# enable mcrypt in php
RUN apt-get install -y php5-mcrypt
RUN php5enmod mcrypt

# install laravel
RUN su nitrous -l -c /bin/bash -c 'composer global require "laravel/installer=~1.1"'

# create laravel app
RUN su nitrous -l -c /bin/bash -c 'mkdir -p /home/nitrous/workspace && composer create-project laravel/laravel /home/nitrous/workspace/starter 4.2 --prefer-dist'

# web starter script
COPY support/start-app /usr/local/bin/start-app

# database configuration
COPY support/database.php /home/nitrous/workspace/starter/config/database.php

# set proper ownership
RUN chown -R nitrous:nitrous /home/nitrous

EXPOSE 3000

# nitrous config
ENV NITROUS_USERNAME nitrous
ENV NITROUS_CMD /usr/local/bin/start-app
ENV NITROUS_PREVIEW_PORT 3000
