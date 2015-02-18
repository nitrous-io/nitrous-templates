FROM quay.io/nitrous/ubuntu:latest
MAINTAINER Nitrous, Inc. <eng@nitrous.io>

# 2015-02-17
# cloud-sdk-docker d51ef2e632e5877bb123333bee56062fce35d678
# https://github.com/GoogleCloudPlatform/cloud-sdk-docker

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive && apt-get install -y -qq --no-install-recommends \
    wget unzip python php5-mysql php5-cli php5-cgi openjdk-7-jre-headless \
    openssh-client python-openssl && \
  apt-get clean

ENV CLOUDSDK_PYTHON_SITEPACKAGES 1

USER $NITROUS_USERNAME

RUN \
  cd /home/$NITROUS_USERNAME && \
  wget https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.zip && \
  unzip google-cloud-sdk.zip && \
  rm google-cloud-sdk.zip

RUN \
  /home/$NITROUS_USERNAME/google-cloud-sdk/install.sh --usage-reporting=true --disable-installation-options

# setup rc files
RUN \
  /bin/bash -l -c \
    'echo -e "\n# Google Cloud SDK\nsource \"/home/$NITROUS_USERNAME/google-cloud-sdk/path.zsh.inc\"\nsource \"/home/$NITROUS_USERNAME/google-cloud-sdk/completion.zsh.inc\"" >> /home/$NITROUS_USERNAME/.zshrc && \
    echo -e "\n# Google Cloud SDK\nsource \"/home/$NITROUS_USERNAME/google-cloud-sdk/path.bash.inc\"\nsource \"/home/$NITROUS_USERNAME/google-cloud-sdk/completion.bash.inc\"" >> /home/$NITROUS_USERNAME/.bashrc'

RUN yes | /home/$NITROUS_USERNAME/google-cloud-sdk/bin/gcloud components update pkg-go pkg-python pkg-java preview app

USER root
