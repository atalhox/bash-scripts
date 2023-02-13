#!/bin/bash

# Function to check if a port is in use and return a message indicating the status
check_port() {
  local port=$1

  if fuser "${port}/tcp" > /dev/null; then
    echo "There is a process using port ${port}."
  else
    echo "There is no process using port ${port}."
  fi
}

# Check port 80
check_port 80

# Check port 3600
check_port 3600