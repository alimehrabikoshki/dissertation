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

variable "bucket-name" { 
  type        = string 
  description = "Name of GCS bucket to create" 
} 

variable "storage-class" { 
  type        = string 
  description = "The storage class of GCS bucket to create" 
} 

variable "cidr_range" {
  type        = string
  description = "The subnet CIDR range"
  default     = "10.10.10.0/24"
}
