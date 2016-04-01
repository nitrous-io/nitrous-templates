FROM quay.io/nitrous/python:latest
MAINTAINER Nitrous, Inc. <eng@nitrous.io>

# 2016-03-28
# mkdocs  1.5.3

ENV NITROUS_PREVIEW_PORT 8000
EXPOSE $NITROUS_PREVIEW_PORT

RUN pip install mkdocs

USER $NITROUS_USERNAME

RUN \
  mkdir -p /home/$NITROUS_USERNAME/code && \
  cd /home/$NITROUS_USERNAME/code && \
  mkdocs new example

USER root

ENV NITROUS_README_URL https://nitrous-readmes.s3.amazonaws.com/mkdocs.2016-03-28.html
