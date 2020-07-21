#!/bin/bash
## make a hosts file

cat ../inventory/hosts.ini | grep access_ip | awk '{print $2, $1}' | sed "s/access_ip=//g" > ../files/hosts
