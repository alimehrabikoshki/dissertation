variable "gcp_region" { 
  type        = string 
  description = "GCP region" 
} 

variable "gcp_project" { 
  type        = string 
  description = "GCP project name" 
} 

variable "gcp_auth_file" { 
  type        = string 
  description = "GCP authentication file" 
} 

variable "bucket-name" { 
  type        = string 
  description = "Name of GCS bucket to create" 
} 

variable "storage-class" { 
  type        = string 
  description = "The storage class of GCS bucket to create" 
} 
