# RUN wget https://wordpress.org/latest.tar.gz && \
#     tar -xvf latest.tar.gz && \
#     mv /wordpress/* /var/www/html/ && \
#     rm -r /wordpress latest.tar.gz && \
#     rm /var/www/html/wp-config-sample.php && \
#     cp -y wp-config.php /var/www/html/wp-config.php && \
#     chown -R www-data:www-data /var/www/html && \
#     cp -y www.conf /etc/php/7.3/fpm/pool.d/www.conf

# ENTRYPOINT [ "service" ]

# CMD [ "php7.3-fpm", "start" ]

wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
mv /wordpress/* /var/www/html/
rm -r /wordpress latest.tar.gz
rm /var/www/html/wp-config-sample.php
cp wp-config.php /var/www/html/wp-config.php
chown -R hyunlee:hyunlee /var/www/html
cp www.conf /etc/php/7.3/fpm/pool.d/www.conf

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --locale=ko_KR --allow-root
wp core install --url=example.com --title=HelloWP --admin_user=hyunlee --admin_password=password --admin_email=hyunlee@42.com --allow-root --skip-email --path='/var/www/html/'


wp  user create --allow-root $WP_USER1_ID $WP_USER1_EMAIL --user_pass=$WP_USER1_PW --role=author
wp  user create --allow-root $WP_USER2_ID $WP_USER2_EMAIL --user_pass=$WP_USER2_PW --role=author

service php7.3-fpm start

php-fpm7.3 --nodaemonize

/bin/bash
