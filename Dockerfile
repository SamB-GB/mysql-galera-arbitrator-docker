FROM debian:bookworm

# Install necessary dependencies
RUN apt-get -y update && \
    apt-get -y install \
        apt-transport-https \
        wget \
        curl \
        gnupg \
        curl \
        bash

# Add MySQL GPG Key (correct method for Debian 11+)
RUN curl -fsSL https://repo.mysql.com/RPM-GPG-KEY-mysql-2023 | tee /etc/apt/trusted.gpg.d/mysql.asc

# Add MySQL repository
RUN echo 'deb http://repo.mysql.com/apt/debian/ bookworm mysql-8.0' | tee /etc/apt/sources.list.d/mysql.list

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 8DA84635

# Add Galera and MySQL WSREP repositories
RUN echo 'deb https://releases.galeracluster.com/galera-4.21/debian bookworm main' | tee /etc/apt/sources.list.d/galera.list && \
    echo 'deb https://releases.galeracluster.com/mysql-wsrep-8.0.40-26.21/debian bookworm main' | tee -a /etc/apt/sources.list.d/galera.list

# Update package list and install MySQL client + Galera Arbitrator
RUN apt-get -y update && \
    apt-get -y install \
        mysql-client \
        galera-arbitrator-4

# Copy and set entrypoint script
COPY bin/docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/bin/bash", "/docker-entrypoint.sh"]
