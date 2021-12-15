FROM debian:buster

COPY ./tools/* ./

RUN apt-get -y update && \
    apt-get -y install php7.3 \
    php-fpm \
    php-cli \
    wget \
    curl \
    php-mysql \
    php-mbstring \
    php-xml \
    sendmail

RUN service php7.3-fpm start

RUN mkdir -p ./var/www/wordpress && \
    wget https://wordpress.org/latest.tar.gz && \
    tar -xvf latest.tar.gz

ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar ./

RUN chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

ENTRYPOINT [ "/bin/bash" ]

CMD [ "wordpress.sh" ]
