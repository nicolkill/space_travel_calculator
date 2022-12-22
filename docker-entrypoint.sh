#!/bin/sh

set -e

if [ "$1" = 'start' ]; then
  mix phx.server
fi

exec "$@"
