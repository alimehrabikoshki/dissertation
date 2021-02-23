data "google_compute_zones" "available" {
  project       = var.gcp_project
  region        = var.gcp_region
  status        = "UP"
}
resource "tls_private_key" "ssh_key" {
  algorithm   = "RSA"
  rsa_bits = "4096"
}
module "k8s-testnet" {
  source = "../modules/compute-network"
  cidr_range = var.cidr_range
}
resource "google_compute_firewall" "k8s-allow-traffic" {
  name    = "test-firewall"
  network = module.k8s-testnet.network_id

  allow {
    protocol = "all"
  }
#  source_ranges = ["10.0.0.0/8"]
}

module "cluster" {
  count = 2
  source = "../modules/k8s-cluster"
  zone = data.google_compute_zones.available.names[count.index+1]
  subnet_id = module.k8s-testnet.subnet_id
  cluster_name = "cluster${count.index+1}"
  ssh_pubkey = tls_private_key.ssh_key.public_key_openssh
}

module "configure-cluster" {
  count = 2
  source = "../modules/configure-cluster"
  cluster_master_ip = module.cluster[count.index].master-node-ip
  cluster_worker1_ip = module.cluster[count.index].worker1-node-ip
  cluster_worker2_ip = module.cluster[count.index].worker2-node-ip
  k8s_ssh_private_key = tls_private_key.ssh_key.private_key_pem
  cni_playbook_path = "../../../ansible/modules/CNIs/calico/calico_master.yaml"

}
//
//module "cluster2" {
//  source = "../modules/k8s-cluster"
//  zone = data.google_compute_zones.available.names[2]
//  subnet_id = module.k8s-testnet.subnet_id
//  cluster_name = "cluster2"
//  ssh_pubkey = tls_private_key.ssh_key.public_key_openssh
//}