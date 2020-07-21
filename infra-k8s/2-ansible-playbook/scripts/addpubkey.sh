#!/bin/bash
## ssh-public-key copy into each nodes

source sourcelist

if [ ${IPS[0]} = "" ]; then
  echo "[ERROR] There is no definition for IP addresses"
  exit 1
fi

for i in ${IPS[@]}; do ssh-copy-id -o StrictHostKeyChecking=no root@$i; done
