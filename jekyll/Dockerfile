FROM quay.io/nitrous/ruby:latest
MAINTAINER Nitrous, Inc. <eng@nitrous.io>

# 2015-08-08
# jekyll 2.5.3

USER $NITROUS_USERNAME

RUN \
  /bin/bash -l -c \
  'gem install jekyll -v 2.5.3'

RUN \
  /bin/bash -l -c \
  'cd /home/$NITROUS_USERNAME/code && \
  jekyll new jekyll && \
  echo -e "\nhost: 0.0.0.0\nport: 4000\n" >> /home/$NITROUS_USERNAME/code/jekyll/_config.yml'

USER root

ENV NITROUS_PREVIEW_PORT 4000
EXPOSE $NITROUS_PREVIEW_PORT

ENV NITROUS_README_URL https://nitrous-readmes.s3.amazonaws.com/jekyll.2015-08-09.html
