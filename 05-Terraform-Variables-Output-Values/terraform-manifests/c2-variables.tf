# Input Variables
variable "gcp_project1" {
  description = "GCP Project ID"
  type        = string
  default     = "silver-fiber-457005-b8"
}

variable "gcp_region1" {
  description = "GCP Region"
  type        = string
  default     = "us-east1"
}

variable "machine_type" {
  description = "GCE Machine Type"
  type        = string
  default     = "e2-micro"
}