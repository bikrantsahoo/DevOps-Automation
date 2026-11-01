# Task 4 - IAM Policy for CI/CD

## Implementation

In this task I have created a custom IAM policy for the CI user.

The policy provides the permissions required for a CI/CD pipeline to push Docker images to ECR and deploy the application using ECS.

## Permissions Included

The policy allows:

- Getting ECR authorization tokens.
- Pushing images to a specific ECR repository.
- Registering and describing ECS task definitions.
- Updating and describing a specific ECS service.
- Passing only the required ECS task and execution roles.
- Listing a specific S3 bucket and downloading its objects.

## Least Privilege

I have restricted permissions to specific ECR repositories, ECS services, S3 buckets and IAM roles wherever possible.

The policy does not provide full administrator access.

For iam:PassRole, I have also restricted the permission to roles that can be passed to the ECS tasks service.

## Policy Attachment

I have created the IAM policy using the JSON policy document and attached it to the ci IAM user.

## Validation

I used below commands to check the Terraform configuration:

- terraform init
- terraform fmt
- terraform validate
- terraform plan
