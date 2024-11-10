#!/bin/bash
######################################################################################################################################################
#               SHELL SCRIPT TO GET DETAILS OF AWS SERVICES, ALSO TO INSTALL DEPENDENCIES LIKE INSTALLATION OF CLI, AWS CONFIGURATION IF NOT PRESENT
######################################################################################################################################################
# AWS SERVICES DETAILS CAN BE FETCHED:
# EC2
# S3
# Lambda
# IAM
######################################################################################################################################################
# Author: Abhishek Swarnakar
# Date : 10-11-24
# Version: V1
######################################################################################################################################################
# Usage: ./script-name.sh <service_name> <Region>
# Example : ./test.sh us-east-1 S3
######################################################################################################################################################


aws_region=$1
aws_service=$2

# Check if the required number of arguments are passed   

if [ $# -ne 2]; then
    echo "USAGE: $0 <region> <service_name>"
    exit 1
fi

# Check if AWS CLI is installed

if ! command -v aws &> /dev/null; then
    echo "AWS CLI not found. Installing it now..."

    sudo apt update
    sudo apt install unzip
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install

    if command -v aws &> /dev/null; then
        echo "AWS CLI installed successfully."
        aws --version
    else
        echo "Failed to install AWS CLI."
    fi
else
    echo "AWS CLI is already installed."
    aws --version
fi

# Check if AWS configuration is present.

if [ ! -d ~/.aws ]; then
    echo "AWS CLI is not configured...Configuring now!!"
    aws configure
else
    echo "AWS CLI is configured already!!"
fi

# Execute the command based on aws service

case $2 in
    EC2)
        aws ec2 describe-instances --region $1 --query 'Reservations[*].Instances[*].[InstanceId,State.Name]' --
        ;;

    S3)
        aws s3 ls --region $1 
        ;;

    Lambda)
        aws lambda list-functions --region $1
        ;;

    IAM)
        aws iam list-users --region $1
        ;;

    *)
        echo "Invalid option. Please choose from EC2, S3, Lambda, or IAM."
        exit 1
esac
