#!/bin/bash

echo "Executing common AWS CLI commands..."

# Set AWS region (update this as needed)
AWS_REGION="us-east-1"

# 1. List all S3 buckets
echo "Listing all S3 buckets..."
aws s3 ls --region $AWS_REGION

# 2. Create a new S3 bucket (replace 'your-bucket-name' with a unique name)
echo "Creating a new S3 bucket..."
BUCKET_NAME="your-bucket-name"
aws s3 mb s3://$BUCKET_NAME --region $AWS_REGION

# 3. List EC2 instances
echo "Listing all EC2 instances..."
aws ec2 describe-instances --region $AWS_REGION --query "Reservations[*].Instances[*].{ID:InstanceId,State:State.Name}" --output table

# 4. Start an EC2 instance (replace 'instance-id' with your instance ID)
INSTANCE_ID="your-instance-id"
echo "Starting EC2 instance $INSTANCE_ID..."
aws ec2 start-instances --instance-ids $INSTANCE_ID --region $AWS_REGION

# 5. Stop an EC2 instance
echo "Stopping EC2 instance $INSTANCE_ID..."
aws ec2 stop-instances --instance-ids $INSTANCE_ID --region $AWS_REGION

# 6. List all IAM users
echo "Listing all IAM users..."
aws iam list-users --query "Users[*].{UserName:UserName,CreateDate:CreateDate}" --output table

# 7. Retrieve the list of regions
echo "Fetching list of AWS regions..."
aws ec2 describe-regions --query "Regions[*].{Name:RegionName}" --output table

# 8. Describe all running RDS instances
echo "Describing all running RDS instances..."
aws rds describe-db-instances --query "DBInstances[*].{DBInstance:DBInstanceIdentifier,Status:DBInstanceStatus}" --output table

# 9. Get the current account details
echo "Fetching current AWS account details..."
aws sts get-caller-identity

# 10. Upload a file to an S3 bucket (replace 'file-path' and 'bucket-name')
FILE_PATH="path/to/your/file"
echo "Uploading $FILE_PATH to $BUCKET_NAME..."
aws s3 cp $FILE_PATH s3://$BUCKET_NAME --region $AWS_REGION

echo "AWS CLI commands executed successfully."
