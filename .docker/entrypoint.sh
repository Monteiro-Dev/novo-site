#!/bin/bash

# Set uid of host machine
usermod --non-unique --uid "${HOST_UID}" www-data
groupmod --non-unique --gid "${HOST_GID}" www-data

if [ ! -d "vendor" ]; then
  composer install
fi

if [ ! -d "node_modules" ]; then
    npm ci
fi

npm run watch
