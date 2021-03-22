#resource "google_compute_attached_disk" "attached_disk" {
#  disk = var.external_disk
#  instance = google_compute_instance.instance.id
#}

resource "google_compute_instance" "instance" {

  project       = var.gcp_project
  name          = var.instance_name
  machine_type  = var.machine_type #"e2-standard-2"
  zone = var.instance_zone
  can_ip_forward = true
  min_cpu_platform = var.min_cpu_platform
  boot_disk {
    device_name = "${var.instance_name}-boot_disk"
    auto_delete = true
    initialize_params {
      image     = var.instance_image
    }
  }

  network_interface {
    subnetwork = var.subnet_id
    network_ip = var.internal_ip
    nic_type = "GVNIC"
    access_config {}
  }


  scheduling {
    preemptible = var.preemptible
    automatic_restart = false
  }
  metadata = {
    ssh-keys = "${var.ssh_user}:${var.ssh_pubkey}"
  }
}

