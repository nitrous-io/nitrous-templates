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
RUN su action -l -c /bin/bash -c 'gem install rails -v 4.1.8'

# fix ownership
RUN chown -R action:action /home/action

# create rails app
RUN su action -l -c /bin/bash -c 'mkdir -p /home/action/workspace && cd /home/action/workspace && rails new app --database=postgresql --skip-bundle'

# install bundle to system gems
# we remove $HOME/.bundle so that we can properly install to system gems instead of ./bundle.
RUN su action -l -c /bin/bash -c 'rm -rf /home/action/.bundle'
RUN su action -l -c /bin/bash -c 'cd /home/action/workspace/app && bundle install --system'

ADD support/web /home/action/workspace/app/bin/web
RUN chmod +x /home/action/workspace/app/bin/web

ADD support/database.yml /home/action/workspace/app/config/database.yml
RUN chown action:action /home/action/workspace/app/config/database.yml

EXPOSE 3000

# nitrous config
ENV NITROUS_USERNAME action
ENV NITROUS_CMD /home/action/workspace/app/bin/web
ENV NITROUS_PREVIEW_PORT 3000

