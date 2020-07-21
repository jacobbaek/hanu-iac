#!/bin/bash

source sourcelist

if [ ${IPS[0]} = "" ]; then
  echo "[ERROR] There is no definition for IP addresses"
  exit 1
fi
for i in ${IPS[@]}; do ssh-copy-id root@$i; done
