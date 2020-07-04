#!/bin/sh

HOSTS="ubuntu.local ubuntu.local"

read -s -p "Enter sudo password: " password

for host in $HOSTS; do
    scp setup.sh $host:
    echo $password | ssh $host sudo -S ./setup.sh
done

