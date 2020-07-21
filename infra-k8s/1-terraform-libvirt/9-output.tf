output "master_instances" {
  description = "print master instance names"
  value = libvirt_domain.master-instances.*.name
}

output "worker_instances" {
  description = "print worker instance names"
  value = libvirt_domain.worker-instances.*.name
}

output "deploy_instance" {
  description = "print deploy instance names"
  value = libvirt_domain.deploy-instance.name
}
