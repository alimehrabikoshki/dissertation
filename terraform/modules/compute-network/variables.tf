variable "gcp_region" {
  type        = string
  description = "GCP region"
}

variable "gcp_project" {
  type        = string
  description = "GCP project name"
}


variable "network_name" {
  type        = string
  description = "Name of the network"
}

variable "subnet_name" {
  type        = string
  description = "The name of the subnet"
}

variable "cidr_range" {
  type        = string
  description = "The subnet CIDR range"
}


variable "routing_mode" {
  type        = string
  description = "The  routing mode of the network"
  default     = "GLOBAL"
}


variable "mtu_value" {
  type        = string
  description = "The MTU value of the network"
  default     = "1500"
}