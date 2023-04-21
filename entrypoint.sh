#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

# Check if the database is ready before migrating
/usr/bin/wait-for-it.sh db:3306 -- echo "Database is up"
bundle exec rails db:migrate 2>/dev/null || bundle exec rails db:create db:migrate

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"