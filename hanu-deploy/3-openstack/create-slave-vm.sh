#!/bin/bash

ImageName="centos7"
VmName="Jenkins-Slave"
Flavor="m1.large"
Keypair="jenkins-slave-hanukey"

flavorUuid=`openstack flavor list -f value | grep $Flavor | awk '{print $1}'`
echo "flavor uuid : "$flavorUuid

imageUuid=`openstack image list -f json | jq -r ".[] | select(.Name|test(\"$ImageName\")) | .ID"`
echo "image uuid : "$imageUuid

netUuids=`openstack network list -f json`
firstNetUuid=`echo $netUuids | jq -r ".[] | select(.Name|test(\"private-mgmt-online\")) | .ID"`
echo "first net uuid : "$firstNetUuid
secondNetUuid=`echo $netUuids | jq -r ".[] | select(.Name|test(\"private-data1\")) | .ID"`
echo "second net uuid : "$secondNetUuid
thirdNetUuid=`echo $netUuids | jq -r ".[] | select(.Name|test(\"private-data2\")) | .ID"`
echo "third net uuid : "$thirdNetUuid
providerNetUuid=`echo $netUuids | jq -r ".[] | select(.Name|test(\"provider\")) | .ID"`
echo "provider net uuid : "$providerNetUuid

sgId=`openstack security group list --project admin -f value | grep default | awk '{print $1}'`
echo "security group uuid : "$sgId

#rootVolUuid=`openstack volume create --image ${imageUuid} --bootable --type rbd2 --size 50 -f value -c id ${vmName}"`

openstack server create --flavor m1.large \
                        --image $imageUuid \
                        --key-name $Keypair \
                        --network $firstNetUuid \
                        --network $secondNetUuid \
                        --network $thirdNetUuid \
                        --security-group $sgId \
                        $VmName

serverUuid=`openstack server list -f value | grep $VmName | awk '{print $1}'`
echo "created "$serverUuid" VM"

fipIp=`openstack floating ip create provider -f json | jq -r '.name'`
echo "created floating IP "$fipIp

openstack server add floating ip $serverUuid $fipIp 
echo "associate floating ip into "$serverUuid" "$VmName
