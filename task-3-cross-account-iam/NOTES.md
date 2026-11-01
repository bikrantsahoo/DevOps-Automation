# Task 3 - Cross Account IAMs

## Implementation

In this task I have configured IAM users, groups and roles across two AWS accounts.

### Account A

I have created two IAM groups:
- group1
- group2

I have created four IAM users:
- engine
- ci
- alex.admin
- sam.ops

The users are assigned to their respective groups.

I have also created two IAM roles:

- **roleA:** Allows AWS actions except IAM actions.
- **roleB:** Allows only the sts:AssumeRole action for roleC in Account B.

### Account B

I have created roleC with a trust relationship that allows only roleB from Account A to assume it.

RoleC has access to a specific S3 bucket. The permissions include listing the bucket and reading, uploading and deleting objects.

## Cross-Account Access

The access flow is:

1. A user or process in Account A assumes roleB.
2. roleB assumes roleC in Account B.
3. roleC provides access to the permitted S3 bucket.

This avoids sharing long-lived AWS access keys between accounts.

## Security Considerations

- Account IDs are restricted in the provider configuration.
- Role trust policies use specific account and role ARNs.
- S3 permissions are limited to the configured bucket.
- No permanent access keys are stored in the Terraform configuration.

For production use, user credentials and console access should be provisioned through an approved identity-management process.

## Validation

I used below commands to check the Terraform configuration:

- terraform init
- terraform fmt
- terraform validate
- terraform plan
