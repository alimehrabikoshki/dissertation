
variable "gcp_regionA" {
  type        = string
  description = "GCP region A"

}
variable "gcp_regionB" {
  type        = string
  description = "GCP region B"

}
variable "gcp_regionB-zone" {
  type        = string
  description = "GCP region B zone"

}

variable "gcp_project" {
  type        = string
  description = "GCP project name"
}


variable "regionA-cidr_range" {
  type        = string
  description = "The regionA subnet CIDR range"

}
variable "regionB-cidr_range" {
  type        = string
  description = "The regionB subnet CIDR range"

}
