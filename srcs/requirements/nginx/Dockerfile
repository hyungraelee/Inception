FROM debian:buster

COPY ./tools/* ./

RUN apt-get -y update && \
    apt-get -y install nginx && \
    rm -rf /var/lib/apt/list/*

RUN mkdir certs; \
    mv inception.crt /certs/inception.crt; \
    mv inception.key /certs/inception.key; \
    cp -rp default etc/nginx/sites-enabled/

EXPOSE 443

ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]
