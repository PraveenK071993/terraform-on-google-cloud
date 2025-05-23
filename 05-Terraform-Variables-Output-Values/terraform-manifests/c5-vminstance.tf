# Compute Instance with startup script
resource "google_compute_instance" "myapp1" {
  name         = "myapp1"
  machine_type = var.machine_type
  zone         = "us-central1-a"

  tags = ["ssh-tag", "webserver-tag"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  metadata = {
  startup-script = <<-EOT
    #!/bin/bash -xe

    exec > /var/log/startup-script.log 2>&1

    apt update -y
    DEBIAN_FRONTEND=noninteractive apt install -y telnet nginx

    systemctl enable nginx
    systemctl start nginx

    mkdir -p /var/www/html/app1
    chmod -R 755 /var/www/html

    HOSTNAME=$(hostname)
    IP_ADDRESS=$(hostname -I)

    cat <<EOF > /var/www/html/app1/index.html
    <!DOCTYPE html>
    <html>
    <body style='background-color:rgb(250, 210, 210);'>
    <h1>Welcome to StackSimplify - WebVM App1</h1>
    <p><strong>VM Hostname:</strong> \$HOSTNAME</p>
    <p><strong>VM IP Address:</strong> \$IP_ADDRESS</p>
    <p><strong>Application Version:</strong> V1</p>
    <p>Google Cloud Platform - Demos</p>
    </body>
    </html>
    EOF

    cp /var/www/html/app1/index.html /var/www/html/index.html
  EOT
}

  network_interface {
    subnetwork   = google_compute_subnetwork.mysubnet.id
    access_config {}
  }
}