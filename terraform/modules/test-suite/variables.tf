variable "cluster_master_ip" {
  type        = string
  description = "The external IP of the current cluster master"
}

variable "cluster_worker1_ip" {
  type        = string
  description = "The external IP of worker 1"
}

variable "cluster_worker2_ip" {
  type = string
  description = "The external IP of worker 2"
}

variable "cluster_master_internal_ip" {
  type        = string
  description = "The internal IP of the current cluster master"
}

variable "cluster_worker1_internal_ip" {
  type        = string
  description = "The internal IP of worker 1"
}

variable "cluster_worker2_internal_ip" {
  type        = string
  description = "The internal IP of worker 2"
}

variable "cluster" {
  type = string
  description = "cluster number"
}
variable "k8s_ssh_private_key" {
  type        = string
  description = "k8s user private key"
}

