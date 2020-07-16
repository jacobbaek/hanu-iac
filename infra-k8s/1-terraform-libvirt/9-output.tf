output "master_instances" {
  description = "print master ip address"
  value = libvirt_domain.master-instances.*.name
}
