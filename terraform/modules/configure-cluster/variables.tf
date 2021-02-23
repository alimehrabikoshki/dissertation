
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
  description = "The internal IP of the current cluster master"
}

variable "cluster_worker1_ip" {
  type        = string
  description = "The internal IP of worker 1"
}

variable "cluster_worker2_ip" {
  type        = string
  description = "The internal IP of worker 2"
}
variable "k8s_ssh_private_key" {
  type        = string
  description = "k8s user private key"
}

variable "cni_playbook_path" {
  type        = string
  description = "relative path to CNI playbook(s) (FROM CONFIGURE-CLUSTER DIRECTORY)"
}

