mariadb-galera-artibtrator-docker
===
[![build](https://github.com/wowvendor/mariadb-galera-arbitrator-docker/actions/workflows/build.yml/badge.svg)](https://github.com/wowvendor/mariadb-galera-arbitrator-docker/actions/workflows/build.yml)

## Variables
| Variable name               | Description                          | Example          |
|-----------------------------|--------------------------------------|------------------|
| GALERA_CLUSTER_NAME         | Group name of Galera cluster         | wowvendor_galera |
| MYSQL_ROOT_PASSWORD         | MariaDB root password                | notsosecret      |
| MYSQL_ADDRESSES             | Server addresses separated by commas | db1,db2          |

## Run
```bash
docker run --name arbitrator \
  -e GALERA_CLUSTER_NAME=wowvendor_galera \
  -e MYSQL_ROOT_PASSWORD=notsosecret \
  -e MYSQL_ADDRESSES=db1,db2 \
  ghcr.io/wowvendor/mariadb-galera-arbitrator
```
