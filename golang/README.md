## Go

This container comes with Go 1.4.2 installed.

It also includes commonly used Go tools such as:

* [goimports](https://godoc.org/golang.org/x/tools/cmd/goimports)
* [oracle](https://godoc.org/golang.org/x/tools/oracle),
* [gorename](https://godoc.org/golang.org/x/tools/cmd/gorename)
* [godep](https://github.com/tools/godep)

### GOPATH

`GOPATH` is set to `~/code/go`.  If you are adding code to be pushed to
a repository, add it within `~/code/go/src/`.  See the official
documentation on [How to Write Go
Code](https://golang.org/doc/code.html#PackagePaths) for more details.

### Browsing Go documentation

You can browse Go documentation from your container by running:

`godoc -http=0.0.0.0:6060`

Once this is running, simply go to `Preview > Port 6060` in the IDE
menu.  You will then be able to browse the documentation for all the
installed packages on your container.

This is possible because the `6060` port is exposed by default.  To
change these settings, please go to `Preview > Configure Ports` in the
IDE menu.
