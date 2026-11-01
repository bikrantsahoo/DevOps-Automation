# Task 2 - Terraform Remote State

## Implementation

In this task I have created the S3 bucket and DynamoDB table required for Terraform remote state.

The S3 bucket is used to store the Terraform state file, so the state can be shared between team members instead of keeping it only on a local machine.

I have enabled the below settings on the S3 bucket:
- Versioning to keep previous versions of the state file.
- Server-side encryption using AES256.
- Public access block to prevent public access.

## State Locking

I have created a DynamoDB table to handle state locking.

When multiple users try to run Terraform at the same time, the lock helps prevent them from modifying the state file simultaneously.

The table uses LockID as the partition keys.

## Variables and Outputs

I have kept the AWS region, S3 bucket name and DynamoDB table name configurable through variables.

The outputs display:
- S3 bucket name
- DynamoDB table name
- S3 bucket ARN

## Validation

I used below commands to check the configuration:

- terraform init
- terraform fmt
- terraform validate
- terraform plan
