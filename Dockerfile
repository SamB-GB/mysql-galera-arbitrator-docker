FROM debian:bullseye

RUN apt-get -y update && \
    apt-get -y install \
        apt-transport-https \
        curl \
        bash

RUN curl -o /etc/apt/trusted.gpg.d/mariadb_release_signing_key.asc 'https://mariadb.org/mariadb_release_signing_key.asc' && \
    sh -c "echo 'deb https://mirror.creoline.net/mariadb/repo/10.11/debian bullseye main' >> /etc/apt/sources.list"

RUN apt-get -y update && \
    apt-get -y install \
        mariadb-client \
        galera-arbitrator-4

COPY bin/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]