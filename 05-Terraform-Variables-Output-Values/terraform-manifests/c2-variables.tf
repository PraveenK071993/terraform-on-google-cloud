# Input Variables
# GCP Project
variable "gcp_project1" {
  description = "Project in which GCP resources to be created"
  type = string
  default = "silver-fiber-457005-b8"
  
}

# GCP Region
variable "gcp_region1" {
  description = "Region in which gcp resources to be created"
  type = string
  default = "us-central1"
  
}

# GCP Compute Engine Machine Type
variable "machine_type" {
  description = "Compute engine machine type"
  type = string
  default = "e2-micro"

}