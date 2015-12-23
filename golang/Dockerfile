FROM quay.io/nitrous/nodejs:latest
MAINTAINER Nitrous, Inc. <eng@nitrous.io>

# 2015-12-22
# go 1.5.2

RUN \
  mkdir -p /usr/local/opt && \
  mkdir -p /tmp/go-1.5.2 && \
  curl -s https://storage.googleapis.com/golang/go1.5.2.linux-amd64.tar.gz | tar -xvz -C /tmp/go-1.5.2 && \
  mv /tmp/go-1.5.2/go /usr/local/opt/go-1.5.2 && \
  rm -rf /tmp/go-1.5.2 && \
  chown -R $NITROUS_USERNAME:$NITROUS_USERNAME /usr/local/opt/go-1.5.2 && \
  cd /usr/local/opt && \
  ln -s go-1.5.2 go && \
  chown -h $NITROUS_USERNAME:$NITROUS_USERNAME /usr/local/opt/go

RUN \
  echo "export GOPATH=/home/$NITROUS_USERNAME/code/go" >> /etc/profile && \
  echo 'export GOROOT=/usr/local/opt/go' >> /etc/profile && \
  echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> /etc/profile && \
  mkdir /home/$NITROUS_USERNAME/code/go && \
  ln -s /home/$NITROUS_USERNAME/code/go /home/$NITROUS_USERNAME/go && \
  chown -h $NITROUS_USERNAME:$NITROUS_USERNAME /home/$NITROUS_USERNAME/go && \
  chown -R $NITROUS_USERNAME:$NITROUS_USERNAME /home/$NITROUS_USERNAME/code/go

USER $NITROUS_USERNAME

RUN \
  /bin/bash -l -c \
    'go version && \
    go get golang.org/x/tools/cmd/goimports && \
    go get golang.org/x/tools/cmd/oracle && \
    go get golang.org/x/tools/cmd/gorename && \
    go get golang.org/x/tools/cmd/stringer && \
    go get golang.org/x/tools/cmd/benchcmp && \
    go get github.com/golang/lint/golint && \
    go get github.com/tools/godep'

USER root

EXPOSE 6060

ENV NITROUS_README_URL https://s3.amazonaws.com/nitrous-readmes/golang.2015-12-23.html
