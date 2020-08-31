#!/bin/bash

RST=`ldapsearch -o ldif-wrap=no -xLLL -h 172.16.1.2 -b "dc=hanu-ci,dc=io" -D "cn=admin,dc=hanu-ci,dc=io" -W "objectclass=ldapPublicKey" | grep sshPublicKey | sed "s/sshPublicKey: //" | grep ssh-rsa`
echo $RST > authorized_keys
