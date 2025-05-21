# Resource Block: Create a single Compute Engine instance
resource "google_compute_instance" "myapp1" {
  name = "myapp1"
  machine_type = "e2-micro"
  zone = "us-central1-a"
  #tags = ["ssh-tag","webserver-tag"]
  tags = [tolist(google_compute_firewall.fw_ssh.target_tags)[0],tolist(google_compute_firewall.fw_http.target_tags)[0]]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
    
  }
  #install webserver
  metadata_startup_script = file("${path.module}/app1-webserver-install.sh")
  network_interface {
    subnetwork = google_compute_subnetwork.mysbnet.id
    access_config {
      // Ephemeral public IP
    }
  }
}
