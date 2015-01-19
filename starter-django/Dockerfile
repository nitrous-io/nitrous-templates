FROM quay.io/nitrous/python:latest

ENV NITROUS_APP_NAME starter
ENV NITROUS_APP_PATH /home/$NITROUS_USERNAME/code/$NITROUS_APP_NAME
ENV NITROUS_CMD /usr/local/bin/start-app
ENV NITROUS_PREVIEW_PORT 3000

# install postgres
RUN \
  apt-get update && \
  apt-get install -y postgresql=9.3+154 libpq-dev && \
  apt-get clean

COPY support/pg_hba.conf /etc/postgresql/9.3/main/pg_hba.conf

RUN mkdir -p $NITROUS_APP_PATH
COPY support/requirements.txt $NITROUS_APP_PATH/requirements.txt

RUN /bin/bash -c 'chown -R $NITROUS_USERNAME:$NITROUS_USERNAME /home/$NITROUS_USERNAME'

COPY support/install-app /tmp/install-app

# need to run together so that postgres is available
# see https://github.com/docker/docker/issues/871#issuecomment-19237998
RUN service postgresql start && \
  su postgres -c 'createdb development && createuser $NITROUS_USERNAME && psql -c "GRANT ALL PRIVILEGES ON DATABASE DEVELOPMENT TO $NITROUS_USERNAME;"' && \
  /bin/bash -l -c 'su $NITROUS_USERNAME --preserve-environment -c /tmp/install-app'

COPY support/start-app $NITROUS_CMD

EXPOSE $NITROUS_PREVIEW_PORT
