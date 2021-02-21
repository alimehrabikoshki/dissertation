resource "google_compute_disk" "disk" {
  name  = var.disk_name
  type  = var.disk_type
  zone  = var.disk_zone
  size =  var.disk_size
  project = var.gcp_project
}