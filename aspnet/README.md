## ASP.NET MVC 5

This container comes with ASP.NET MVC 5 (beta 2) and K Runtime (beta 2).

## Note about ASP.NET MVC 5 beta

ASP.NET 5 is currently [iterating rapidly](https://www.youtube.com/playlist?list=PL0M0zPgJ3HSftTAAHttA3JQU4vOjXFquF),
so consider this an experimental container whose setup is very much in beta. We will also update
[nitrous-io/aspnet5-mvc-sample](https://github.com/nitrous-io/aspnet5-mvc-sample) to be inline
with the stable version of ASP.NET MVC 5.

The ASP.NET version manager `kvm` provides `kvm upgrade` as a way for
you to upgrade your version of ASP.NET. For more information about KVM/KRE see
[aspnet/Home - Version Manager](https://github.com/aspnet/Home/wiki/version-manager).

### Sample application

A sample MVC 5 scaffold application has been created for you in
`/home/nitrous/code/example`, due to the limitations of the beta it
currently makes use of an in-memory database with EntityFramework. **If the web
server is restarted you will lose your data.** In the future this sample application
will be upgraded to make use of SQLite + EntityFramework, once the SQLite provider is
[ready](https://github.com/aspnet/EntityFramework/issues/1144).

You can start the server by running `~/code/example/start-app` from the command
line. Currently the ASP.NET team does not provide a mechanism for reloading during
code changes, we provide this functionality via [Gulp.js](http://gulpjs.com) and will restart your web
development server when any `.cs` (C#) file changes.

Feel free to remove the `~/code/example` directory if you no longer need it.

### Preview

Note that you will need to listen to 0.0.0.0:3000 when running the Kestrel web server. You can
do this by running

`k kestrel --server.urls http://0.0.0.0:3000`
