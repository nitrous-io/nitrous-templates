FROM nitrousio/nodejs:latest

# Install Meteor.
RUN curl https://install.meteor.com/ | sed 's/RELEASE=.*/RELEASE="1.0.1"/' | sh

USER action

# Setup a new Meteor app.
RUN mkdir -p /home/action/workspace && \
    cd /home/action/workspace && \
    USER=action meteor create ./app

COPY support/start-app /home/action/workspace/start-app

EXPOSE 3000

# Reset user so that we run ENTRYPOINT/CMD as root.
USER root

ENV NITROUS_USERNAME action
ENV NITROUS_CMD /home/action/workspace/start-app
ENV NITROUS_PREVIEW_PORT 3000

