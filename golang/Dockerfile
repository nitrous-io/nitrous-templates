FROM nitrousio/nodejs:latest
MAINTAINER Nitrous.IO <hello@nitrous.io>

RUN \
  mkdir -p /usr/local/opt/go && \
  chown -R nitrous:nitrous /usr/local/opt/go

RUN \
  su nitrous -c /bin/bash -c 'curl -s https://storage.googleapis.com/golang/go1.4.linux-amd64.tar.gz | tar -v -C /usr/local/opt -xz'

RUN \
  echo 'export GOROOT=/usr/local/opt/go' >> /etc/profile && \
  echo 'export GOPATH=/home/nitrous/go' >> /etc/profile && \
  echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> /etc/profile && \
  mkdir /home/nitrous/go && \
  chown -R nitrous:nitrous /home/nitrous/go
