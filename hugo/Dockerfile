FROM quay.io/nitrous/nodejs:latest
MAINTAINER Nitrous, Inc. <eng@nitrous.io>

# 2016-05-03
# hugo 0.15

RUN /bin/bash -c \
  'cd /tmp && \
  wget https://github.com/spf13/hugo/releases/download/v0.15/hugo_0.15_linux_amd64.tar.gz && \
  tar xf hugo_0.15_linux_amd64.tar.gz && \
  mv hugo_0.15_linux_amd64/hugo_0.15_linux_amd64 /usr/local/bin/hugo &&   \
  rm -rf hugo_0.15_linux_amd64 hugo_0.15_linux_amd64.tar.gz'

USER $NITROUS_USERNAME

RUN /bin/bash -c \
  'cd /home/$NITROUS_USERNAME/code && \
  hugo new site example && \
  mkdir -p example/themes && \
  cd example/themes && \
  git clone https://github.com/Zenithar/hugo-theme-crisp.git && \
  cd /home/$NITROUS_USERNAME/code/example && \
  hugo new post/hello-nitrous.md && \
  hugo undraft content/post/hello-nitrous.md && \
  hugo --theme hugo-theme-crisp'

USER root

COPY support/pubstorm.default.json /home/$NITROUS_USERNAME/code/example/

RUN /bin/bash -c 'chown $NITROUS_USERNAME:$NITROUS_USERNAME /home/$NITROUS_USERNAME/code/example/pubstorm.default.json'

ENV NITROUS_PREVIEW_PORT 1313
EXPOSE $NITROUS_PREVIEW_PORT

ENV NITROUS_README_URL https://nitrous-readmes.s3.amazonaws.com/hugo.2016-05-03.html
