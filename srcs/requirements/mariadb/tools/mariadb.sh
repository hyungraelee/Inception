#!/bin/bash

#       RUN service mysql start && \
#     mysql -e "CREATE DATABASE wordpress_db; \
#     CREATE USER 'hyunlee'@'%' IDENTIFIED BY 'password'; \
#     CREATE USER 'user1'@'%' IDENTIFIED BY 'password'; \
#     GRANT ALL ON wordpress_db.* TO 'hyunlee'@'%'; \
#     FLUSH PRIVILEGES;"

service mysql start
mysql -e "CREATE DATABASE ${DATABASE_NAME}; \
CREATE USER '${ADMIN_NAME}'@'%' IDENTIFIED BY '${ADMIN_PASSWORD}'; \
GRANT ALL ON ${DATABASE_NAME}.* TO '${ADMIN_NAME}'@'%'; \
FLUSH PRIVILEGES;"

# mysqld
/bin/bash
