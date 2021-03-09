data "google_compute_zones" "available" {
  project       = var.gcp_project
  region        = var.gcp_region
  status        = "UP"
}

module "master-node" {
  count = 1
  source = "../compute-instance"
  instance_name = "${var.cluster_name}-master-${count.index+1}"
  subnet_id = var.subnet_id
  machine_type = var.machine_type
  preemptible = var.preemptible
  instance_zone = data.google_compute_zones.available.names[count.index]
  ssh_pubkey = var.ssh_pubkey
  gcp_project = var.gcp_project
  gcp_region = var.gcp_region
}

module "worker-node" {
  source = "../compute-instance"
  count = 2
#  external_disk = module.data-disk.disk_id
#  external_disk_mode = "READ_ONLY"
  instance_name = "${var.cluster_name}-worker-${count.index+1}"
  subnet_id = var.subnet_id
  machine_type = var.machine_type
  preemptible = var.preemptible
  instance_zone = data.google_compute_zones.available.names[count.index+1]
  ssh_pubkey = var.ssh_pubkey
  gcp_project = var.gcp_project
  gcp_region = var.gcp_region
}