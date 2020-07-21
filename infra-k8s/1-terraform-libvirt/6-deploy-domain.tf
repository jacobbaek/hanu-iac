resource "libvirt_cloudinit_disk" "deploy-cloudinit" {
  pool = var.cloudinit_pool

  name = format("%s-cloudinit.iso", var.deploy)
  user_data = data.template_file.deploy_user_data.rendered
  meta_data = data.template_file.deploy_meta_data.rendered
  network_config = data.template_file.deploy_network_config.rendered
}

resource "libvirt_domain" "deploy-instance" {
  name = var.deploy
  memory = var.deploy_memory
  vcpu = var.deploy_vcpu
  cloudinit = libvirt_cloudinit_disk.deploy-cloudinit.id
  
  disk { volume_id = libvirt_volume.deploy-osdisk.id }

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
    addresses = ["100.100.100.5"]
    wait_for_lease = false
  }

  # ceph monitor network
  network_interface {
    #network_name = "ceph-monitor"
    bridge = "br0.40"
    addresses = ["10.10.40.5"]
    wait_for_lease = false
  }

  # ceph storage network
  network_interface {
    #network_name = "ceph-storage"
    bridge = "br0.50"
    addresses = ["10.10.50.5"]
    wait_for_lease = false
  } 

  # external network (ip)
  network_interface {
    bridge = "br0.110"
    addresses = ["172.16.0.5"]
    wait_for_lease = false
  }
}
