#!/bin/bash

HOSTNAME=ansible-server
PATH_TO_FILE=$(realpath ./container-server.sh)

docker run -it -d -h ${HOSTNAME} -v $PATH_TO_FILE:/installme.sh ubuntu:latest 
ID=$(docker ps -a | head -2 | awk 'NR>1 {print $1}')

docker exec -i ${ID} /bin/bash ./installme.sh

#docker stop $ID
#docker rm $ID

