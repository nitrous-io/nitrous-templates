## PHP (LAMP)

This project contains the full LAMP stack needed to get you serving web
applications as quickly as possible.

Software already installed:

- PHP 5.5.9 (Composer 1.0, MySQL 5.5)
- Apache 2.4.7 with mod-php set up

### Previewing your app

Apache is already set up to listen to port 3000 and serve the contents of
`/home/nitrous/code/public_html`. The directory contains an `index.php` file
which shows `phpinfo()`.

You can preview your application by going to `Preview > Port 3000` from the IDE
menu.

### Customizing the server setup

You can customize mod-php settings by editing `/etc/php5/apache2/php.ini`.
Server settings can be changed by editing
`/etc/apache2/sites-available/000-default.conf`.

Remember to restart Apache with `sudo service apache2 restart` after editing
those files so that your changes are applied.
