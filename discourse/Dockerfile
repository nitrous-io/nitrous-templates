FROM quay.io/nitrous/rails:latest
MAINTAINER Nitrous, Inc. <eng@nitrous.io>

# 2015-02-18
# discourse     1.1.3
# phantomjs     1.9.8
# redis-server  2:2.8.4-2

# install redis
RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    redis-server=2:2.8.4-2 && \
  apt-get clean

# install phantomjs
RUN /bin/bash -l -c \
  'cd /tmp && \
  wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.8-linux-x86_64.tar.bz2 && \
  tar xvjf phantomjs-1.9.8-linux-x86_64.tar.bz2 && \
  rm -rf /tmp/phantomjs-1.9.8-linux-x86_64.tar.bz2 && \
  mv phantomjs-1.9.8-linux-x86_64 /usr/local/opt/phantomjs && \
  echo "export PATH=$PATH:/usr/local/opt/phantomjs/bin" >> /etc/profile'

# erase example rails project
RUN rm -rf /home/$NITROUS_USERNAME/code/example

USER $NITROUS_USERNAME

# setup discourse
RUN /bin/bash -l -c \
  'cd /home/$NITROUS_USERNAME/code && \
  git clone https://github.com/discourse/discourse.git discourse && \
  cd discourse && \
  git checkout v1.1.3 && \
  bundle install && \
  cp .env.sample .env && \
  echo -e "\nPORT=3000" >> .env && \
  mkdir -p public/uploads && \
  mkdir -p public/tombstone'

RUN /bin/bash -l -c \
  'sudo service postgresql start && \
  sudo service redis-server start && \
  cd /home/$NITROUS_USERNAME/code/discourse && \
  rake db:create db:migrate && \
  rake db:seed && \
  sudo service redis-server stop && \
  sudo service postgresql stop'

USER root

COPY support/start-app /home/$NITROUS_USERNAME/code/discourse/start-app
RUN /bin/bash -c 'chown $NITROUS_USERNAME:$NITROUS_USERNAME /home/$NITROUS_USERNAME/code/discourse/start-app'
