# will make below volumes
# - master osdisks
# - worker osdisks
# - ceph disk (should check)

resource "libvirt_volume" "master-osdisk" {
  count = length(var.master)
  name = format("%s-%s", "osdisk", element(var.master, count.index))
  base_volume_pool = var.base_pool
  pool = var.image_pool
  format = "qcow2"
  base_volume_name = var.image_source
}

resource "libvirt_volume" "worker-osdisk" {
  count = length(var.worker)
  name = format("%s-%s", "osdisk", element(var.worker, count.index))
  base_volume_pool = var.base_pool
  pool = var.image_pool
  format = "qcow2"
  base_volume_name = var.image_source
}

