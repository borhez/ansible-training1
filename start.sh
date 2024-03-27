#!/bin/bash

if [[ $# -ne 1 ]]
  then echo "Need one argument: amount of nodes which will be managed by ansible-server"
  exit 0
fi
REGEXPR="^[0-9]+$"
if [[ ! $1 =~ $REGEXPR ]]
  then echo "Argument must be a number"
  exit 0
fi

NET1=ansblserv1_hosts
docker network create $NET1
./src/hosts.sh $1 $NET1
./src/server.sh $1 $NET1

echo -e "\033[35mFINISH SUCCESS\033[30m"

