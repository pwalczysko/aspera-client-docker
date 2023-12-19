#!/bin/bash

set -e
set -u

SOURCE=$1; shift
TARGET=$1; shift

echo /home/data/.aspera/connect/bin/ascp \
    -P$ASCP_PORT \
    -l "$ASCP_LIMIT" \
    -i "$ASCP_KEY" \
    -k "$ASCP_RETRANSFER_FILE" \
    "$@" \
    "$ASCP_USER@$ASCP_SERVER:/pub/databases/IDR/$SOURCE" "$TARGET"

/home/data/.aspera/connect/bin/ascp \
    -P$ASCP_PORT \
    -l "$ASCP_LIMIT" \
    -i "$ASCP_KEY" \
    -k "$ASCP_RETRANSFER_FILE" \
    "$@" \
    "$ASCP_USER@$ASCP_SERVER:/pub/databases/IDR/$SOURCE" "$TARGET"
