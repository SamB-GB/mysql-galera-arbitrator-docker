mariadb-galera-artibtrator-docker
===
[![build](https://github.com/wowvendor/mariadb-galera-arbitrator-docker/actions/workflows/build.yml/badge.svg)](https://github.com/wowvendor/mariadb-galera-arbitrator-docker/actions/workflows/build.yml)

## Variables
| Variable name               | Description                          | Example          |
|-----------------------------|--------------------------------------|------------------|
| MARIADB_GALERA_CLUSTER_NAME | Group name of MariaDB cluster        | wowvendor_galera |
| MARIADB_ROOT_PASSWORD       | MariaDB root password                | notsosecret      |
| MARIADB_ADDRESSES           | Server addresses separated by commas | db1,db2          |

## Run
```bash
docker run --name arbitrator \
  -e MARIADB_GALERA_CLUSTER_NAME=wowvendor_galera \
  -e MARIADB_ROOT_PASSWORD=notsosecret \
  -e MARIADB_ADDRESSES=db1,db2 \
  ghcr.io/wowvendor/mariadb-galera-arbitrator
```