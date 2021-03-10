
/*
Each playbook run has:
playbook
Master IP
Worker IPs
private key
target host
*/


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


variable "cni_playbook_path" {
  type        = string
  description = "relative path to CNI playbook(s) (FROM CONFIGURE-CLUSTER DIRECTORY)"
}

variable "initialise_nodes_playbook_path" {
  type        = string
  description = "absolute path to node init playbook"
  default = "/mnt/c/Users/Ali/PycharmProjects/dissertation/ansible/modules/k8s_nodes/all/initialise_k8s_node.yaml"
}


variable "initialise_master_playbook_path" {
  type        = string
  description = "absolute path to master init playbook"
  default = "/mnt/c/Users/Ali/PycharmProjects/dissertation/ansible/modules/k8s_nodes/masters/initialise_k8s_master.yaml"
}

variable "initialise_worker_playbook_path" {
  type        = string
  description = "absolute path to master init playbook"
  default = "/mnt/c/Users/Ali/PycharmProjects/dissertation/ansible/modules/k8s_nodes/workers/initialise_k8s_worker.yaml"
}