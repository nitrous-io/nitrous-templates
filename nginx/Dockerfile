FROM quay.io/nitrous/nodejs-base:latest
MAINTAINER Nitrous, Inc. <eng@nitrous.io>

# 2016-03-30
# nginx     1.8.1-1+trusty0

ENV NITROUS_PREVIEW_PORT 3000

# install nginx

RUN \
  echo "deb http://ppa.launchpad.net/nginx/stable/ubuntu $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/nginx-stable.list && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C300EE8C && \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get -y install \
    nginx=1.8.1-1+trusty0 && \
  apt-get clean

# nginx upstart conf scripts are still buggy and doesn't work, use sysvinit instead

RUN \
  rm /etc/init/nginx.conf && \
  update-rc.d nginx defaults

# setup public_html dir

COPY support/index.html /tmp/index.html

RUN \
  /bin/bash -c \
    'mkdir /home/$NITROUS_USERNAME/code/public_html && \
    mv /tmp/index.html /home/$NITROUS_USERNAME/code/public_html/index.html && \
    chown -R $NITROUS_USERNAME:$NITROUS_USERNAME /home/$NITROUS_USERNAME/code/public_html && \
    chmod 775 /home/$NITROUS_USERNAME/code/public_html && \
    ln -s /home/$NITROUS_USERNAME/code/public_html /home/$NITROUS_USERNAME/public_html && \
    ln -s /home/$NITROUS_USERNAME/code/public_html /home/$NITROUS_USERNAME/www && \
    chown -h $NITROUS_USERNAME:$NITROUS_USERNAME /home/$NITROUS_USERNAME/public_html && \
    chown -h $NITROUS_USERNAME:$NITROUS_USERNAME /home/$NITROUS_USERNAME/www'

COPY support/nginx-default /etc/nginx/sites-available/default

# symlink public_html dir to nginx's webroot

RUN \
  /bin/bash -c \
    'rm -rf /var/www/html && \
    ln -s /home/$NITROUS_USERNAME/code/public_html /var/www/html && \
    chown -R $NITROUS_USERNAME:www-data /home/$NITROUS_USERNAME/code/public_html && \
    chown -h $NITROUS_USERNAME:www-data /var/www/html'

# Copy nitrous-scripts.json into home folder.
COPY support/nitrous-scripts.json /home/$NITROUS_USERNAME/.nitrous-scripts.json
RUN /bin/bash -c \
  'chown $NITROUS_USERNAME:$NITROUS_USERNAME /home/$NITROUS_USERNAME/.nitrous-scripts.json && \
  chmod 644 /home/$NITROUS_USERNAME/.nitrous-scripts.json'

USER root
RUN /bin/bash -l -c 'npm install -g pubstorm@0.1.1'

EXPOSE $NITROUS_PREVIEW_PORT
