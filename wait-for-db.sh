#!/bin/sh
set -e

host="$POSTGRES_HOST"
port="$POSTGRES_PORT"

until nc -z "$host" "$port"; do
  >&2 echo "Postgres is unavailable - waiting for it..."
  sleep 1
done

>&2 echo "Postgres is up - executing command"
exec "$@"
