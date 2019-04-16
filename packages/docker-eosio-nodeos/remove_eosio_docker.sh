#!/usr/bin/env bash
set -o errexit

# sourcing variable from config file
source ./config.file

# override config if there are any local config changes
if [ -f "./config.file.local" ]; then
  source ./config.file.local
fi

# change to script's directory
cd "$(dirname "$0")"
if [ "$(docker ps -q -f name=$NODEOS_CONTAINER_NAME)" ]; then
  docker stop $NODEOS_CONTAINER_NAME && rm -r data/*
fi
