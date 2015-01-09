all: build-all

build-all: build-base build-langs build-starters build-misc
.PHONY: build-all

build-base: ubuntu-bare ubuntu
.PHONY: build-base

build-langs: nodejs golang php python ruby
.PHONY: build-langs

build-starters: aspnet django laravel mean meteor rails
.PHONY: build-starters

build-misc: docker
.PHONY: build-misc

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

golang:
	@./script/dbuild golang
.PHONY: golang

php:
	@./script/dbuild php
.PHONY: php

python:
	@./script/dbuild python
.PHONY: python

ruby:
	@./script/dbuild ruby
.PHONY: ruby

docker:
	@./script/dbuild docker
.PHONY: docker

### Build starter template images

aspnet:
	@./script/dbuild starter-aspnet

django:
	@./script/dbuild starter-django
.PHONY: django

laravel:
	@./script/dbuild starter-laravel
.PHONY: laravel

mean:
	@./script/dbuild starter-mean
.PHONY: mean

meteor:
	@./script/dbuild starter-meteor
.PHONY: meteor

rails:
	@./script/dbuild starter-rails
.PHONY: rails

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
