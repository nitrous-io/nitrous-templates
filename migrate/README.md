### What's new?

- root access is available; the `sudo` command is now enabled
- significantly improved performance
- the IDE filetree now updates automatically, even if files changed using the terminal
- collaboration no longer requires manually activating 'collab mode'; it
  automatically works with collaborators who have the same file open. [Learn more](http://docs.nitrous.io/v1.0/docs/collaboration)
- an all-new [Desktop Sync](http://docs.nitrous.io/v1.0/docs/nitrous-sync) for working with a local editor

### What will no longer work?

- the previous Nitrous Desktop for Lite
- the previous Chrome application
- the SSH url for accessing the box has been updated

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
