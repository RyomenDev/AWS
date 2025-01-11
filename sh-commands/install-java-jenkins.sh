#!/bin/bash

# Update the system packages
echo "Updating package lists..."
sudo apt update -y

# Install OpenJDK 11 (required for Jenkins)
echo "Installing Java (OpenJDK 11)..."
# sudo apt install -y openjdk-11-jdk
# sudo apt update
sudo apt install openjdk-17-jdk -y

# java version
java -version

# Install required utilities
echo "Installing required utilities (curl, gnupg, software-properties-common)..."
sudo apt-get install -y curl gnupg software-properties-common

# Add Jenkins GPG key
echo "Adding Jenkins GPG key..."
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

# Add Jenkins APT repository
echo "Adding Jenkins APT repository..."
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian/ binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update the system package index
echo "Updating system package index..."
sudo apt-get update -y

# Install Jenkins
echo "Installing Jenkins..."
sudo apt-get install -y jenkins

# Start Jenkins service
echo "Starting Jenkins service..."
sudo systemctl start jenkins

# Enable Jenkins to start on boot
echo "Enabling Jenkins to start on boot..."
sudo systemctl enable jenkins

# Display Jenkins service status
echo "Checking Jenkins service status..."
sudo systemctl status jenkins --no-pager

# Display Jenkins initial admin password
echo "Jenkins has been installed successfully. Use the following password to unlock Jenkins:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

# Output Jenkins access information
echo "Access Jenkins at: http://<YOUR_EC2_PUBLIC_IP>:8080"
echo "Replace <YOUR_EC2_PUBLIC_IP> with your EC2 instance's public IP address."
