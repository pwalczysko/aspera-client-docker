#!/bin/bash

set -e
set -u

STUDY=$1; shift
SOURCE=$1; shift
TARGET=$1; shift

echo /home/data/.aspera/connect/bin/ascp \
    -P$ASCP_PORT \
    -l "$ASCP_LIMIT" \
    -i "$ASCP_KEY" \
    "$@" \
    "$STUDY@$ASCP_SERVER:$SOURCE" "$TARGET"

/home/data/.aspera/connect/bin/ascp \
    -P$ASCP_PORT \
    -l "$ASCP_LIMIT" \
    -i "$ASCP_KEY" \
    "$@" \
    "$STUDY@$ASCP_SERVER:$SOURCE" "$TARGET"
