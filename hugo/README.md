## Hugo

This project comes with [Hugo](https://gohugo.io/) and an example Hugo site at
`/home/nitrous/code/example`. The [Crisp theme](https://github.com/Zenithar/hugo-theme-crisp)
has been pre-installed.

You can also create a new Hugo site elsewhere using [`hugo new site yoursite`](https://gohugo.io/overview/quickstart/).

For more information on how to use Hugo, check out the [Hugo Quickstart Guide](https://gohugo.io/overview/quickstart/).

### Preview

While developing your Hugo project, you can [Preview](https://community.nitrous.io/docs/preview-your-app)
your changes using `hugo server`. However, you'll need to bind to
`0.0.0.0` so that the Hugo server is accessible over the Internet, by
running this:

```
hugo server --bind 0.0.0.0 --theme hugo-theme-crisp
```

### Publishing your site

Hugo can generate the static HTML and assets for your site:

```
hugo --theme hugo-theme-crisp
```

All non-draft posts will be generated into the `public/` directory.

An easy way to publish your site is to use [PubStorm](http://www.pubstorm.com/),
which will upload your static Hugo site to the cloud and make it accessible over
the Web.

To get started, visit the [PubStorm Docs](http://help.pubstorm.com/).
