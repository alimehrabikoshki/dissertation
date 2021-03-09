variable "gcp_regionA" {
  type        = string 
  description = "GCP region A"
  default     = "europe-west2"
}
variable "gcp_regionB" {
  type        = string
  description = "GCP region B"
  default     = "europe-west4"
}
variable "gcp_regionB-zone" {
  type        = string
  description = "GCP region B zone"
  default     = "europe-west4-a"
}

variable "gcp_project" { 
  type        = string 
  description = "GCP project name"
  default     = "voltaic-reducer-304616"
} 

variable "gcp_auth_file" { 
  type        = string 
  description = "GCP authentication file"
}

variable "bucket-name" { 
  type        = string 
  description = "Name of GCS bucket to create" 
} 

variable "storage-class" { 
  type        = string 
  description = "The storage class of GCS bucket to create" 
} 

variable "regionA-cidr_range" {
  type        = string
  description = "The regionA subnet CIDR range"
  default     = "10.10.0.0/24"
}
variable "regionB-cidr_range" {
  type        = string
  description = "The regionB subnet CIDR range"
  default     = "10.20.0.0/24"
}
variable "cni" {
  type        = string
  description = "The CNI being tested"
  default     = "calico"
}
