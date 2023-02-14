#!/bin/bash

# Check if there are running Docker containers
if [ -z "$(docker ps -q)" ]; then
    echo "No running Docker containers found"
else
    # Kill all running Docker containers
    docker kill $(docker ps -q)
    # Wait for all containers to stop
    while [ -n "$(docker ps -q)" ]; do
        sleep 1
    done
    echo "All Docker containers have been stopped"
fi