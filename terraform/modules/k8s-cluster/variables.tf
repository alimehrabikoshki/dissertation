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

variable "cluster_name" {
  type        = string
  description = "Name of the cluster"
}


variable "subnet_id" {
  type        = string
  description = "ID of the subnet"
}

variable "preemptible" {
  type        = string
  description = "Select whether or not to provision reduced cost preemptible vm's"
  default = true #Change to false when doing final tests
}


variable "machine_type" {
  type        = string
  description = "Machine type of compute instances"
  default     = "e2-standard-2"
}



variable "zone" {
  type        = string
  description = "zone of the instances and disk"

}