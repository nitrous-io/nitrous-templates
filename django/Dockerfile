FROM quay.io/nitrous/python:latest
MAINTAINER Nitrous, Inc. <eng@nitrous.io>

# 2015-06-29
# postgresql          9.3+154
# postgresql-contrib  9.3+154
# libpq-dev           9.3.9-0ubuntu0.14.04
#
# requirements.txt:
# django    1.7.4
# gunicorn  19.1.1
# ipython   2.3.1
# psycopg2  2.5.4

ENV NITROUS_PREVIEW_PORT 3000

# set up postgres
RUN \
  apt-get update && \
  apt-get install -y \
    postgresql=9.3+154 \
    postgresql-contrib=9.3+154 \
    libpq-dev=9.3.9-0ubuntu0.14.04 && \
  apt-get clean

COPY support/pg_hba.conf /etc/postgresql/9.3/main/pg_hba.conf

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

EXPOSE $NITROUS_PREVIEW_PORT

ENV NITROUS_README_URL https://nitrous-readmes.s3.amazonaws.com/django.2015-06-29.html
