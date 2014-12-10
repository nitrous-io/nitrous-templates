FROM nitrousio/ruby

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

# PORT
ENV PORT 3000
EXPOSE 3000

# fix ownership
RUN chown -R action:action /home/action

# create rails app
RUN su action -l -c /bin/bash -c 'mkdir -p /home/action/workspace && cd /home/action/workspace && rails new app --database=postgresql'

ADD support/web /home/action/workspace/app/bin/web
RUN chmod +x /home/action/workspace/app/bin/web

ADD support/database.yml /home/action/workspace/app/config/database.yml
RUN chown action:action /home/action/workspace/app/config/database.yml

# nitrous config
ENV NITROUS_USERNAME action
# use a subshell so that cd works properly
ENV NITROUS_CMD (cd /home/action/workspace/app && bin/web)

