FROM mysql:8.0

RUN groupadd expense && useradd -g expense expense

RUN chown -R mysql:mysql /var/lib/mysql /var/run/mysqld /docker-entrypoint-initdb.d

ADD scripts/*.sql /docker-entrypoint-initdb.d/