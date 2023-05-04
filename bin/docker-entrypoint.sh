#!/bin/bash

set -e

/usr/bin/garbd \
    --address "gcomm://${MARIADB_ADDRESSES}" \
    --group "${MARIADB_GALERA_CLUSTER_NAME}" \
    --options "pc.bootstrap=FALSE;${PROVIDER_OPTIONS}"
