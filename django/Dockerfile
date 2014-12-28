FROM nitrousio/nodejs:latest
# consider changing nitrousio/python accordingly

RUN apt-get update

# 14.04 comes with and python2.7.6 and python3.4 by default
RUN apt-get install -yy python3.4-dev python-virtualenv

# install postgres
RUN apt-get install -y postgresql=9.3+154 libpq-dev
ADD support/pg_hba.conf /etc/postgresql/9.3/main/pg_hba.conf

RUN mkdir -p /home/nitrous/workspace/app
ADD support/requirements.txt /home/nitrous/workspace/app/requirements.txt

# fix ownership
RUN chown -R nitrous:nitrous /home/nitrous

COPY support/install-app /tmp/install-app

# need to run together so that postgres is available
# see https://github.com/docker/docker/issues/871#issuecomment-19237998
RUN service postgresql start && \
  su postgres -c 'createdb development && createuser nitrous && psql -c "GRANT ALL PRIVILEGES ON DATABASE DEVELOPMENT TO nitrous;"' && \
  su nitrous -l -c /bin/bash -c '/tmp/install-app'

COPY support/start-app /usr/local/bin/start-app

EXPOSE 3000

ENV NITROUS_USERNAME nitrous
ENV NITROUS_CMD /usr/local/bin/start-app
ENV NITROUS_PREVIEW_PORT 3000
