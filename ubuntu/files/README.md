Welcome to Nitrous Pro: create powerful web applications in record time.

## Getting Started

This Ubuntu 14.04 container is a fully functional Linux environment in which
you can develop any Linux-based application.

The `nitrous` user has been set up with password-less root access on the `sudo` command.

## Default install

The base Nitrous Ubuntu image has a wealth of software and tools already installed:

- editors: emacs, nano, vim
- version control: git, mercurial, subversion
- languages: c, c++, perl, python
- shells: bash, dash, zsh (default)

## Upgrading your container

To update software already installed on your container, run the following
commands:

```
sudo apt-get update
sudo apt-get dist-upgrade
```

## Installing more software

Since the container is Ubuntu-based, you have full access to the thousands of
Ubuntu and Debian packages.  You can browse them at

http://packages.ubuntu.com/trusty/

Alternately, you can search for a package by running the following in the
command-line:

`apt-cache search <search term>`

Once you have identified the package(s) you'd like, install as follows:

`sudo apt-get install <one or more package names>`

## Previewing web applications

The "Preview" menu in the IDE lists the open ports on this container.  Exposed ports can be added/removed from the "Ports" tab on the container dashboard view.

For more information on previews, have a look at

http://docs.nitrous.io/v1.0/docs/preview
