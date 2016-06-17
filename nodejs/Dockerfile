FROM quay.io/nitrous/nodejs-base:latest
MAINTAINER Nitrous, Inc. <eng@nitrous.io>

# 2016-04-28
# pubstorm        0.1.1

USER nitrous
RUN /bin/bash -l -c 'npm install -g pubstorm@0.1.3'

USER root
ENV NITROUS_README_URL https://nitrous-readmes.s3.amazonaws.com/nodejs.2015-10-20.html
