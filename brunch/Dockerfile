FROM quay.io/nitrous/nodejs-base:latest
MAINTAINER Nitrous, Inc. <eng@nitrous.io>

# 2016-05-03
# brunch 2.7.4

USER $NITROUS_USERNAME

RUN /bin/bash -l -c 'npm install -g brunch'

RUN /bin/bash -l -c \
  'cd /home/$NITROUS_USERNAME/code && \
  brunch new example -s es6 && \
  cd example && \
  brunch build'

USER root

COPY support/pubstorm.default.json /home/$NITROUS_USERNAME/code/example/

RUN /bin/bash -c 'chown $NITROUS_USERNAME:$NITROUS_USERNAME /home/$NITROUS_USERNAME/code/example/pubstorm.default.json'

USER root
RUN /bin/bash -l -c 'npm install -g pubstorm@0.1.2'

ENV NITROUS_PREVIEW_PORT 3333
EXPOSE $NITROUS_PREVIEW_PORT

ENV NITROUS_README_URL https://nitrous-readmes.s3.amazonaws.com/brunch.2016-05-03.html
