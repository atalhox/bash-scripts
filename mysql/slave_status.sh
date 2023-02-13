#!/bin/bash

# Set the host for the MySQL server
HOST="<hostname>"

# Set the path to the MySQL command line client
MYSQL="$(which mysql)"

# Set the credentials for connecting to the MySQL server
USER="root"
PASSWORD="root"

# Check the slave status
SLAVE_STATUS=`$MYSQL -h $HOST -u$USER -p$PASSWORD -e "SHOW SLAVE STATUS\G"`

# Check if the slave is running
echo $SLAVE_STATUS | grep "Running: Yes"
if [ $? -eq 0 ]; then
  echo "Slave is active on host $HOST."
else
  echo "Slave is not active on host $HOST."
fi