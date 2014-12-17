# Nitrous conventions

## Terminology

There are broadly three levels in the Nitrous Dockerfiles hierarchy:

- distro: `ubuntu`, `ubuntu-bare`
- language: `golang`, `ruby`, etc
- starter: `starter-rails`, `starter-laravel`, etc

Starter Dockerfiles contain the full setup for a given web framework -- apps
are generated with database access and web preview is immediately available.

## Origin

Nitrous images ultimately inherit from `nitrousio/ubuntu-bare`, which inherits
from the official
[ubuntu-upstart:trusty](https://registry.hub.docker.com/u/library/ubuntu-upstart/)
image.

## Environment variables

The list of special envvars Nitrous Pro recognizes.  Use these to advertise
support for Nitrous features.

Under the default environment variable settings,

- there is a `nitrous` user with passwordless `sudo` and `ssh` access
- the home directory for the `nitrous` user is `/home/nitrous`
- the parent directory for starter templates is `/home/nitrous/code`
- when `NITROUS_CMD` (see below) is a script, it is typically stored at `/usr/local/bin/start-app`

### NITROUS_APP_NAME

Defaults to: `starter`

The name of the application that is passed to scaffolds/generators, e.g. `rails new $NITROUS_APP_NAME`.

### NITROUS_APP_PATH

Defaults to: `/home/$NITROUS_USERNAME/code/$NITROUS_APP_NAME`

The project root for a generated application.

### NITROUS_CMD

Defaults to: `/usr/local/bin/start-app`

The command that Nitrous runs on app start/restart.  It runs as the user given
by `NITROUS_USERNAME`, and is executed with the equivalent of `docker exec -dt
<container id> su --preserve-environment -l $NITROUS_USERNAME -c $NITROUS_CMD`.

The typical use of this is to start a web server; which will be expected to
listen on `NITROUS_PREVIEW_PORT`.

### NITROUS_PREVIEW_PORT

Defaults to: `3000`.

The port that the application run by `NITROUS_CMD` listens on _in the
container_.  The preview button in the Nitrous Pro web and desktop apps will
link appropriately if this is set.

### NITROUS_USERNAME

Defaults to: `nitrous`.

The default user with Nitrous Pro features enabled.

- has passwordless `sudo` and `ssh` access
- is the user for the IDE and terminal
- the `NITROUS_CMD` process runs as this user

Note that simply modifying this in an inheriting Dockerfile would be
insufficient: the `nitrousio/ubuntu-bare` does a lot of things to set up.  To
change the user would entail forking `nitrousio/ubuntu-bare` and inheriting
from that fork.
