variable "gcp_region" {
  type        = string
  description = "GCP region"
  default     = "europe-west2"
}

variable "gcp_project" {
  type        = string
  description = "GCP project name"
  default     = "voltaic-reducer-304616"
}

variable "gcp_auth_file" {
  type        = string
  description = "GCP authentication file"
  default     = "/vm/uni/terraform/auth/service-key/voltaic-reducer-304616-ce2e65eb1f38.json"
}

variable "network_name" {
  type        = string
  description = "Name of the network"
  default     = "k8s-testnet"
}

variable "subnet_name" {
  type        = string
  description = "The name of the subnet"
  default     = "default_subnet"
}

variable "cidr_range" {
  type        = string
  description = "The subnet CIDR range"
  #default     = "10.10.10.0/24"
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