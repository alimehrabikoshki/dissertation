terraform {
  required_version = ">= 0.14"
    required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.60.0"
    }
  }
}

provider "google" {
  credentials = file(var.gcp_auth_file)
  project     = var.gcp_project
  region      = var.gcp_regionA
}

