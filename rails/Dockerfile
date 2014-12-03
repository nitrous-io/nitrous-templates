FROM ubuntu:14.10

RUN apt-get update

RUN apt-get install -y build-essential curl wget
RUN apt-get install -y ruby=1:2.1.0.0~ubuntu3 rubygems
RUN apt-get install -y nodejs=0.10.25~dfsg2-2ubuntu1
RUN apt-get install -y postgresql=9.4+162 libpq-dev
RUN gem install rails -v 4.1.8
RUN apt-get install -y ruby-dev
RUN gem install pg

ENV PORT 3000
EXPOSE 3000

RUN useradd -ms /bin/bash app
ADD support/sudo /etc/sudoers.d/app
RUN chmod 440 /etc/sudoers.d/app

WORKDIR /app
ADD support/web /app/bin/web
RUN chmod +x /app/bin/web
RUN rails new . --database=postgresql

ENV DATABASE_URL postgres://postgres@localhost/app-development?encoding=SQL_ASCII
RUN rm config/database.yml
ADD support/pg_hba.conf /etc/postgresql/9.4/main/pg_hba.conf

RUN chown -R app:app /app
USER app

CMD bin/web
