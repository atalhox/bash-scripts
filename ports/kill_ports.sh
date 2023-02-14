#!/bin/bash

# This script terminates the processes running on ports 80 and 3306

ports="80 3306"

for port in $ports; do
  # Find the process ID (pid) associated with the specified port and terminate the process
  sudo lsof -t -i tcp:$port -s tcp:listen | sudo xargs kill
  echo "Process running on port $port has been terminated"
done