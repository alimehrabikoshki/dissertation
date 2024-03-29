
/*
Each playbook run has:
playbook
Master IP
Worker IPs
private key
target host
*/

variable "playbook" {
  type        = string
  description = "Name of the playbook"
}

variable "cluster_master_ip" {
  type        = string
  description = "The external IP of the current cluster master"
}

variable "cluster_worker1_ip" {
  type        = string
  description = "The external IP of worker 1"
}

variable "cluster_master_internal_ip" {
  type        = string
  description = "The internal IP of the current cluster master"
}

variable "cluster_worker1_internal_ip" {
  type        = string
  description = "The internal IP of worker 1"
}

variable "cluster" {
  type = string
  description = "cluster number"
}

variable "target_host" {
  type        = string
  description = "target host"
}

