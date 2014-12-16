FROM nitrousio/nodejs:latest

# Install Meteor.
RUN curl https://install.meteor.com/ | sed 's/RELEASE=.*/RELEASE="1.0.1"/' | sh

# Setup a new Meteor app.
RUN su action -l -c /bin/bash -c 'mkdir -p /home/action/workspace && cd /home/action/workspace && meteor create ./app'

ADD support/start-app /home/action/workspace/start-app
RUN chmod +x /home/action/workspace/start-app

EXPOSE 3000

ENV NITROUS_USERNAME action
ENV NITROUS_CMD /home/action/workspace/start-app
ENV NITROUS_PREVIEW_PORT 3000

