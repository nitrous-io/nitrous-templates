## Django

This container comes with Django 1.7.4

### Sample application

A sample Django scaffold has been created for you in
`/home/nitrous/code/example`, with the database already set up.  It is the
equivalent to running the following:

```
cd ~/code
mkdir example
cd example
django-admin startproject example .
# configure example/settings.py to point database to example_development
python manage.py syncdb --noinput
# create User.objects.create_superuser with python manage.py shell
```

You can start the server by running `~/code/example/start-app` from the command
line.  Once it is running, you can use the preview menu to view the application
in a new tab.  Opening the `~/code/example/start-app` file is a good way of
finding out how to get your own Django application running.

Feel free to remove the `~/code/example` directory if you no longer need it.

### Preview

*If you are using the example application, you can use `~/code/example/start-app` to start your app.*

Note that you will need to listen to 0.0.0.0 when running the Django (gunicorn) server in order
to preview your app.  You can do this by running:

`gunicorn appname.wsgi --bind 0.0.0.0:3000`

The above command assumes you are previewing your app on port 3000, which is
the default preview port set up for this container, and that your app is called `appname`.


## Postgres

A `postgres` superuser has been created with username `nitrous`, it has access to the
database `example_development`.