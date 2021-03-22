#resource "google_compute_attached_disk" "attached_disk" {
#  disk = var.external_disk
#  instance = google_compute_instance.instance.id
#}
data "google_compute_image" "my_image" {
  family  = "debian-9"
  project = "debian-cloud"
}
resource "google_compute_image" "gvnicimage" {

  name = "gvnicimage"
  family = "ubuntu-2004-lts"
  source_image = "projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20210315"
  guest_os_features {
    type = "GVNIC"
  }
}

