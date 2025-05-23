# Firewall Rules
resource "google_compute_firewall" "fw_ssh" {
  name    = "allow-ssh"
  network = google_compute_network.myvpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh-tag"]
}

resource "google_compute_firewall" "fw_http" {
  name    = "allow-http"
  network = google_compute_network.myvpc.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["webserver-tag"]
}
