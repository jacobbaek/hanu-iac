# will make below volumes
# - master osdisks
# - worker osdisks
# if using the ceph rbd backend, need to use cinder.
# so need to check running cinder standalone or don't use ceph rbd backend as libvirt backend storage

resource "libvirt_volume" "master-osdisk" {
  count = length(var.master)
  name = format("%s-%s", "osdisk", element(var.master, count.index))
  base_volume_pool = var.base_pool
  pool = var.image_pool
  format = "raw"
  base_volume_name = var.image_source
}

resource "libvirt_volume" "worker-osdisk" {
  count = length(var.worker)
  name = format("%s-%s", "osdisk", element(var.worker, count.index))
  base_volume_pool = var.base_pool
  pool = var.image_pool
  format = "raw"
  base_volume_name = var.image_source
}

