#!/bin/bash

set -e

/usr/bin/garbd \
    --address "gcomm://${MYSQL_ADDRESSES}" \
    --group "${GALERA_CLUSTER_NAME}" \
    --options "pc.bootstrap=FALSE;${PROVIDER_OPTIONS}"
