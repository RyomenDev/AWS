#!/bin/bash

# Update package list and install necessary tools
echo "Updating system packages..."
sudo yum update -y || sudo apt update -y

# Install unzip if not already installed
echo "Installing unzip..."
sudo yum install -y unzip || sudo apt install -y unzip

# Download AWS CLI version 2
echo "Downloading AWS CLI..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Unzip the AWS CLI installer
echo "Unzipping AWS CLI installer..."
unzip awscliv2.zip

# Run the AWS CLI installer
echo "Installing AWS CLI..."
sudo ./aws/install

# Check the installed AWS CLI version
echo "Checking AWS CLI version..."
aws --version

# Cleanup
echo "Cleaning up installation files..."
rm -rf awscliv2.zip aws

echo "AWS CLI installation complete."
