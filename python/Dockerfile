FROM quay.io/nitrous/nodejs:latest
MAINTAINER Nitrous, Inc. <eng@nitrous.io>

# 2015-01-28
# python3.4-dev 3.4.0-2ubuntu1
# python2.7-dev 2.7.6-8
# python-virtualenv 1.11.4-1

RUN \
  apt-get update && \
  apt-get install -yy python3.4-dev=3.4.0-2ubuntu1 python2.7-dev=2.7.6-8 python-virtualenv=1.11.4-1 && \
  apt-get clean
