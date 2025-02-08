FROM debian:bullseye

RUN apt-get -y update && \
    apt-get -y install \
        apt-transport-https \
        curl \
        bash

RUN curl -fsSL https://dev.mysql.com/doc/refman/8.0/en/checking-gpg-signature.html | grep "mysql_pubkey.asc" | \
    xargs -I {} curl -o /etc/apt/trusted.gpg.d/mysql_pubkey.asc https://repo.mysql.com/RPM-GPG-KEY-mysql-2022 && \
    echo 'deb http://repo.mysql.com/apt/debian/ bullseye mysql-8.0' | tee /etc/apt/sources.list.d/mysql.list

RUN apt-get -y update && \
    apt-get -y install \
        mysql-client
        galera-arbitrator-4

COPY bin/docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/bin/bash", "/docker-entrypoint.sh"]
