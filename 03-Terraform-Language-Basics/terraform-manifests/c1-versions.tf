# Terraform Settings Block
terraform {
  required_version = "~> 1.12.0"
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~> 6.36.0"
    }
  }
}

# Terraform Provider Block
provider "google" {
  project = "silver-fiber-457005-b8" #PROJECT_ID
  region = "us-central1"
}

