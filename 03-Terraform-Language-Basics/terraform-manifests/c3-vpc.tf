# Resource: VPC
resource "google_compute_network" "myvpc" {
  name = "VVPPCC"
  auto_create_subnetworks = false
}

# Resource: Subnet
resource "google_compute_subnetwork" "mysbnet" {
  name = "mysubnet1"
  region = "us-central1"
  ip_cidr_range = "10.128.0.0/20"
  network = google_compute_network.myvpc.id
}