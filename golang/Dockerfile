FROM quay.io/nitrous/nodejs:latest
MAINTAINER Nitrous, Inc. <eng@nitrous.io>

# 2015-01-28
# go 1.4.1

RUN \
  mkdir -p /usr/local/opt/go && \
  /bin/bash -c 'chown -R $NITROUS_USERNAME:$NITROUS_USERNAME /usr/local/opt/go'

USER $NITROUS_USERNAME

RUN \
  /bin/bash -c 'curl -s https://storage.googleapis.com/golang/go1.4.1.linux-amd64.tar.gz | tar -v -C /usr/local/opt -xz'

USER root

RUN \
  echo 'export GOROOT=/usr/local/opt/go' >> /etc/profile && \
  echo 'export GOPATH=/home/$NITROUS_USERNAME/code/go' >> /etc/profile && \
  echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> /etc/profile && \
  mkdir /home/$NITROUS_USERNAME/code/go && \
  ln -s /home/$NITROUS_USERNAME/code/go /home/$NITROUS_USERNAME/go && \
  chown -h $NITROUS_USERNAME:$NITROUS_USERNAME /home/$NITROUS_USERNAME/go && \
  chown -R $NITROUS_USERNAME:$NITROUS_USERNAME /home/$NITROUS_USERNAME/code/go
