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

EXPOSE 9000

ENTRYPOINT [ "/bin/bash" ]

CMD [ "wordpress.sh" ]
