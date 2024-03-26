#!/bin/bash
apt update
echo "install openssh-server"
apt install openssh-server -y
service ssh start

echo "adduser ansible:"
adduser ansible


