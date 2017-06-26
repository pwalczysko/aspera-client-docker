#!/bin/bash

set -e
set -u

STUDY=$1
SOURCE=$2
TARGET=$3

/home/data/.aspera/connect/bin/ascp \
    -P$ASCP_PORT \
    -l "$ASCP_LIMIT" \
    -i "$ASCP_KEY" \
    $STUDY@$ASCP_SERVER:$SOURCE $TARGET
