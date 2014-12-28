FROM nitrousio/ruby:latest

RUN apt-get update

# install dependencies
RUN apt-get install -y postgresql=9.3+154 libpq-dev

# setup postgres
ADD support/pg_hba.conf /etc/postgresql/9.3/main/pg_hba.conf
ENV DATABASE_URL postgres://postgres@localhost/development
ENV PGUSER postgres
ENV PGDATABASE development

# install rails
RUN su nitrous -l -c /bin/bash -c 'gem install rails -v 4.1.8'

# fix ownership
RUN chown -R nitrous:nitrous /home/nitrous

# create rails app
RUN su nitrous -l -c /bin/bash -c 'mkdir -p /home/nitrous/workspace && cd /home/nitrous/workspace && rails new app --database=postgresql --skip-bundle'

# install bundle to system gems
# we remove $HOME/.bundle so that we can properly install to system gems instead of ./bundle.
RUN su nitrous -l -c /bin/bash -c 'rm -rf /home/nitrous/.bundle'
RUN su nitrous -l -c /bin/bash -c 'cd /home/nitrous/workspace/app && bundle install --system'

ADD support/web /home/nitrous/workspace/app/bin/web
RUN chmod +x /home/nitrous/workspace/app/bin/web

ADD support/database.yml /home/nitrous/workspace/app/config/database.yml
RUN chown nitrous:nitrous /home/nitrous/workspace/app/config/database.yml

EXPOSE 3000

# nitrous config
ENV NITROUS_USERNAME nitrous
ENV NITROUS_CMD /home/nitrous/workspace/app/bin/web
ENV NITROUS_PREVIEW_PORT 3000

