#!/bin/sh

# Make sure the symlinks have targets
mkdir -p /data/branches
touch /data/active-season

exec "$@"
