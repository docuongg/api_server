#!/bin/bash

# Exit on fail
set -e

# Waiting for dependent containers
/wait-for-it.sh web:3000 -t 300

# Bundle install
bundle install --jobs=4

# Start services
bundle exec sidekiq

# Finally call command issued to the docker service
exec "$@"
