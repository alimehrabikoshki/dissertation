data "google_compute_zones" "available" {
  project       = var.gcp_project
  region        = var.gcp_region
  status        = "UP"
}

module "k8s-testnet" {
  source = "../modules/compute-network"
  cidr_range = var.cidr_range
}

module "cluster1" {
  source = "../modules/k8s-cluster"
  zone = data.google_compute_zones.available.names[1]
  subnet_id = module.k8s-testnet.subnet_id
}

module "cluster2" {
  source = "../modules/k8s-cluster"
  zone = data.google_compute_zones.available.names[2]
  subnet_id = module.k8s-testnet.subnet_id
}