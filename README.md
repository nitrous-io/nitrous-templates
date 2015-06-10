# Nitrous Templates

## Updating an image

At time of writing quay.io does not support dependent builds, so images are to
be built locally.  The steps to build template `tname` are as follows:

1. For each ancestor `FROM` image, `docker pull quay.io/nitrous/<ancestorname>`
1. Get the latest `tname` as well: `docker pull quay.io/nitrous/<tname>`
1. Run `make <tname>`
1. If applicable (`/home/nitrous/code/example/start-app` is runnable), test the
   build with `script/test-starter <tname>`
1. Run `./script/dpush <tname>`
1. Create a container with the given template on production and test

## Conventions

This section does not apply to the migrate template (see [Migration](#migration) section).

### Origin

Nitrous images ultimately inherit from `nitrousio/ubuntu-bare`, which inherits
from the official
[ubuntu-upstart:trusty](https://registry.hub.docker.com/u/library/ubuntu-upstart/)
image.

### Environment variables

The list of special envvars Nitrous Pro recognizes.  Use these to advertise
support for Nitrous features.

Under the default environment variable settings,

- there is a `nitrous` user with passwordless `sudo` and `ssh` access
- the home directory for the `nitrous` user is `/home/nitrous`
- the parent directory for starter templates is `/home/nitrous/code`
- when `NITROUS_CMD` (see below) is a script, it is typically stored at `/usr/local/bin/start-app`

#### NITROUS\_USERNAME

Defaults to: `nitrous`.

The default user with Nitrous Pro features enabled.

- has passwordless `sudo` and `ssh` access
- is the user for the IDE and terminal
- the `NITROUS_CMD` process runs as this user

Note that simply modifying this in an inheriting Dockerfile would be
insufficient: the `nitrousio/ubuntu-bare` does a lot of things to set up.  To
change the user would entail forking `nitrousio/ubuntu-bare` and inheriting
from that fork.

## Migration 

### Origin 

The migrated container on `Pro` that was migrated from user's boxes on `Lite` is built on the `migrate` template. The `migrate` template inherits from `quay.io/nitrous/migrate-bare`. 

More detailed documentation on the `migrate` and `migrate-bare` templates can be found [here](https://github.com/nitrous-io/migration).

### Features

For a summary of the features on the migrated container, please see the [README](https://github.com/nitrous-io/nitrous-templates/blob/latest/migrate/README.md) for the migrated container.

- - -
Copyright (c) 2014-2015 Nitrous, Inc. All Rights Reserved.
