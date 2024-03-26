#!/bin/bash
N_HOSTS=$1
PATH_TO_FILE=$(realpath ./container-hosts.sh)

n=1
while [ $n -le $N_HOSTS ]
do
  HOSTNAME=host$n
  echo "update $HOSTNAME"
  docker run -d -it -h $HOSTNAME -v $PATH_TO_FILE:/installme.sh ubuntu:latest
  ID=$(docker ps -a | head -2 | awk 'NR>1 {print $1}')
  docker exec -i ${ID} /bin/bash ./installme.sh

  let "n=$n + 1"
  # (( n++ ))
done

