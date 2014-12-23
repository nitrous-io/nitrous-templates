FROM nitrousio/nodejs:latest
MAINTAINER Nitrous.IO <hello@nitrous.io>

RUN \
  mkdir -p /usr/local/opt/rbenv && \
  chown -R action:action /usr/local/opt/rbenv

RUN \
  su action -l -c /bin/bash -c \
  'mkdir /home/action/.bundle && \
  git clone https://github.com/sstephenson/rbenv.git /usr/local/opt/rbenv && \
  git clone https://github.com/sstephenson/ruby-build.git /usr/local/opt/rbenv/plugins/ruby-build'

RUN \
  echo 'export RBENV_ROOT=/usr/local/opt/rbenv' >> /etc/profile && \
  echo 'export PATH=$RBENV_ROOT/bin:$PATH' >> /etc/profile && \
  echo 'eval "$($RBENV_ROOT/bin/rbenv init -)"' >> /etc/profile && \
  echo 'export PATH=.bundle/binstubs:$PATH' >> /etc/profile

ADD files/.gemrc /home/action/.gemrc
ADD files/bundle-config /home/action/.bundle/config

RUN \
  chown -R action:action /home/action/.gemrc /home/action/.bundle

RUN \
  su action -l -c /bin/bash -c \
  'rbenv install 2.1.3 && \
  rbenv global 2.1.3 && \
  gem install bundler rails'
