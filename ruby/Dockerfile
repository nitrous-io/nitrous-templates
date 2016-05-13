FROM quay.io/nitrous/ruby-base:latest
MAINTAINER Nitrous, Inc. <eng@nitrous.io>

# 2016-05-11
# pubstorm 0.1.1

USER root
RUN /bin/bash -l -c 'npm install -g pubstorm@0.1.2'

ENV NITROUS_README_URL https://nitrous-readmes.s3.amazonaws.com/ruby.2015-06-29.html
