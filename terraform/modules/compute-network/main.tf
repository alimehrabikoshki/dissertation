resource "google_compute_network" "network" {
  name          = var.network_name
  mtu           = var.mtu_value
  routing_mode =  var.routing_mode
  project       = var.gcp_project
  auto_create_subnetworks = false

}
resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.cidr_range
  region        = var.gcp_region
  network       = google_compute_network.network.id
}
