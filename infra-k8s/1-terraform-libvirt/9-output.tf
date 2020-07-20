output "master_instances" {
  description = "print master instance names"
  value = libvirt_domain.master-instances.*.name
}

output "worker_instances" {
  description = "print worker instance names"
  value = libvirt_domain.master-instances.*.name
}
