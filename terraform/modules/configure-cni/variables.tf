variable "cni" {
  type        = string
  description = "The CNI being tested"
 # default     = "calico"
}
variable "cni_playbook_path" {
  type        = string
 # default     = "/mnt/c/Users/Ali/PycharmProjects/dissertation/ansible/modules/CNIs/calico/calico_master.yaml"
}
variable "reset_node_playbook_path" {
  type        = string
  description = "absolute path to node reset playbook"
  default = "/mnt/c/Users/Ali/PycharmProjects/dissertation/ansible/modules/k8s_nodes/all/reset_k8s_node.yaml"
}
variable "cluster1_master_public_ip" {
  type        = string
}

variable "cluster1_master_internal_ip" {
  type        = string
}
variable "cluster1_worker1_public_ip" {
  type        = string
}
variable "cluster1_worker1_internal_ip" {
  type        = string
}
variable "cluster1_worker2_public_ip" {
  type        = string
}
variable "cluster1_worker2_internal_ip" {
  type        = string
}

variable "cluster2_master_public_ip" {
  type        = string
}

variable "cluster2_master_internal_ip" {
  type        = string
}
variable "cluster2_worker1_public_ip" {
  type        = string
}
variable "cluster2_worker1_internal_ip" {
  type        = string
}

variable "cluster3_master_public_ip" {
  type        = string
}

variable "cluster3_master_internal_ip" {
  type        = string
}
variable "cluster3_worker1_public_ip" {
  type        = string
}
variable "cluster3_worker1_internal_ip" {
  type        = string
}
