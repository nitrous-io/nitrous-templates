## Laravel

This container comes with Laravel 4.2 installed.

It also includes the following software:

- PHP 5.5
- Composer 1.0
- MySQL 5.5 
- Redis 2.8

### Sample application

A sample Laravel scaffold has been created for you in `/home/nitrous/code/example`, with the database already set up. It is equivalent to running the following:

```
cd ~/code
composer create-project laravel/laravel example 4.2 --prefer-dist
```

Feel free to remove the `~/code/example` directory if you no longer need it.

### Previewing your app

If you are using the example application, PHP's built-in web server is already set up to listen to port 3000 and serve the contents of `/home/nitrous/code/example/app/views/hello.php`, which is the default welcome page of Laravel. 

You can start the server by running `~/code/example/start-app` from the command line. This is equivalent to running:

```
cd ~/code/example
php artisan serve --port=3000
```

Once the server is running, you can preview your application by going to `Preview > Port 3000` from the IDE menu. 

Opening the `~/code/example/start-app` file is a good way of finding out how to get your own Laravel application running.

### Customizing the server setup

You can customize your server settings by editing the file `/etc/php5/cli/php.ini`.

Remember to restart the server after editing the file so that your changes are applied.

### MySQL

A MySQL user `nitrous` has been created with all privileges. For security reasons, remote access to MySQL is turned off by default.
