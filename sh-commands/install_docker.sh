#!/bin/bash

# Update package list and install dependencies
echo "Updating package list..."
sudo apt-get update -y

echo "Installing dependencies..."
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y

# Add Docker's official GPG key
echo "Adding Docker's GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Set up the Docker stable repository
echo "Setting up Docker stable repository..."
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update the package list again after adding the Docker repository
echo "Updating package list again..."
sudo apt-get update -y

# Install Docker
echo "Installing Docker..."
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

#  OR
# sudo apt update
# sudo apt install docker.io -y

# Verify Docker installation
echo "Verifying Docker installation..."
sudo systemctl status docker

# Start Docker and enable it to run at startup
echo "Starting Docker..."
sudo systemctl start docker
sudo systemctl enable docker

# Add user to Docker group (optional but recommended for running Docker commands without sudo)
echo "Adding user to Docker group..."
sudo usermod -aG docker $USER

echo "Docker installation completed successfully!"
