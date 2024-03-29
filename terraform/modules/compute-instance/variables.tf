variable "gcp_region" {
  type        = string
  description = "GCP region"
}

variable "gcp_project" {
  type        = string
  description = "GCP project name"
}

variable "instance_name" {
  type        = string
  description = "Name of the compute instance"
}

variable "machine_type" {
  type        = string
  description = "Machine type of compute instances"
 # default     = "e2-standard-2"
}

variable "instance_image" {
  type        = string
  description = "Instance OS image to boot from"
#  default     = "ubuntu-2010-groovy-v20210211a"
}
variable "min_cpu_platform" {
  type        = string
  default     = ""
}
variable "subnet_id" {
  type        = string
  description = "ID of the subnet to attach to"
}

variable "preemptible" {
  type        = string
  description = "Select whether or not to provision reduced cost preemptible vm's"
#  default = true #Change to false when doing final tests
  default = false
}
//variable "external_disk" {
//  type        = string
//  description = "ID of external disk to attach"
//}
//variable "external_disk_mode" {
//  type        = string
//  description = "Read/write or read/only access to external disk"
// # default = "READ_ONLY" #READ_WRITE FOR MASTERS
//}
//
//variable "external_disk_device_name" {
//  type        = string
//  description = "Device name of the external disk, to go in /dev/by-id/"
//  default = "ext"
//}
variable "internal_ip" {
  type        = string
  description = "Private IP address of the instance"
  default = "" #Empty means auto-assignment
}

variable "instance_zone" {
  type        = string
  description = "The zone of the instance"
}

variable "ssh_user" {
  type        = string
  description = "username of the SSH account"
  default = "k8s"
}


variable "ssh_pubkey" {
  type        = string
  description = "the public key of the SSH account, in ssh-rsa format"
}