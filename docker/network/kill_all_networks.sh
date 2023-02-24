#!/bin/bash

# Disconnect and remove all non-default Docker networks
docker network prune --force > /dev/null 2>&1

# Check if any non-default networks are still active
active_networks=$(docker network ls --filter "type=custom" --format "{{.ID}}")
if [ ! -z "$active_networks" ]; then
  # Disconnect and remove any remaining active non-default networks
  for net in $active_networks
  do
    docker network disconnect --force $net > /dev/null 2>&1
    docker network rm --force $net > /dev/null 2>&1
  done

  # Check if any non-default networks are still active
  active_networks=$(docker network ls --filter "type=custom" --format "{{.ID}}")
  if [ ! -z "$active_networks" ]; then
    echo "Warning: The following non-default Docker networks are still active: $active_networks"
  else
    echo "All non-default Docker networks have been successfully disconnected and removed."
  fi
else
  echo "All non-default Docker networks have been successfully disconnected and removed."
fi