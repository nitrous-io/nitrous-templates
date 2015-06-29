all: build-all

build-all: build-base build-basic build-stacks build-advanced build-migrate
.PHONY: build-all

build-migrate: migrate

build-base: ubuntu-bare ubuntu
.PHONY: build-base

build-basic: nodejs iojs golang php python ruby rust nginx
.PHONY: build-basic

build-stacks: django php-apache php-nginx laravel meteor rails gcloud wordpress discourse
.PHONY: build-stacks

build-advanced: docker
.PHONY: build-advanced

push-all: push-migrate push-base push-basic push-stacks push-advanced
.PHONY: push-all

push-base:
	@./script/dpush ubuntu-bare
	@./script/dpush ubuntu
.PHONY: push-base

push-migrate:
	@./script/dpush migrate
.PHONY: push-migrate

push-basic:
	@./script/dpush nodejs
	@./script/dpush iojs
	@./script/dpush golang
	@./script/dpush php
	@./script/dpush python
	@./script/dpush ruby
	@./script/dpush rust
	@./script/dpush nginx
.PHONY: push-basic

push-stacks:
	@./script/dpush django
	@./script/dpush php-apache
	@./script/dpush php-nginx
	@./script/dpush laravel
	@./script/dpush meteor
	@./script/dpush rails
	@./script/dpush gcloud
	@./script/dpush wordpress
	@./script/dpush discourse
.PHONY: push-stacks

push-advanced: docker
.PHONY: push-advanced

test: test-django test-laravel test-meteor test-rails
.PHONY: test

### Build migration image

migrate:
	@./script/dbuild migrate
.PHONY: migrate

### Build base images

ubuntu-bare:
	@./script/dbuild ubuntu-bare
.PHONY: ubuntu-bare

ubuntu:
	@./script/dbuild ubuntu
.PHONY: ubuntu

### Build language images

nodejs:
	@./script/dbuild nodejs
.PHONY: nodejs

iojs:
	@./script/dbuild iojs
.PHONY: iojs

golang:
	@./script/dbuild golang
.PHONY: golang

java:
	@./script/dbuild java
.PHONY: java

php:
	@./script/dbuild php
.PHONY: php

php-apache:
	@./script/dbuild php-apache
.PHONY: php-apache

php-nginx:
	@./script/dbuild php-nginx
.PHONY: php-nginx

python:
	@./script/dbuild python
.PHONY: python

ruby:
	@./script/dbuild ruby
.PHONY: ruby

rust:
	@./script/dbuild rust
.PHONY: rust

nginx:
	@./script/dbuild nginx
.PHONY: nginx

docker:
	@./script/dbuild docker
.PHONY: docker

### Build starter template images

django:
	@./script/dbuild django
.PHONY: django

laravel:
	@./script/dbuild laravel
.PHONY: laravel

meteor:
	@./script/dbuild meteor
.PHONY: meteor

rails:
	@./script/dbuild rails
.PHONY: rails

gcloud:
	@./script/dbuild gcloud
.PHONY: gcloud

wordpress:
	@./script/dbuild wordpress
.PHONY: wordpress

discourse:
	@./script/dbuild discourse
.PHONY: discourse

### Test starter templates

test-django:
	@./script/test-template django
.PHONY: test-django

test-laravel:
	@./script/test-template laravel
.PHONY: test-laravel

test-meteor:
	@./script/test-template meteor
.PHONY: test-meteor

test-rails:
	@./script/test-template rails
.PHONY: test-rails

### Publish READMEs to S3

publish-migrate:
	@./script/publish-s3 migrate Migrate migrate/README.md
.PHONY: publish-migrate

publish-ubuntu:
	@./script/publish-s3 ubuntu Ubuntu ubuntu/README.md
.PHONY: publish-ubuntu

publish-golang:
	@./script/publish-s3 golang Go golang/README.md ubuntu/README.md
.PHONY: publish-golang

publish-nodejs:
	@./script/publish-s3 nodejs Node.js nodejs/README.md ubuntu/README.md
.PHONY: publish-nodejs

publish-iojs:
	@./script/publish-s3 iojs io.js iojs/README.md ubuntu/README.md
.PHONY: publish-iojs

publish-php-apache:
	@./script/publish-s3 php-apache PHP php-apache/README.md php/README.md ubuntu/README.md
.PHONY: publish-php-apache

publish-php-nginx:
	@./script/publish-s3 php-nginx PHP php-nginx/README.md php/README.md ubuntu/README.md
.PHONY: publish-php-nginx

publish-wordpress:
	@./script/publish-s3 wordpress WordPress wordpress/README.md php/README.md ubuntu/README.md
.PHONY: publish-wordpress

publish-ruby:
	@./script/publish-s3 ruby Ruby ruby/README.md ubuntu/README.md
.PHONY: publish-ruby

publish-rust:
	@./script/publish-s3 rust Rust rust/README.md ubuntu/README.md
.PHONY: publish-rust

publish-meteor:
	@./script/publish-s3 meteor Meteor meteor/README.md nodejs/README.md ubuntu/README.md
.PHONY: publish-meteor

publish-rails:
	@./script/publish-s3 rails Rails rails/README.md ruby/README.md ubuntu/README.md
.PHONY: publish-rails

publish-discourse:
	@./script/publish-s3 discourse Discourse discourse/README.md ubuntu/README.md
.PHONY: publish-discourse

publish-django:
	# TODO add python/README.md when available
	@./script/publish-s3 django Django django/README.md ubuntu/README.md
.PHONY: publish-django

publish-docker:
	@./script/publish-s3 docker Docker docker/README.md ubuntu/README.md
.PHONY: publish-docker

publish-laravel:
	@./script/publish-s3 laravel Laravel laravel/README.md php/README.md ubuntu/README.md
.PHONY: publish-laravel

publish-gcloud:
	@./script/publish-s3 gcloud Google-Cloud-SDK gcloud/README.md ubuntu/README.md
.PHONY: publish-gcloud
