FROM quay.io/nitrous/ruby-base:latest
MAINTAINER Nitrous, Inc. <eng@nitrous.io>

USER $NITROUS_USERNAME

RUN /bin/bash -l -c 'gem install --no-ri --no-rdoc middleman -v 4.1.7'

RUN /bin/bash -l -c 'cd /home/$NITROUS_USERNAME/code && \
  yes | middleman init example'

COPY support/pubstorm.default.json /home/$NITROUS_USERNAME/code/example/

USER root

ENV NITROUS_PREVIEW_PORT 4567
EXPOSE $NITROUS_PREVIEW_PORT

USER nitrous
RUN /bin/bash -l -c 'npm install -g pubstorm@0.1.3'

# init should be executed by root
USER root

ENV NITROUS_README_URL https://nitrous-readmes.s3.amazonaws.com/middleman.2016-04-28.html
