## Rails

This project comes with Ruby on Rails and PostgreSQL.

To see which version of Rails is installed, run: `rails -v`

### Ruby versions

This project comes with `rbenv` to help you manage Ruby versions.

To see which versions of Ruby are installed, run: `rbenv versions`

To change the default version, run: `rbenv global <version number>`

### Sample application

A sample Rails scaffold has been created for you in
`/home/nitrous/code/example`, with the database already set up.  It is the
equivalent to running the following:

```
cd ~/code
rails new example -d postgresql
cd example
bundle install
rake db:create db:migrate
```

You can start the server by running `~/code/example/start-app` from the command
line.  Once it is running, you can use the preview menu to view the application
in a new tab.  Opening the `~/code/example/start-app` file is a good way of
finding out how to get your own Rails application running.

Feel free to remove the `~/code/example` directory if you no longer need it.

### Preview

Note that if you are using Rails 4.2.0 and up, you will need to explicitly
listen to 0.0.0.0 when running `rails s` in order to preview your app.  You can
do this by running:

`rails s -b 0.0.0.0`

More information can be found in the [Rails 4.2 release
notes](http://edgeguides.rubyonrails.org/4_2_release_notes.html#default-host-for-rails-server)


## Postgres

A `postgres` superuser has been created with username `nitrous`.
