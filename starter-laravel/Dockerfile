FROM nitrousio/php:latest

ENV NITROUS_APP_NAME starter
ENV NITROUS_APP_PATH /home/$NITROUS_USERNAME/code/$NITROUS_APP_NAME
ENV NITROUS_CMD /usr/local/bin/start-app
ENV NITROUS_PREVIEW_PORT 3000

RUN \
  apt-get update && \
  apt-get install -y postgresql=9.3+154 libpq-dev php5-mcrypt && \
  apt-get clean

# setup postgres
COPY support/pg_hba.conf /etc/postgresql/9.3/main/pg_hba.conf
ENV DATABASE_URL postgres://postgres@localhost/development
ENV PGUSER postgres
ENV PGDATABASE development

# enable mcrypt in php
RUN php5enmod mcrypt

USER $NITROUS_USERNAME

# install laravel
RUN /bin/bash -c 'composer global require "laravel/installer=~1.1"'

# create laravel app
RUN /bin/bash -c 'mkdir -p $NITROUS_APP_PATH && composer create-project laravel/laravel $NITROUS_APP_PATH 4.2 --prefer-dist'

# web starter script
COPY support/start-app $NITROUS_CMD

# database configuration
COPY support/database.php ${NITROUS_APP_PATH}/config/database.php

USER root

# set proper ownership
RUN /bin/bash -c 'chown -R $NITROUS_USERNAME:$NITROUS_USERNAME /home/$NITROUS_USERNAME'

EXPOSE $NITROUS_PREVIEW_PORT
