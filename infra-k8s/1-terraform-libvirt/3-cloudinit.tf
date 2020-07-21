data "template_file" "master_user_data" {
  count = length(var.master)
  template = file("${path.module}/templates/cloud_init.cfg")
}

data "template_file" "master_meta_data" {
  count = length(var.master)
  template = file("${path.module}/templates/metadata.yaml")
  vars = {
    hostname = var.master[count.index]
  }
}

data "template_file" "master_network_config" {
  count = length(var.master)
  template = file("${path.module}/templates/master_network_config.cfg")

  vars = {
    ip_number = "7${count.index+1}"
  }
}

data "template_file" "worker_user_data" {
  count = length(var.worker)
  template = file("${path.module}/templates/cloud_init.cfg")
}

data "template_file" "worker_meta_data" {
  count = length(var.worker)
  template = file("${path.module}/templates/metadata.yaml")
  vars = {
    hostname = var.master[count.index]
  }
}

data "template_file" "worker_network_config" {
  count = length(var.worker)
  template = file("${path.module}/templates/worker_network_config.cfg")

  vars = {
    ip_number = "8${count.index+1}"
  }
}

data "template_file" "deploy_user_data" {
  template = file("${path.module}/templates/cloud_init.cfg")
}

data "template_file" "deploy_meta_data" {
  template = file("${path.module}/templates/metadata.yaml")
  vars = {
    hostname = var.deploy
  }
}

data "template_file" "deploy_network_config" {
  template = file("${path.module}/templates/deploy_network_config.cfg")

  vars = {
    ip_number = "5"
  }
}
