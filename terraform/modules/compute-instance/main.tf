data "google_compute_zones" "available" {
  project       = var.gcp_project
  region        = var.gcp_region
  status        = "UP"
}

resource "google_compute_attached_disk" "attached_disk" {
  disk = var.external_disk
  instance = google_compute_instance.instance.id
}

resource "google_compute_instance" "instance" {
  project       = var.gcp_project
  name          = "${var.instance_name}-${count.index+1}"
  location      = var.gcp_region
  machine_type  = var.machine_type #"e2-standard-2"
  zone = data.google_compute_zones.available.names[1]

  boot_disk {
    device_name = "${var.instance_name}-${count.index+1}-boot_disk"
    auto_delete = true
    initialize_params {
      image     = var.instance_image
    }
  }

  network_interface {
    subnetwork = var.subnet_id
    network_ip = var.internal_ip
  }

  scheduling {
    preemptible = var.preemptible
  }
}

