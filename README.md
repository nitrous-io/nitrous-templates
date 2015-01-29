# Nitrous Templates

## Conventions

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

- - -
Copyright (c) 2014-2015 Nitrous, Inc. All Rights Reserved.
