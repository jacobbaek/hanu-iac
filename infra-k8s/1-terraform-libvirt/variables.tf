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

# common variables
variable "base_pool" {
  default = "default"
}

variable "cloudinit_pool" {
  default = "kvmiamges"
}

variable "image_pool" {
  default = "ceph-pool"
}

variable "image_source" {
  #default = "CentOS7.qcow2"
  default = "CentOS7.raw"
}
