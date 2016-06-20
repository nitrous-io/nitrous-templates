FROM quay.io/nitrous/ruby-base:latest
MAINTAINER Nitrous, Inc. <eng@nitrous.io>

# 2016-04-28
# jekyll 3.1.3

USER $NITROUS_USERNAME

RUN \
  /bin/bash -l -c \
  'gem install jekyll -v 3.1.3'

RUN \
  /bin/bash -l -c \
  'cd /home/$NITROUS_USERNAME/code && \
  jekyll new jekyll && \
  echo -e "\nhost: 0.0.0.0\nport: 4000\n" >> /home/$NITROUS_USERNAME/code/jekyll/_config.yml'

USER root

COPY support/pubstorm.default.json /home/$NITROUS_USERNAME/code/jekyll/

RUN /bin/bash -c 'chown $NITROUS_USERNAME:$NITROUS_USERNAME /home/$NITROUS_USERNAME/code/jekyll/pubstorm.default.json'

ENV NITROUS_PREVIEW_PORT 4000
EXPOSE $NITROUS_PREVIEW_PORT

USER nitrous
RUN /bin/bash -l -c 'npm install -g pubstorm@0.1.3'

# init should be executed by root
USER root

ENV NITROUS_README_URL https://nitrous-readmes.s3.amazonaws.com/jekyll.2015-08-12.html
