FROM quay.io/nitrous/nodejs:latest
MAINTAINER Nitrous, Inc. <eng@nitrous.io>

# 2015-06-29
# python3.4-dev       3.4.0-2ubuntu1.1
# python2.7-dev       2.7.6-8ubuntu0.2
# python-virtualenv   1.11.4-1
# virtualenvwrapper   4.1.1-1

RUN \
  apt-get update && \
  apt-get install -yy \
    python3.4-dev=3.4.0-2ubuntu1.1 \
    python2.7-dev=2.7.6-8ubuntu0.2 \
    python-virtualenv=1.11.4-1 \
    virtualenvwrapper=4.1.1-1 && \
  apt-get clean && \
  echo 'source /etc/bash_completion.d/virtualenvwrapper' >> /etc/zsh/zprofile

ENV NITROUS_README_URL https://nitrous-readmes.s3.amazonaws.com/python.2015-08-06.html
