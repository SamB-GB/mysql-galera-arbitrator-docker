FROM debian:bullseye

RUN apt-get -y update && \
    apt-get -y install \
        apt-transport-https \
        curl \
        bash

# Add MySQL GPG Key
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 8DA84635

# Add MySQL repository
RUN curl -fsSL https://dev.mysql.com/doc/refman/8.0/en/checking-gpg-signature.html | grep "mysql_pubkey.asc" | \
    xargs -I {} curl -o /etc/apt/trusted.gpg.d/mysql_pubkey.asc https://repo.mysql.com/RPM-GPG-KEY-mysql-2022 && \
    echo 'deb http://repo.mysql.com/apt/debian/ bullseye mysql-8.0' | tee /etc/apt/sources.list.d/mysql.list

# Add Galera and MySQL WSREP repositories
RUN echo 'deb https://releases.galeracluster.com/galera-4.21/debian bookworm main' | tee /etc/apt/sources.list.d/galera.list && \
    echo 'deb https://releases.galeracluster.com/mysql-wsrep-8.0.40-26.21/debian bookworm main' | tee -a /etc/apt/sources.list.d/galera.list

RUN apt-get -y update && \
    apt-get -y install \
        mysql-client
        galera-arbitrator-4

COPY bin/docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/bin/bash", "/docker-entrypoint.sh"]
