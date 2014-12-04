FROM nitrousio/ubuntu:trusty

RUN apt-get update

# install dependencies
RUN apt-get install -y nodejs=0.10.25~dfsg2-2ubuntu1
RUN apt-get install -y postgresql=9.3+154 libpq-dev

# create app user that can sudo
RUN useradd -ms /bin/bash app
ADD support/sudo /etc/sudoers.d/app
RUN chmod 440 /etc/sudoers.d/app
ENV NITROUS_SHELL "sudo -E -u app bash -l"

# set up ruby from rbenv
ENV RBENV_ROOT /home/app/.rbenv
ENV PATH /home/app/.rbenv/bin:/home/app/.rbenv/shims:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN apt-get install -y rbenv
RUN curl https://raw.githubusercontent.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash
RUN rbenv install 2.1.5
RUN rbenv global 2.1.5
ADD support/profile /home/app/.bash_profile
RUN chown -R app:app /home/app/.rbenv

# setup postgres
ADD support/pg_hba.conf /etc/postgresql/9.3/main/pg_hba.conf
ENV DATABASE_URL postgres://postgres@localhost/app-development
ENV PGUSER postgres
ENV PGDATABASE app-development

# install rails
RUN gem install rails -v 4.1.8

# PORT
ENV PORT 3000
EXPOSE 3000

# create rails app
WORKDIR /app
RUN rails new . --database=postgresql
ADD support/web /app/bin/web
RUN chmod +x /app/bin/web
ENV NITROUS_SERVER "sudo -E -u app bin/web"

# tweak rails app
RUN rm config/database.yml

# app ownership
RUN chown -R app:app /app /home/app
