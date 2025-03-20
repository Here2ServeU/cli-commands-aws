# AWS CLI Commands Script for Various AWS Services

# ============================
# Amazon S3 (Simple Storage Service)
# ============================
aws s3 mb s3://my-bucket-name                      # Create a bucket
aws s3 ls                                          # List all buckets
aws s3 rb s3://my-bucket-name                      # Delete an empty bucket
aws s3 rm s3://my-bucket-name --recursive         # Delete a bucket and all objects inside

aws s3 cp file.txt s3://my-bucket-name/           # Upload a file
aws s3 sync . s3://my-bucket-name/                 # Sync local directory to S3
aws s3 rm s3://my-bucket-name/file.txt             # Delete a file from S3
aws s3 rm s3://my-bucket-name/ --recursive        # Delete all files in a bucket

# ============================
# Amazon EC2 (Elastic Compute Cloud)
# ============================
aws ec2 run-instances --image-id ami-xxxxx --count 1 --instance-type t2.micro --key-name my-key-pair  # Launch instance
aws ec2 describe-instances                                      # List running instances
aws ec2 terminate-instances --instance-ids i-xxxxx              # Terminate an instance
aws ec2 stop-instances --instance-ids i-xxxxx                   # Stop an instance
aws ec2 start-instances --instance-ids i-xxxxx                  # Start an instance
aws ec2 reboot-instances --instance-ids i-xxxxx                 # Reboot an instance

aws ec2 describe-security-groups                              # List security groups
aws ec2 delete-security-group --group-id sg-xxxxx            # Delete a security group

# ============================
# Networking (VPC, Subnets, Route Tables, Security Groups)
# ============================
aws ec2 create-vpc --cidr-block 10.0.0.0/16                  # Create a VPC
aws ec2 describe-vpcs                                       # List VPCs
aws ec2 delete-vpc --vpc-id vpc-xxxxx                       # Delete a VPC

aws ec2 create-subnet --vpc-id vpc-xxxxx --cidr-block 10.0.1.0/24  # Create a subnet
aws ec2 delete-subnet --subnet-id subnet-xxxxx                    # Delete a subnet

aws ec2 create-internet-gateway                                  # Create an Internet Gateway
aws ec2 delete-internet-gateway --internet-gateway-id igw-xxxxx  # Delete an Internet Gateway

aws ec2 create-route-table --vpc-id vpc-xxxxx                     # Create a route table
aws ec2 delete-route-table --route-table-id rtb-xxxxx             # Delete a route table

# ============================
# Amazon ECS (Elastic Container Service)
# ============================
aws ecs create-cluster --cluster-name my-cluster              # Create a cluster
aws ecs list-clusters                                        # List clusters
aws ecs delete-cluster --cluster my-cluster                  # Delete a cluster

aws ecs list-tasks --cluster my-cluster                      # List running tasks
aws ecs stop-task --cluster my-cluster --task task-id        # Stop a running task

aws ecs update-service --cluster emmanuel-app-cluster --service node-frontend-service --task-definition flask-backend-task:2 --force-new-deployment --region us-east-1
aws ecs update-service --cluster emmanuel-app-cluster --service node-frontend-service --task-definition flask-backend-task:2 --force-new-deployment --region us-east-1

aws ecs update-service --cluster emmanuel-app-cluster --service node-frontend-service --desired-count 0 --region us-east-1
aws ecs update-service --cluster emmanuel-app-cluster --service node-frontend-service --desired-count 1 --region us-east-1

# ============================
# Amazon EKS (Elastic Kubernetes Service)
# ============================
aws eks create-cluster --name my-cluster --role-arn arn:aws:iam::xxxx:role/my-role --resources-vpc-config subnetIds=subnet-xxxx,securityGroupIds=sg-xxxx
aws eks list-clusters                                         # List clusters
aws eks delete-cluster --name my-cluster                     # Delete a cluster

# ============================
# Monitoring (CloudWatch, CloudTrail, X-Ray)
# ============================
aws cloudwatch list-metrics                                   # List available metrics
aws cloudwatch delete-alarms --alarm-names my-alarm          # Delete an alarm

aws cloudtrail create-trail --name my-trail --s3-bucket-name my-logs-bucket
aws cloudtrail describe-trails                               # List trails
aws cloudtrail delete-trail --name my-trail                 # Delete a trail

# ============================
# Amazon DynamoDB
# ============================
aws dynamodb create-table --table-name my-table --attribute-definitions AttributeName=id,
