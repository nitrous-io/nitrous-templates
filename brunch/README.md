## Brunch

This project comes with [Brunch](http://brunch.io/) installed.

An empty Brunch project created from the [ES6 skeleton](https://github.com/brunch/with-es6)
has been created at `/home/nitrous/code/example`.

You can create a new Brunch site elsewhere using `brunch new yoursite`.

For more information on how to use Brunch, check out the detailed [Brunch Guide](https://github.com/brunch/brunch-guide#readme).

### Preview

While developing your Brunch project, you can [Preview](https://community.nitrous.io/docs/preview-your-app)
your changes using `brunch watch --server`. However, you'll need to bind to
`0.0.0.0` so that the Brunch server is accessible over the Internet by adding
this to your project's `brunch-config.js`:

```
server: { hostname: '0.0.0.0' }
```

### Publishing your site

Brunch can generate a static version of your site and all its assets using:

```
brunch build --production
```

An easy way to publish your site is to use [PubStorm](http://www.pubstorm.com/),
which will upload your Brunch site to the cloud and make it accessible over the
Web.

To get started, visit the [PubStorm Docs](http://help.pubstorm.com/).
