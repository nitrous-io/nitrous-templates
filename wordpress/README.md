## WordPress

This container comes with WordPress 4.1 pre-installed.

It also includes the following software:

- LAMP stack
  - Apache 2.4.7 with mod-php set up
  - MySQL 5.5
  - PHP 5.5.9 (Composer 1.0)

### Famous 5-minute install

Note that WordPress is not fully installed yet. You still have to go through the "Famous 5-Minute Install" to complete installation. Refer to this [guide](https://codex.wordpress.org/Installing_WordPress#Famous_5-Minute_Install) for more detailed instructions.

### Previewing your app

Apache is already set up to listen to port 3000 and serve the contents of `/home/nitrous/code/public_html`. The directory contains an `index.php` file which loads the WordPress environment and template.

You can preview your application by going to `Preview > Port 3000` from the IDE menu.

### Customizing the server setup

You can customize mod-php settings by editing `/etc/php5/apache2/php.ini`. Server settings can be changed by editing `/etc/apache2/sites-available/000-default.conf`.

Remember to restart Apache with `sudo service apache2 restart` after editing those files so that your changes are applied.
