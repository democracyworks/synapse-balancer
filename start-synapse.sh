#!/bin/sh

set -x

CONFIG=$1

exec bundle exec synapse --conf=conf/$CONFIG
