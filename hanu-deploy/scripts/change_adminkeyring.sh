#!/bin/bash

openstack_manifest_path='/root/tacoplay/inventory/hanu/openstack-manifest.yaml'
keyring=`ceph auth get client.admin 2> /dev/null | grep key | awk '{print $3}'`
sed -i 's/TACO_ADMIN_KEYRING/$keyring/g' $openstack_manifest_path
