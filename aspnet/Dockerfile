FROM nitrousio/nodejs:latest

ENV KRE_VERSION 1.0.0-beta1
ENV KRE_USER_HOME /home/nitrous

# Add package awareness of Mono
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb http://download.mono-project.com/repo/debian wheezy main" > /etc/apt/sources.list.d/mono-xamarin.list
RUN apt-get update

# Install Mono + requirements for libuv + k
RUN apt-get install -yy mono-devel=3.10.0-0xamarin2 fsharp nuget autoconf automake libtool

RUN apt-get clean

# Install K environment for managing versions
RUN su nitrous -l -c /bin/bash -c "curl -sSL https://raw.githubusercontent.com/aspnet/Home/v$KRE_VERSION/kvminstall.sh | KRE_USER_HOME=$KRE_USER_HOME sh"
RUN su nitrous -l -c /bin/bash -c "source $KRE_USER_HOME/kvm/kvm.sh \
    && kvm install $KRE_VERSION -a default \
    && kvm alias default | xargs -i ln -s $KRE_USER_HOME/.kre/packages/{} $KRE_USER_HOME/.kre/packages/default"

# Install libuv (used by the Kestrel web server)
RUN LIBUV_VERSION=1.0.0-rc2 \
    && curl -sSL https://github.com/joyent/libuv/archive/v${LIBUV_VERSION}.tar.gz | tar zxfv - -C /usr/local/src \
    && cd /usr/local/src/libuv-$LIBUV_VERSION \
    && sh autogen.sh && ./configure && make && make install \
    && rm -rf /usr/local/src/libuv-$LIBUV_VERSION \
    && ldconfig

ENV PATH $PATH:$KRE_USER_HOME/.kre/packages/default/bin

RUN su nitrous -l -c /bin/bash -c 'echo PATH=\$PATH:/home/nitrous/.kre/packages/default/bin >> /home/nitrous/.bash_profile'

# Sync with Mozilla's cert listing (using local file because the server is unreliable)
# Running twice because the second time seems to force Mono to persist it
COPY support/certdata.txt /tmp/certdata.txt
RUN /bin/bash --login -c 'mozroots --machine --import --sync --file /tmp/certdata.txt && mozroots --machine --import --sync --file /tmp/certdata.txt'

# Pull down example template
RUN su nitrous -l -c /bin/bash -c "git clone https://github.com/nitrous-io/aspnet5-mvc-sample.git /home/nitrous/workspace/starter && rm -rf /home/nitrous/workspace/starter/.git"
# Install npm dependencies
RUN su nitrous -l -c /bin/bash -c "source /etc/profile && cd /home/nitrous/workspace/starter && ./script/setup && npm install -g gulp@3.8.10"
# Install k dependencies
RUN su nitrous -l -c /bin/bash -c "cd /home/nitrous/workspace/starter && kpm restore"

COPY support/start-app /usr/local/bin/start-app

RUN chown -R nitrous:nitrous /home/nitrous

EXPOSE 5004

# nitrous config
ENV NITROUS_USERNAME nitrous
ENV NITROUS_CMD /usr/local/bin/start-app
ENV NITROUS_PREVIEW_PORT 5004