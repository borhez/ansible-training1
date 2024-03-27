#!/bin/bash

HOSTNAME=ansible-server
AMOUNT_HOSTS=$1
NET1=$2
PATH_TO_FILE=$(realpath ./container-server.sh)

echo -e "\033[35mupdate ${HOSTNAME}\033[30m"
docker run -it -d -h ${HOSTNAME} --network $NET1 -v $PATH_TO_FILE:/installme.sh ubuntu:latest 
ID=$(docker ps -a | head -2 | awk 'NR>1 {print $1}')

docker exec -i ${ID} /bin/bash ./installme.sh ${AMOUNT_HOSTS}
n=1
while [[ $n -le ${AMOUNT_HOSTS} ]]
do
  docker exec -i ${ID} /bin/bash ssh-copy-id ansible@host$n
  (( n++ ))
done 

