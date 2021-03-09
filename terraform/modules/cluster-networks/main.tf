module "k8s-testnet-regionA" {
  source = "../compute-network"
  cidr_range = var.regionA-cidr_range
  gcp_project = var.gcp_project
  gcp_region = var.gcp_regionA
}

module "k8s-testnet-regionB" {
  source = "../compute-network"
  cidr_range = var.regionB-cidr_range
  gcp_project = var.gcp_project
  gcp_region = var.gcp_regionB
}

resource "google_compute_firewall" "k8s-allow-traffic-regionA" {
  name    = "allow-regionA-firewall"
  network = module.k8s-testnet-regionA.network_id
  allow {
    protocol = "all"
  }
}

resource "google_compute_firewall" "k8s-allow-traffic-regionB" {
  name = "allow-regionB-firewall"
  network = module.k8s-testnet-regionB.network_id
  allow {
    protocol = "all"
  }
}

resource "google_compute_network_peering" "peerA" {
  name         = "peerA"
  network      = module.k8s-testnet-regionA.network_id
  peer_network = module.k8s-testnet-regionB.network_id
}

resource "google_compute_network_peering" "peerB" {
  name         = "peerB"
  network      = module.k8s-testnet-regionB.network_id
  peer_network = module.k8s-testnet-regionA.network_id
}