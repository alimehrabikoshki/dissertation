data "google_compute_zones" "available" {
  project       = var.gcp_project
  region        = var.gcp_region
  status        = "UP"
}

#module "k8s-testnet" {
#  source = "../compute-network"
#}

module "data-disk" {
  source = "../data-disk"
#  disk_zone = data.google_compute_zones.available.names[1]
  disk_zone = var.zone
}

module "master-node" {
  source = "../compute-instance"
  external_disk = module.data-disk.disk_id
  external_disk_mode = "READ_WRITE"
  instance_name = "master-${count.index+1}"
  subnet_id = var.subnet_id
  machine_type = var.machine_type
  preemptible = var.preemptible
  instance_zone = var.zone
}

module "worker-node" {
  source = "../compute-instance"
  count = 2
  external_disk = module.data-disk.disk_id
  external_disk_mode = "READ_ONLY"
  instance_name = "worker-${count.index+1}"
  subnet_id = var.subnet_id
  machine_type = var.machine_type

  instance_zone = var.zone
}