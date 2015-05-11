FROM quay.io/nitrous/nodejs:latest
MAINTAINER Nitrous, Inc. <eng@nitrous.io>

# 2015-01-28
# meteor  1.0.3.1

ENV NITROUS_PREVIEW_PORT 3000

# Install Meteor.
RUN curl https://install.meteor.com/ | sed 's/RELEASE=.*/RELEASE="1.0.3.1"/' | sh

USER $NITROUS_USERNAME

# Setup a new Meteor app.
RUN \
  /bin/bash -c \
    'mkdir -p /home/$NITROUS_USERNAME/code && \
    USER=$NITROUS_USERNAME meteor create /home/$NITROUS_USERNAME/code/example'

USER root

COPY support/start-app /home/$NITROUS_USERNAME/code/example/start-app
RUN /bin/bash -c 'chown $NITROUS_USERNAME:$NITROUS_USERNAME /home/$NITROUS_USERNAME/code/example/start-app'

EXPOSE $NITROUS_PREVIEW_PORT

ENV NITROUS_README_URL https://nitrous-readmes.s3.amazonaws.com/meteor.2015-05-11.html
