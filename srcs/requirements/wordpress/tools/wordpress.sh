#!/bin/bash

if [ ! -e /var/www/html/index.php ]; then
  # set wordpress
  cp -R /wordpress/* /var/www/html/
  rm /var/www/html/wp-config-sample.php
  cp wp-config.php /var/www/html/wp-config.php
  chown -R www-data:www-data /var/www/html

  # wordpress cli install
  wp core download --locale=ko_KR --allow-root
  until wp core install --url=$DOMAIN_NAME --title=HelloWP --admin_user=hyunlee --admin_password=password --admin_email=hyunlee@student.42seoul.com --allow-root --skip-email --path='/var/www/html/'; do
  sleep 0.5
  done

  # make wordpress user
  wp user create --allow-root $WP_USER_ID $WP_USER_EMAIL --user_pass=$WP_USER_PW --role=author
fi

# run wordpress foreground
php-fpm7.3 --nodaemonize
