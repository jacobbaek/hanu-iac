#!/bin/bash

# create external(private-mgmt-online) network.
openstack network create --share --external \
--provider-physical-network private-mgmt-online \
--provider-network-type flat private-mgmt-online

# create subnet that will be run on external(provider) network
# the IP address (172.16.0.0/18)
openstack subnet create --network private-mgmt-online \
--allocation-pool start=172.16.50.1,end=172.16.53.254 \
--dns-nameserver 8.8.4.4,1.1.1.1 --gateway 172.16.0.1 \
--subnet-range 172.16.0.0/18 private-mgmt-online

# create private-data1 network.
openstack network create private-data1
openstack subnet create --network data1 \
--dns-nameserver 8.8.4.4,1.1.1.1 --gateway 20.20.20.1 \
--subnet-range 20.20.20.0/24 private-data1

# create private-data2 network.
openstack network create private-data2
openstack subnet create --network data2 \
--dns-nameserver 8.8.4.4,1.1.1.1 --gateway 30.30.30.1 \
--subnet-range 30.30.30.0/24 private-data2

# create subnet that will be run on private network
#openstack router create --distributed router
openstack router create router
neutron router-interface-add router selfservice
neutron router-gateway-set router provider

