### Database

This container comes with postgres 9.3 pre-installed, with a database named `development` pre-created. The username is set to your nitrous username.

### VirtualEnv

Virtualenv comes installed on this container. [Virtualenv](http://virtualenv.org/) allows you to create separate Python environments in your Nitrous container. This allows you to run applications with different sets of requirements concurrently (e.g. you could run an application with Django 1.5 and another with 1.6).

### Running the Server

This Django template uses [Gunicorn](http://gunicorn.org/), a Python WSGI HTTP Server. To run the application, type the following, substituting your nitrous user name and project name:

```
cd /home/$NITROUS_USERNAME/code/$PROJECT_NAME
source bin/activate
gunicorn $PROJECT_NAME.wsgi —bind 0.0.0.0:3000
```

Or, you can change directories to your project and copy and paste the following:

```
source bin/activate
gunicorn ${appdir}.wsgi --bind 0.0.0.0:$NITROUS_PREVIEW_PORT
```

The application will run on port 3000. Note that you will need to set the host to `0.0.0.0`.