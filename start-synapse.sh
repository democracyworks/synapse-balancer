#!/bin/sh

set -x

CONFIG=$1

if [[ -z $CONFIG ]]; then
  echo "CONFIG is required (can be given as first arg to script)"
  exit 1
fi

exec bundle exec synapse --conf=conf/$CONFIG
