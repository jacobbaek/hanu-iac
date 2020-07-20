# will make below network
# - deploy
# - monitor (ceph) : using bridge br0.40, so don't need to make it
# - storage (ceph) : using bridge br0.50, so don't need to make it
# - public : using bridge br0.110, so don't need to make it

resource "libvirt_network" "deploy" {
  name = "deploy-network"
  mode = "none"
  bridge = "virbr11"
  addresses = ["100.100.100.0/24"]
  autostart = true
}

resource "libvirt_network" "ceph-monitor" {
  name = "ceph-monitor"
  mode = "bridge"
  bridge = "br0.40"
  addresses = ["10.10.40.0/24"]
  autostart = true
}

resource "libvirt_network" "ceph-storage" {
  name = "ceph-storage"
  mode = "bridge"
  bridge = "br0.50"
  addresses = ["10.10.50.0/24"]
  autostart = true
}

resource "libvirt_network" "public" {
  name = "public-network"
  mode = "bridge"
  bridge = "br0.110"
  addresses = ["172.16.0.0/18"]
  autostart = true
}
