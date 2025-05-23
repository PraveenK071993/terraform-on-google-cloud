#!/bin/bash

# Update & install packages
sudo apt update -y
sudo apt install -y telnet nginx

# Enable and start nginx
sudo systemctl enable nginx
sudo systemctl start nginx

# Prepare HTML directories
sudo mkdir -p /var/www/html/app1
sudo chmod -R 755 /var/www/html

# Generate content
HOSTNAME=$(hostname)
IP_ADDRESS=$(hostname -I)

cat <<EOF | sudo tee /var/www/html/app1/index.html
<!DOCTYPE html>
<html>
  <body style='background-color:rgb(250, 210, 210);'>
    <h1>Welcome to StackSimplify - WebVM App1</h1>
    <p><strong>VM Hostname:</strong> $HOSTNAME</p>
    <p><strong>VM IP Address:</strong> $IP_ADDRESS</p>
    <p><strong>Application Version:</strong> V1</p>
    <p>Google Cloud Platform - Demos</p>
  </body>
</html>
EOF

# Copy to root web directory
sudo cp /var/www/html/app1/index.html /var/www/html/index.html