# Task 5 - Find and Fix the Bug

I found two issues in the given Terraform configuration.

## Issue 1 - Incorrect Trust Policy Principal

The original trust policy was using:

arn:aws:iam::000000000000:user/roleB

But roleB is an IAM role, not an IAM user.

Because of this, the principal ARN was incorrect. I changed it to:

arn:aws:iam::000000000000:role/roleB

Now roleC trusts the correct IAM role from Account A.

## Issue 2 - S3 Permissions Too Broad

The original policy was using:

Action   = "s3:*"
Resource = "*"

This gives roleC full S3 permissions across all buckets in the account.

It is not a least-privilege policy and gives more access than required.

I changed the permissions to allow only the required actions on one specific S3 bucket.

I also seperated bucket-level and object-level permissions:

- ListBucket and GetBucketLocation use the bucket ARN.
- GetObject, PutObject and DeleteObject use the object ARN.

## Final Result

roleB from Account A can assume roleC in Account B.

After assuming roleC, it can perform the permitted S3 operations only on the configured bucket.

## Validation

I used the following commands:

- terraform fmt
- terraform init
- terraform validate
- terraform plan
