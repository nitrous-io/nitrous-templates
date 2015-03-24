## Docker

This container comes with Docker 1.4.1

Docker is automatically started for you and you can administer your Docker environment using
the [docker](https://docs.docker.com/reference/commandline/cli/) command line utility.

The default user `nitrous` has been added to the `docker` group giving it access to the Docker
[socket](https://docs.docker.com/articles/basics/#bind-docker-to-another-hostport-or-a-unix-socket),
meaning you can omit the `sudo` command when calling `docker`.
