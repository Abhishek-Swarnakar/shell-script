#!bin/bash

#############################################################################################
#               SHELL SCRIPT TO FETCH AWS RESOURCES DETAILS
#############################################################################################
# RESOURCES:
# EC2
# S3
# AWS Lambda
# AWS IAM
##############################################################################################
# Author: Abhishek Swarnakar
# Date: 07-11-24
# Version: V1
##############################################################################################

set -e 
set -o pipefail

echo "Fetching EC2 Details"

aws ec2 describe-details | jq '.Reservations[].Instances[] |{InstanceId: .InstanceID, InstanceType: .InstanceType}'

echo "Fetching S3 details"

aws s3 ls

echo "Fetching Lambda details"

aws lambda list-functions

echo "Fetching IAM details"

aws iam list-users


