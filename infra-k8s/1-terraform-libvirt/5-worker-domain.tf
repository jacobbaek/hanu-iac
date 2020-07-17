resource "libvirt_cloudinit_disk" "worker-cloudinit" {
  count = length(var.worker)
  pool = var.base_pool

  name = format("%s-cloudinit.iso", element(var.worker, count.index))
  user_data = data.template_file.worker_user_data[count.index].rendered
  meta_data = data.template_file.worker_meta_data[count.index].rendered
  network_config = data.template_file.worker_network_config[count.index].rendered
}

resource "libvirt_domain" "worker-instances" {
  count = length(var.worker)
  name = element(var.worker, count.index)
  memory = var.worker_memory
  vcpu = var.worker_vcpu
  cloudinit = libvirt_cloudinit_disk.worker-cloudinit[count.index].id
  
  disk { volume_id = libvirt_volume.worker-osdisk[count.index].id }

  console {
    type = "pty"
    target_type = "serial"
    target_port = "0"
  }

  graphics {
    type = "spice"
    listen_type = "address"
    autoport = true
  }
  
  # deploy network
  network_interface {
    network_id = libvirt_network.deploy.id
    addresses = ["100.100.100.8${count.index+1}"]
    wait_for_lease = false
  }

  # ceph monitor network
  network_interface {
    #network_name = "ceph-monitor"
    bridge = "br0.40"
    addresses = ["10.10.40.8${count.index+1}"]
    wait_for_lease = false
  }

  # ceph storage network
  network_interface {
    #network_name = "ceph-storage"
    bridge = "br0.50"
    addresses = ["10.10.50.8${count.index+1}"]
    wait_for_lease = false
  } 
}
