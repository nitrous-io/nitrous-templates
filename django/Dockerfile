FROM quay.io/nitrous/python:latest
MAINTAINER Nitrous, Inc. <eng@nitrous.io>

# 2015-11-03
# postgresql-9.4          9.4.5-1.pgdg14.04+1
# postgresql-contrib-9.4  9.4.5-1.pgdg14.04+1
# libpq-dev               9.4.5-1.pgdg14.04+1
# heroku-toolbelt         3.42.21
#
# requirements.txt:
# django    1.7.4
# gunicorn  19.1.1
# ipython   2.3.1
# psycopg2  2.5.4

ENV NITROUS_PREVIEW_PORT 3000

# set up postgres
RUN \
  echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -sc)-pgdg main" | tee /etc/apt/sources.list.d/postgresql.list && \
  wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
  apt-get update && \
  apt-get install -y \
    postgresql-9.4=9.4.5-1.pgdg14.04+1 \
    postgresql-contrib-9.4=9.4.5-1.pgdg14.04+1 \
    libpq-dev=9.4.5-1.pgdg14.04+1 && \
  apt-get clean

COPY support/pg_hba.conf /etc/postgresql/9.4/main/pg_hba.conf

RUN service postgresql start && \
  su postgres -c 'createdb example_development && \
  createuser --superuser $NITROUS_USERNAME' && \
  service postgresql stop

RUN mkdir -p /home/$NITROUS_USERNAME/code/example

COPY support/requirements.txt /home/$NITROUS_USERNAME/code/example/requirements.txt

RUN /bin/bash -c 'chown -R $NITROUS_USERNAME:$NITROUS_USERNAME /home/$NITROUS_USERNAME/code/example'

COPY support/install-app /tmp/install-app

USER $NITROUS_USERNAME

RUN /bin/bash -l -c 'sudo service postgresql start && \
  /tmp/install-app && \
  sudo service postgresql stop'

USER root

COPY support/start-app /home/$NITROUS_USERNAME/code/example/start-app

RUN /bin/bash -c 'chown $NITROUS_USERNAME:$NITROUS_USERNAME /home/$NITROUS_USERNAME/code/example/start-app'

# set up heroku toolbelt
RUN /bin/bash -c 'wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh'

EXPOSE $NITROUS_PREVIEW_PORT

ENV NITROUS_README_URL https://nitrous-readmes.s3.amazonaws.com/django.2015-06-29.html
