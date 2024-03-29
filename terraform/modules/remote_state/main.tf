resource "google_storage_bucket" "tfstate-bucket" { 
  project       = var.gcp_project 
  name          = var.bucket-name 
  location      = var.gcp_region 
  force_destroy = true 
  storage_class = var.storage-class 
  versioning { 
    enabled = true 
  } 
} 
