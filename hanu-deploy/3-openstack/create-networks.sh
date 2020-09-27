#!/bin/bash

# create external(provider) network.
openstack network create --share --external \
--provider-physical-network provider \
--provider-network-type flat provider

# create subnet that will be run on external(provider) network
# the IP address (192.168.0.x)
openstack subnet create --network provider \
--allocation-pool start=192.168.0.100,end=192.168.0.200 \
--dns-nameserver 8.8.4.4 --gateway 192.168.0.1 \
--subnet-range 192.168.0.0/24 provider

# create private network. (the IP address doesn't need to change if you don't need)
openstack network create selfservice
openstack subnet create --network selfservice \
--dns-nameserver 8.8.4.4 --gateway 100.100.100.1 \
--subnet-range 100.100.100.0/24 selfservice

# create subnet that will be run on private network
#openstack router create --distributed router
openstack router create router
neutron router-interface-add router selfservice
neutron router-gateway-set router provider

