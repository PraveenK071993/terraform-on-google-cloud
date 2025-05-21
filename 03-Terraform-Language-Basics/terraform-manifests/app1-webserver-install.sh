#!/bin/bash
# Update system packages
sudo apt update

# Install telnet and nginx
sudo apt install -y telnet nginx

# Enable and start nginx
sudo systemctl enable nginx
sudo systemctl start nginx

# Set permissions
sudo chmod -R 755 /var/www/html
sudo mkdir -p /var/www/html/app1

# Get hostname and IP
HOSTNAME=$(hostname)
IP_ADDRESS=$(hostname -I | awk '{print $1}')

# Create custom index.html
HTML_CONTENT="<!DOCTYPE html>
<html>
<body style='background-color:rgb(250, 210, 210);'>
<h1>Welcome to StackSimplify - WebVM App1</h1>
<p><strong>VM Hostname:</strong> $HOSTNAME</p>
<p><strong>VM IP Address:</strong> $IP_ADDRESS</p>
<p><strong>Application Version:</strong> V1</p>
<p>Google Cloud Platform - Demos</p>
</body>
</html>"

# Write HTML content
echo "$HTML_CONTENT" | sudo tee /var/www/html/index.html
echo "$HTML_CONTENT" | sudo tee /var/www/html/app1/index.html
