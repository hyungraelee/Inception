FROM debian:buster

COPY ./tools/* ./

RUN apt-get -y update && \
    apt-get -y install mariadb-server

RUN cp 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

ENTRYPOINT [ "./mariadb.sh" ]
