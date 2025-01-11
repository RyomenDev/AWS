#!/bin/bash

# Update the package list
echo "Updating package list..."
sudo apt update -y

# Install Git
echo "Installing Git..."
sudo apt install git -y

# Verify Git installation
echo "Verifying Git installation..."
git --version

# Configure Git (Optional: Replace with your name and email)
echo "Configuring Git..."
git config --global user.name "Your Name"
git config --global user.email "your-email@example.com"

# Display the current Git configuration
echo "Git configuration:"
git config --list

echo "Git installation and configuration completed successfully."
