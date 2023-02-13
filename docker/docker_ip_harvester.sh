#! /bin/bash

###################################################################
#Script Name	:     Docker IP haverster                                                                                         
#Description	:     Lists docker IP addresses                                                                                                                                    
#Author       	:     Luis Felipe Brum
#Email         	:     eu@felipebrum.com
###################################################################

echo "-----------------------------"
echo "DOCKER CONTAINER IP LIST"                                                                                    
echo "-----------------------------"

CONTAINER_LIST=$(docker container ls --format "{{.Names}}")

for container in $CONTAINER_LIST
do
    ip=$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $container)
    echo "$container: $ip"
done
echo "-----------------------------"