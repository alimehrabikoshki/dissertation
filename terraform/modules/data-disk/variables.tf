variable "gcp_region" {
  type        = string
  description = "GCP region"
}

variable "gcp_project" {
  type        = string
  description = "GCP project name"
}

variable "disk_name" {
  type        = string
  description = "Name of the persistent disk"
  default     = "disk"
}

variable "disk_size" {
  type        = number
  description = "Size of the persistent disk"
  default     = 20
}

variable "disk_type" {
  type        = string
  description = "Type of the disk"
  default     = "pd-ssd"

}

variable "disk_zone" {
  type        = string
  description = "The zone the disk resides in"
}