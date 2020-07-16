#!/bin/bash

nexus3 repository delete ceph-nautilus
nexus3 repository create yum ceph-nautilus http://mirror.kakao.com/centos/7/storage/x86_64/ceph-nautilus/

nexus3 repository delete ceph_custom_repo -y
nexus3 repository create hosted raw ceph_custom_repo
nexus3 upload ./ceph-nautilus.repo ceph_custom_repo
