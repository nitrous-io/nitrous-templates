FROM nitrousio/nodejs:latest

ENV NITROUS_APP_NAME starter
ENV NITROUS_APP_PATH /home/$NITROUS_USERNAME/code/$NITROUS_APP_NAME
ENV NITROUS_CMD /usr/local/bin/start-app
ENV NITROUS_PREVIEW_PORT 3000

# Install Meteor.
RUN curl https://install.meteor.com/ | sed 's/RELEASE=.*/RELEASE="1.0.1"/' | sh

USER $NITROUS_USERNAME

# Setup a new Meteor app.
RUN \
  /bin/bash -c \
    'mkdir -p /home/$NITROUS_USERNAME/code && \
    USER=$NITROUS_USERNAME meteor create $NITROUS_APP_PATH'

USER root

COPY support/start-app $NITROUS_CMD

EXPOSE $NITROUS_PREVIEW_PORT
