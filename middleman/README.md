## Middleman

This project comes with [Middleman](https://middlemanapp.com/) and Ruby
pre-installed.

An empty Middleman project has been created in /home/nitrous/code/example and is
ready to use. You can also create a new project elsewhere using
[`bundle exec middleman init`](https://middlemanapp.com/basics/start_new_site/).

### Preview

While developing your Middleman project, you can [Preview](https://community.nitrous.io/docs/preview-your-app)
your changes using `middleman server`. However, you'll need to bind to
`0.0.0.0` so that the Middleman server is accessible over the Internet, by
running this:

```
bundle exec middleman server --bind-address 0.0.0.0
```
