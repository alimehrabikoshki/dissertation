#resource "google_compute_attached_disk" "attached_disk" {
#  disk = var.external_disk
#  instance = google_compute_instance.instance.id
#}

resource "google_compute_instance" "instance" {

  project       = var.gcp_project
 # name          = "${var.instance_name}-${count.index+1}"
  name          = var.instance_name
  machine_type  = var.machine_type #"e2-standard-2"
  zone = var.instance_zone

  boot_disk {
#    device_name = "${var.instance_name}-${count.index+1}-boot_disk"
    device_name = "${var.instance_name}-boot_disk"
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
    automatic_restart = false
  }
}

