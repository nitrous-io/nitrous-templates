all: build-all

build-all: build-base build-basic build-stacks build-advanced
.PHONY: build-all

build-base: ubuntu-bare ubuntu
.PHONY: build-base

build-basic: nodejs iojs golang php python ruby nginx
.PHONY: build-basic

build-stacks: aspnet django php-apache php-nginx laravel mean meteor rails gcloud wordpress
.PHONY: build-stacks

build-advanced: docker
.PHONY: build-advanced

push-all: push-base push-basic push-stacks push-advanced
.PHONY: push-all

push-base:
	@./script/dpush ubuntu-bare
	@./script/dpush ubuntu
.PHONY: push-base

push-basic:
	@./script/dpush nodejs
	@./script/dpush iojs
	@./script/dpush golang
	@./script/dpush php
	@./script/dpush python
	@./script/dpush ruby
	@./script/dpush nginx
.PHONY: push-basic

push-stacks:
	@./script/dpush aspnet
	@./script/dpush django
	@./script/dpush php-apache
	@./script/dpush php-nginx
	@./script/dpush laravel
	@./script/dpush mean
	@./script/dpush meteor
	@./script/dpush rails
	@./script/dpush gcloud
	@./script/dpush wordpress
.PHONY: push-stacks

push-advanced:
	@./script/dpush docker
.PHONY: push-advanced

### Generate README pages

page-all: page-base page-basic page-stacks page-advanced
.PHONY: page-all

page-base:
	@./script/dpage ubuntu-bare
	@./script/dpage ubuntu
.PHONY: page-base

page-basic:
	@./script/dpage nodejs
	@./script/dpage iojs
	@./script/dpage golang
	@./script/dpage php
	@./script/dpage python
	@./script/dpage ruby
	@./script/dpage nginx
.PHONY: page-basic

page-stacks:
	@./script/dpage aspnet
	@./script/dpage django
	@./script/dpage php-apache
	@./script/dpage php-nginx
	@./script/dpage laravel
	@./script/dpage mean
	@./script/dpage meteor
	@./script/dpage rails
	@./script/dpage gcloud
	@./script/dpage wordpress
.PHONY: page-stacks

page-advanced:
	@./script/dpage docker
.PHONY: page-advanced

# mean takes the longest -- test it last
test: test-aspnet test-django test-laravel test-meteor test-rails test-mean
.PHONY: test

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

nginx:
	@./script/dbuild nginx
.PHONY: nginx

docker:
	@./script/dbuild docker
.PHONY: docker

### Build starter template images

aspnet:
	@./script/dbuild aspnet
.PHONY: aspnet

django:
	@./script/dbuild django
.PHONY: django

laravel:
	@./script/dbuild laravel
.PHONY: laravel

mean:
	@./script/dbuild mean
.PHONY: mean

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

### Test starter templates

test-aspnet:
	@./script/test-starter aspnet
.PHONY: test-aspnet

test-django:
	@./script/test-starter django
.PHONY: test-django

test-laravel:
	@./script/test-starter laravel
.PHONY: test-laravel

test-mean:
	@./script/test-starter mean
.PHONY: test-mean

test-meteor:
	@./script/test-starter meteor
.PHONY: test-meteor

test-rails:
	@./script/test-starter rails
.PHONY: test-rails
