#!/bin/bash
HOSTS="172.29.233.28"

COUNT=10

for myHost in $HOSTS
do
  count=$(ping -c $COUNT $myHost | grep 'received' | awk -F',' '{ print $2 }' | awk '{ print $1 }')
  if [ $count -eq 0 ]; then
    ./failover.sh
  fi
done
