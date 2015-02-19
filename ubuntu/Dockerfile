FROM quay.io/nitrous/ubuntu-bare:latest
MAINTAINER Nitrous, Inc. <eng@nitrous.io>

# Install essential tools
RUN \
  apt-get update && \
  apt-get -y dist-upgrade && \
  DEBIAN_FRONTEND=noninteractive apt-get install -yy --no-install-recommends build-essential clang software-properties-common \
    checkinstall cmake gdb dnsutils curl wget screen tmux lsof zsh silversearcher-ag ack-grep \
    gnupg bzip2 zip unzip unison man-db sqlite3 bison gawk telnet psmisc vim-nox emacs24-nox \
    nano git git-svn mercurial bzr subversion libssl-dev libyaml-dev libreadline6-dev zlib1g-dev \
    libxml2-dev libxslt1-dev libbz2-dev libncurses5-dev libncursesw5-dev libsqlite3-dev libffi-dev \
    libcurl4-openssl-dev libmagickwand-dev imagemagick autoconf rsync && \
  apt-get clean

COPY files/gitconfig /home/$NITROUS_USERNAME/.gitconfig
COPY files/tmux.conf /home/$NITROUS_USERNAME/.tmux.conf
COPY files/vimrc /home/$NITROUS_USERNAME/.vimrc

RUN \
  /bin/bash -c 'chown -R $NITROUS_USERNAME:$NITROUS_USERNAME /home/$NITROUS_USERNAME/.gitconfig /home/$NITROUS_USERNAME/.tmux.conf /home/$NITROUS_USERNAME/.vimrc /home/$NITROUS_USERNAME/README.md'

USER $NITROUS_USERNAME

# hushlogin
RUN \
  /bin/bash -c 'touch /home/$NITROUS_USERNAME/.hushlogin'

# Install oh-my-zsh
RUN \
  /bin/bash -c 'git clone https://github.com/robbyrussell/oh-my-zsh.git /home/$NITROUS_USERNAME/.oh-my-zsh && \
    cp /home/$NITROUS_USERNAME/.oh-my-zsh/templates/zshrc.zsh-template /home/$NITROUS_USERNAME/.zshrc && \
    sed -i "s|# DISABLE_AUTO_UPDATE|DISABLE_AUTO_UPDATE|g" /home/$NITROUS_USERNAME/.zshrc && \
    sudo chsh -s /bin/zsh $NITROUS_USERNAME && \
    sudo touch /etc/profile.d/dummy.sh && \
    sudo /bin/bash -c "echo source /etc/profile >> /etc/zsh/zprofile"'

# setup vim
RUN \
  /bin/bash -c 'git clone --branch v0.10.2 --depth 1 https://github.com/gmarik/Vundle.vim.git /home/$NITROUS_USERNAME/.vim/bundle/Vundle.vim && \
    vim -i NONE -c PluginInstall -c quitall > /dev/null'

# make code dir
RUN \
  mkdir /home/$NITROUS_USERNAME/code && \
  chown $NITROUS_USERNAME:$NITROUS_USERNAME /home/$NITROUS_USERNAME/code

ENV NITROUS_README_URL https://nitrous-readmes.s3.amazonaws.com/ubuntu.html

USER root
