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
RUN su action -l -c /bin/bash -c 'composer global require "laravel/installer=~1.1"'

# create laravel app
RUN su action -l -c /bin/bash -c 'composer create-project laravel/laravel workspace --prefer-dist'

# web starter script
ADD support/web /home/action/workspace/bin/web
RUN chmod +x /home/action/workspace/bin/web

# database configuration
ADD support/database.php /home/action/workspace/app/config/database.php

# set proper ownership
RUN chown -R action:action /home/action

# nitrous config
ENV NITROUS_USERNAME action
ENV NITROUS_CMD /home/action/workspace/bin/web
