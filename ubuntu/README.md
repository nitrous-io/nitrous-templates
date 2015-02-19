## Container administration

This Ubuntu 14.04 container is a fully functional Linux environment in which
you can develop any Linux-based application.

The `nitrous` user has been set up with password-less root access on the `sudo` command.

### Default install

The container comes with a wealth of software and developer tools already
installed:

- editors: emacs, nano, vim
- version control: git, mercurial, subversion, bzr
- languages: c, c++, perl, python
- shells: bash, dash, zsh (default)

### Upgrading your container

To update software already installed on your container, just run the following
commands:

```
sudo apt-get update
sudo apt-get dist-upgrade
```

### Installing more software

Since this container is Ubuntu-based, you have full access to thousands of
Ubuntu and Debian packages.  You can browse them at:

http://packages.ubuntu.com/trusty/

Alternately, you can search for a package by running the following in the
command-line:

`apt-cache search <search term>`

Once you have identified the package(s) you'd like, install as follows:

`sudo apt-get install <one or more package names>`
