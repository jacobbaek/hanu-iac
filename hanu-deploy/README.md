> WIP...

# the scripts will make a environment to ready to deploy

# Components
* deploy-all-nodes.yaml
deploy-ceph-nodes.yaml
deploy-local.yaml
deploy-worker-nodes.yaml
nic.yaml
update-raid-ssacli.yaml
update-reposrv.yaml
update-sshkey.yaml

* common      : update latest packages, install epel repo, disable selinux, copy the hosts file.
* ceph-tuned  : this ansible script will make the environment that can use ceph-tuned profile.
* nic         : make interfaces every node
* ssacli-raid : 

# Reference
