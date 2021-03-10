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

variable "cluster1_master_public_ip" {
  type        = string
  description = "The public IP of cluster 1 master"
}
variable "cluster2_master_public_ip" {
  type        = string
  description = "The public IP of cluster 2 master"
}
variable "cluster3_master_public_ip" {
  type        = string
  description = "The public IP of cluster 3 master"
}


variable "cluster" {
  type = string
  description = "cluster number"
}

variable "cni" {
  type = string
  description = "The CNI being tested"
}
