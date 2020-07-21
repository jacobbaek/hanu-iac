# per master instance
variable "master" {
  type = list(string)
  default = ["infra-master001", "infra-master002", "infra-master003"]
}

variable "master_memory" { default = 32768 }
variable "master_vcpu" { default = 8 }

# per worker instance
variable "worker" {
  type = list(string)
  default = ["infra-worker001", "infra-worker002", "infra-worker003"]
}

variable "worker_memory" { default = 32768 }
variable "worker_vcpu" { default = 8 }

# per deploy instance
variable "deploy" { default = "infra-deploy" }

variable "deploy_memory" { default = 8196 }
variable "deploy_vcpu" { default = 4 }

# common variables
variable "image_pool" {
  default = "default"
}

variable "cloudinit_pool" {
  default = "kvmimages"
}

# History for ceph integration. At the moment, ceph doesn't use as libvirt backend storage.
variable "disk_pool" {
  #default = "ceph-pool"
  default = "kvmimages"
}

variable "image_source" {
  #default = "CentOS7.qcow2"
  default = "CentOS7.raw"
}
