variable "gcp_regionA" {
  type        = string 
  description = "GCP region A"
#  default     = "europe-west2"
}
variable "gcp_regionB" {
  type        = string
  description = "GCP region B"
#  default     = "europe-west4"
}
variable "gcp_regionB_zone" {
  type        = string
  description = "GCP region B zone"
#  default     = "europe-west4-a"
}

variable "gcp_project" { 
  type        = string 
  description = "GCP project name"
  default     = "divine-aegis-312017"
} 

variable "gcp_auth_file" { 
  type        = string 
  description = "GCP authentication file"
}
variable "regionA_cidr_range" {
  type        = string
  description = "The regionA subnet CIDR range"
#  default     = "10.10.0.0/24"
}
variable "regionB_cidr_range" {
  type        = string
  description = "The regionB subnet CIDR range"
#  default     = "10.20.0.0/24"
}
variable "machine_type" {
  type        = string
  description = "Machine type of compute instances"
 # default     = "e2-standard-2"
}