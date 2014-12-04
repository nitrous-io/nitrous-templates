FROM nitrousio/ubuntu:trusty

RUN apt-get update

# install dependencies
RUN apt-get install -y nodejs=0.10.25~dfsg2-2ubuntu1
RUN apt-get install -y postgresql=9.3+154 libpq-dev

# set up ruby from rbenv
ENV RBENV_ROOT /home/action/.rbenv
ENV PATH /home/action/.rbenv/bin:/home/action/.rbenv/shims:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN apt-get install -y rbenv
RUN curl https://raw.githubusercontent.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash
RUN rbenv install 2.1.5
RUN rbenv global 2.1.5
ADD support/profile /home/action/.bash_profile
RUN chown -R action:action /home/action/.rbenv

# setup postgres
ADD support/pg_hba.conf /etc/postgresql/9.3/main/pg_hba.conf
ENV DATABASE_URL postgres://postgres@localhost/development
ENV PGUSER postgres
ENV PGDATABASE development

# install rails
RUN gem install rails -v 4.1.8

# PORT
ENV PORT 3000
EXPOSE 3000

# create rails app
WORKDIR /home/action/workspace
RUN rails new . --database=postgresql
ADD support/web /home/action/workspace/bin/web
RUN chmod +x /home/action/workspace/bin/web

# tweak rails app
RUN rm config/database.yml

# app ownership
RUN chown -R action:action /home/action

# nitrous config
ENV NITROUS_SHELL  "sudo -E -u action bash -l"
ENV NITROUS_SERVER "sudo -E -u action bin/web"
