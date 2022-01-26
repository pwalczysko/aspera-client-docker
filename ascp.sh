#!/bin/bash

set -e
set -u

STUDY=$1; shift
SOURCE=$1; shift
TARGET=$1; shift
ASCP_OPTION_LIMIT=$1; shift

# If ASCP_OPTION_LIMIT is provided, then reset ASCP environment variable limit
# that was set in the Dockerfile
if [[ -n $ASCP_OPTION_LIMIT ]]; then
  ASCP_LIMIT=$ASCP_OPTION_LIMIT
fi

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
