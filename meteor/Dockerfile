FROM quay.io/nitrous/nodejs-base:latest
MAINTAINER Nitrous, Inc. <eng@nitrous.io>

# 2016-04-28
# meteor          1.3.2.4
# heroku-toolbelt 3.42.25

ENV NITROUS_PREVIEW_PORT 3000
ENV NITROUS_USERNAME nitrous

# Install Meteor.
USER $NITROUS_USERNAME
RUN curl https://install.meteor.com/ | sed 's/RELEASE=.*/RELEASE="1.3.2.4"/' | sh


# Setup a new Meteor app.
RUN \
  /bin/bash -c \
    'mkdir -p /home/$NITROUS_USERNAME/code && \
    USER=$NITROUS_USERNAME meteor create /home/$NITROUS_USERNAME/code/example'

USER root

COPY support/start-app /home/$NITROUS_USERNAME/code/example/start-app
RUN /bin/bash -c 'chown $NITROUS_USERNAME:$NITROUS_USERNAME /home/$NITROUS_USERNAME/code/example/start-app'

# set up heroku toolbelt
RUN /bin/bash -c 'wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh'

EXPOSE $NITROUS_PREVIEW_PORT

USER nitrous
RUN /bin/bash -l -c 'npm install -g pubstorm@0.1.3'

# init should be executed by root
USER root

ENV NITROUS_README_URL https://nitrous-readmes.s3.amazonaws.com/meteor.2016-03-21.html
