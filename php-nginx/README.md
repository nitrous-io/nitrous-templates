## PHP (LEMP)

This container contains the full LEMP stack needed to get you serving web
applications as quickly as possible.

Software already installed:

- PHP 5.5.9 (Composer 1.0, MySQL 5.5)
- Nginx 1.6.2 with php-fpm

### Previewing your app

Nginx is already set up to listen to port 3000 and serve the contents of
`/home/nitrous/code/public_html`. The directory contains an `index.php` file
which shows `phpinfo()`.

You can preview your application by going to `Preview > Port 3000` from the IDE
menu.

### Customizing the server setup

You can customize your server settings by editing `/etc/php5/fpm/php.ini` and `/etc/nginx/sites-available/default`.

Remember to restart Nginx with `sudo service nginx restart` after editing
those files so that your changes are applied.
