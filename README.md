# DevOps-Automation

This repository contains my hands-on work for a DevOps and Terraform assignment. I have seperated each task into its own folder so it is easier to understand and maintain.

## Tasks Covered

### Task 1 - EC2 Provisioning
- Created 5 EC2 instances using Terraform `for_each`.
- Configured different instance types and EBS volumes.
- Added common tags to all instances.
- Used `prevent_destroy` to protect an important instance.
- Added outputs for instance IDs and private IPs.

### Task 2 - Terraform Remote State
- Created an S3 bucket to store Terraform state.
- Enabled bucket versioning and encryption.
- Blocked public access.
- Created a DynamoDB table for state locking.

### Task 3 - Cross-Account IAM
- Created IAM users and groups in Account A.
- Configured IAM roles for cross-account access.
- Set up role assumption between Account A and Account B.
- Restricted S3 access through role permissions.

### Task 4 - IAM Policy
- Created a custom IAM policy for CI/CD.
- Added permissions for ECR and ECS operations.
- Configured limited S3 access.
- Restricted `iam:PassRole` to specific ECS roles.

### Task 5 - Find and Fix the Bug
- Fixed the incorrect IAM principal ARN in the role trust policy.
- Corrected the overly broad S3 permissions.
- Restricted access to a specific bucket and its objects.

## Tools Used

- Terraform
- AWS
- IAM
- Amazon EC2
- Amazon S3
- DynamoDB
- Amazon ECR
- Amazon ECS
- Git and GitHub

## Repository Structure

```text
DevOps-Automation/
│
├── task-1-ec2-provisioning/
├── task-2-remote-state/
├── task-3-cross-account-iam/
│   ├── account-a/
│   └── account-b/
├── task-4-iam-policy/
└── task-5-bug-fixing/
```

Each task folder contains the Terraform configuration and a `NOTES.md` file explaining the implementation.

## Running the Terraform Configuration

Go inside the required task folder and run:

```bash
terraform init
terraform fmt
terraform validate
terraform plan
```

For Task 3, run the commands separately inside `account-a` and `account-b`.

Review the plan and AWS account configuration before applying any changes.

## Note

Some values like AMI IDs, subnet IDs, security group IDs, account IDs and bucket names are provided as placeholders or configurable inputs. Update them according to your AWS environment before running the configurations.

This repository is part of my learning and hands-on practice with Terraform and AWS DevOps concepts.
