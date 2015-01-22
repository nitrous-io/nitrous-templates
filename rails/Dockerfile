FROM quay.io/nitrous/ruby:latest

ENV NITROUS_APP_NAME starter
ENV NITROUS_APP_PATH /home/$NITROUS_USERNAME/code/$NITROUS_APP_NAME
ENV NITROUS_PREVIEW_PORT 3000

RUN \
  apt-get update && \
  apt-get install -y postgresql=9.3+154 libpq-dev && \
  apt-get clean

# setup postgres
ADD support/pg_hba.conf /etc/postgresql/9.3/main/pg_hba.conf
ENV DATABASE_URL postgres://postgres@localhost/development
ENV PGUSER postgres
ENV PGDATABASE development

USER $NITROUS_USERNAME

RUN /bin/bash -l -c 'gem install rails -v 4.1.8'

# create rails app
RUN /bin/bash -l -c 'mkdir -p /home/$NITROUS_USERNAME/code && cd /home/$NITROUS_USERNAME/code && rails new $NITROUS_APP_NAME --database=postgresql --skip-bundle'

# install bundle to system gems
# we remove $HOME/.bundle so that we can properly install to system gems instead of ./bundle.
RUN /bin/bash -c 'rm -rf /home/$NITROUS_USERNAME/.bundle'
RUN /bin/bash -l -c 'cd $NITROUS_APP_PATH && bundle install --system'

USER root

COPY support/database.yml $NITROUS_APP_PATH/config/database.yml
RUN /bin/bash -c 'chown $NITROUS_USERNAME:$NITROUS_USERNAME $NITROUS_APP_PATH/config/database.yml'

EXPOSE $NITROUS_PREVIEW_PORT
