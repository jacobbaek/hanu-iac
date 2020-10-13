#!/bin/bash

VmName="Jenkins-Slave"

serverUuid=`openstack server list -f value | grep $VmName | awk '{print $1}'`
#openstack server remove floating ip $serverUuid $fipIp
#echo "Disassociate floating IP from "$serverUuid

openstack server delete $serverUuid
echo "Deleted "$serverUuid" VM"
