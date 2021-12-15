# if [ ! "$(ls -A /var/www/wordpress/)" ]; then
if [ ! -e /var/www/wordpress/index.php ]; then
  # set wordpress
  cp -R /wordpress/* /var/www/wordpress/
  rm /var/www/wordpress/wp-config-sample.php
  sed -i "s/WP_DB_NAME/$WP_DB_NAME/g" wp-config.php
  sed -i "s/MYSQL_USER/$MYSQL_USER/g" wp-config.php
  sed -i "s/MYSQL_PASSWORD/$MYSQL_PASSWORD/g" wp-config.php
  cp wp-config.php /var/www/wordpress/wp-config.php
  chown -R www-data:www-data /var/www/wordpress
  cp www.conf /etc/php/7.3/fpm/pool.d/www.conf

  # wordpress cli install
  wp core download --locale=ko_KR --allow-root
  until wp core install --url=$DOMAIN_NAME --title=HelloWP --admin_user=hyunlee --admin_password=password --admin_email=hyunlee@student.42seoul.com --allow-root --skip-email --path='/var/www/wordpress/'; do
  sleep 0.5
  done

  # make wordpress user
  wp user create --allow-root $WP_USER_ID $WP_USER_EMAIL --user_pass=$WP_USER_PW --role=author
fi

# run wordpress foreground
# service sendmail start
php-fpm7.3 --nodaemonize
