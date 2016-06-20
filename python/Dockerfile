FROM quay.io/nitrous/python-base:latest
MAINTAINER Nitrous, Inc. <eng@nitrous.io>

# 2016-04-28
# python3.4-dev       3.4.3-1ubuntu1~14.04.3
# python2.7-dev       2.7.6-8ubuntu0.2
# python-virtualenv   1.11.4-1ubuntu1
# virtualenvwrapper   4.1.1-1

USER nitrous
RUN /bin/bash -l -c 'npm install -g pubstorm@0.1.3'

# init should be executed by root
USER root

ENV NITROUS_README_URL https://nitrous-readmes.s3.amazonaws.com/python.2015-08-06.html
