module "k8s-testnet" {
  source = "modules/compute-network"
  cidr_range = var.cidr_range
}

module "cluster1" {
  source = "modules/k8s-cluster"
  disk_zone = ""
  subnet_id = ""
}