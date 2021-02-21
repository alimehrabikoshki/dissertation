output "network_id" {
  value = google_compute_network.network.id
}

output "subnet_id" {
  value = google_compute_subnetwork.subnet.id
}