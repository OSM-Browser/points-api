#!/bin/sh
set -e

! ulimit -n 2048

exec "$@"
