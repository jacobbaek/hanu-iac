resource "libvirt_cloudinit_disk" "master-cloudinit" {
  count = length(var.master)
  pool = var.cloudinit_pool

  name = format("%s-cloudinit.iso", element(var.master, count.index))
  user_data = data.template_file.master_user_data[count.index].rendered
  meta_data = data.template_file.master_meta_data[count.index].rendered
  network_config = data.template_file.master_network_config[count.index].rendered
}

resource "libvirt_domain" "master-instances" {
  count = length(var.master)
  name = element(var.master, count.index)
  memory = var.master_memory
  vcpu = var.master_vcpu
  cloudinit = libvirt_cloudinit_disk.master-cloudinit[count.index].id
  
  disk { volume_id = libvirt_volume.master-osdisk[count.index].id }

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
  
  # deploy network (access_ip)
  network_interface {
    network_id = libvirt_network.deploy.id
    addresses = ["100.100.100.7${count.index+1}"]
    wait_for_lease = false
  }

  # ceph monitor network
  network_interface {
    #network_name = "ceph-monitor"
    bridge = "br0.40"
    addresses = ["10.10.40.7${count.index+1}"]
    wait_for_lease = false
  }

  # external network (ip)
  network_interface {
    bridge = "br0.110"
    addresses = ["172.16.0.7${count.index+1}"]
    wait_for_lease = false
  }
}
