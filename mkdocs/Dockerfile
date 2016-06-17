FROM quay.io/nitrous/python-base:latest
MAINTAINER Nitrous, Inc. <eng@nitrous.io>

# 2016-03-28
# mkdocs  0.15.3

ENV NITROUS_PREVIEW_PORT 8000
EXPOSE $NITROUS_PREVIEW_PORT

RUN pip install mkdocs

RUN apt-get update && \
    apt-get install -y libyaml-dev && \
    apt-get clean

USER $NITROUS_USERNAME

RUN \
  mkdir -p /home/$NITROUS_USERNAME/code && \
  cd /home/$NITROUS_USERNAME/code && \
  mkdocs new example

USER nitrous
RUN /bin/bash -l -c 'npm install -g pubstorm@0.1.3'

ENV NITROUS_README_URL https://nitrous-readmes.s3.amazonaws.com/mkdocs.2016-03-28.html
