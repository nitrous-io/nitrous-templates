FROM nitrousio/nodejs:latest

# Install Meteor.
RUN curl https://install.meteor.com/ | sed 's/RELEASE=.*/RELEASE="1.0.1"/' | sh

USER nitrous

# Setup a new Meteor app.
RUN mkdir -p /home/nitrous/workspace && \
    cd /home/nitrous/workspace && \
    USER=nitrous meteor create ./app

COPY support/start-app /usr/local/bin/start-app

EXPOSE 3000

# Reset user so that we run ENTRYPOINT/CMD as root.
USER root

ENV NITROUS_USERNAME nitrous
ENV NITROUS_CMD /usr/local/bin/start-app
ENV NITROUS_PREVIEW_PORT 3000

