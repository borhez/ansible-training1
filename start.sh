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

hosts.sh $1
server.sh $1

echo "FINISH SUCCESS"

