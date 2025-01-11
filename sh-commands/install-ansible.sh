#!/bin/bash

# Script to install Ansible on Ubuntu

# Update package list
echo "Updating package list..."
sudo apt update -y

# Install Ansible
echo "Installing Ansible..."
sudo apt install ansible -y

# Verify installation
echo "Checking Ansible version..."
ansible --version

echo "Ansible installation completed successfully!"
