module "k8s-testnet-regionA" {
  source = "../compute-network"
  cidr_range = var.regionA-cidr_range
  gcp_project = var.gcp_project
  gcp_region = var.gcp_regionA
  network_name = "k8s-testnet-regiona"
  subnet_name = "k8s-testsubnet-regiona"
}

module "k8s-testnet-regionB" {
  source = "../compute-network"
  cidr_range = var.regionB-cidr_range
  gcp_project = var.gcp_project
  gcp_region = var.gcp_regionB
  network_name = "k8s-testnet-regionb"
  subnet_name = "k8s-testsubnet-regionb"

}

resource "google_compute_firewall" "k8s-allow-traffic-regionA" {
  name    = "allow-regiona-firewall"
  network = module.k8s-testnet-regionA.network_id
  allow {
    protocol = "all"
  }
}

resource "google_compute_firewall" "k8s-allow-traffic-regionB" {
  name = "allow-regionb-firewall"
  network = module.k8s-testnet-regionB.network_id
  allow {
    protocol = "all"
  }
}

resource "google_compute_network_peering" "peer1" {
  name         = "peer1"
  network      = module.k8s-testnet-regionA.network_id
  peer_network = module.k8s-testnet-regionB.network_id
}

resource "google_compute_network_peering" "peer2" {
  name         = "peer2"
  network      = module.k8s-testnet-regionB.network_id
  peer_network = module.k8s-testnet-regionA.network_id
}