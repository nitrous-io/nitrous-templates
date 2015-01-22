FROM quay.io/nitrous/nodejs:latest

ENV NITROUS_APP_NAME starter
ENV NITROUS_APP_PATH /home/$NITROUS_USERNAME/code/$NITROUS_APP_NAME
ENV NITROUS_PREVIEW_PORT 3000

ENV KRE_VERSION 1.0.0-beta2
ENV KRE_USER_HOME /home/$NITROUS_USERNAME/.kre

# Install Mono + requirements for libuv + k
RUN \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
  echo "deb http://download.mono-project.com/repo/debian wheezy main" > /etc/apt/sources.list.d/mono-xamarin.list && \
  apt-get update && \
  apt-get install -yy mono-devel fsharp nuget autoconf automake libtool && \
  apt-get clean

# Install libuv (used by the Kestrel web server)
RUN \
  LIBUV_VERSION=1.2.1 \
    && curl -sSL https://github.com/libuv/libuv/archive/v${LIBUV_VERSION}.tar.gz | tar zxfv - -C /usr/local/src \
    && cd /usr/local/src/libuv-$LIBUV_VERSION \
    && sh autogen.sh && ./configure && make && make install \
    && cd / \
    && rm -rf /usr/local/src/libuv-$LIBUV_VERSION \
    && ldconfig

# Sync with Mozilla's cert listing (using local file because the server is unreliable)
# Running twice because the second time seems to force Mono to persist it
COPY support/certdata.txt /tmp/certdata.txt
RUN /bin/bash --login -c 'mozroots --machine --import --sync --file /tmp/certdata.txt && mozroots --machine --import --sync --file /tmp/certdata.txt'

# Install K environment for managing versions
USER $NITROUS_USERNAME
RUN \
  /bin/bash -l -c "curl -sSL https://raw.githubusercontent.com/aspnet/Home/v$KRE_VERSION/kvminstall.sh | sh"

USER root
RUN \
  echo "source $KRE_USER_HOME/kvm/kvm.sh" >> /etc/profile && \
  echo "PATH=$KRE_USER_HOME/packages/default/bin:\$PATH" >> /etc/profile

USER $NITROUS_USERNAME
RUN \
  /bin/bash -l -c \
    "kvm install $KRE_VERSION -a default && \
    kvm alias default | xargs -i ln -s $KRE_USER_HOME/packages/{} $KRE_USER_HOME/packages/default"

# Pull down example template
RUN /bin/bash -l -c "git clone -b v0.2 https://github.com/nitrous-io/aspnet5-mvc-sample.git $NITROUS_APP_PATH && rm -rf $NITROUS_APP_PATH/.git"
# Install npm dependencies
RUN /bin/bash -l -c "cd $NITROUS_APP_PATH && ./script/setup && npm install -g gulp@3.8.10"
# Install k dependencies
RUN /bin/bash -l -c "cd $NITROUS_APP_PATH && kpm restore"

USER root

EXPOSE $NITROUS_PREVIEW_PORT
