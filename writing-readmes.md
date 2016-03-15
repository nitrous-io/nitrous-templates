## Writing and publishing READMEs

### Overview

The IDE checks for the `NITROUS_README_URL` environment variable on the
container, and if present opens up a tab displaying the page found at that URL.

READMEs are published on S3 for ease of uploading and editing.

Because our Docker templates inherit, we also combine READMEs from various
templates where applicable.

For example:

mean is `FROM nodejs`, nodejs is `FROM ubuntu`, so the `mean` template README
should be the combination of `mean/README.md`, `nodejs/README.md`, and
`ubuntu/README.md` since all of them apply.  These README files should be
written with reuse in mind.

### Warning on Dockerfile FROM

Note that because the `NITROUS_README_URL` env will be inherited via `FROM`, some templates may end up having an unintended README.

For example, since `golang` inherits from `nodejs`, having a `NITROUS_README_URL` declared in `nodejs` but not `golang` will have the wrong README on the `golang` template.

### To add a README

- Write a README.md file in the template directory, e.g. `php-apache/README.md`

- Add a `publish-<template>` rule to Makefile, e.g.

```
publish-rails:
	@./script/publish-s3 rails Rails rails/README.md ruby/README.md ubuntu/README.md
.PHONY: publish-rails

```

- Publish the file to S3

- Add `ENV NITROUS_README_URL <location>` to template Dockerfile, e.g.

```
ENV NITROUS_README_URL https://nitrous-readmes.s3.amazonaws.com/rails.html
```

- Affected templates will have to be rebuilt and pushed to quay

### Style guide

- note that multiple READMEs are concatted together -- do not repeat information.

- use `h2` "##" for top-level headings, `h1` is reserved for the page title inserted prior to any markdown-converted html

- use phrasing like 'this project comes with' to refer to what's provided on the container

- do not refer to the template itself if it is concatted (e.g. "this Ruby project" in the Ruby README would be problematic since it's reused in the Rails README)

- use "you" to refer to readers

- if the template comes with a sample app, include instructions about how to get it running
