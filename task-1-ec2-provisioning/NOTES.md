# Task 1 - Multi Instance EC2 Provisioning

## Implementation

In this task I have used terraform to create 5 EC2 instances.

Instead of creating 5 seperate resource blocks, I used for_each so all the instances can be created using one input variable called instances.

Each instance have different configuration:
- Different instance type
- Different key pair
- Different root volume type
- Different root volume size

I have used io1 storage for database-server to meet the IOPS requirement.

All the EC2 instances have below tags:
- Name
- Environment
- Owner

## Lifecycle Protection

I selected database-server for prevent_destroy because it is an important machine and accidental deletion can cause downtime or data loss.

One thing I noticed is that lifecycle argument cannot be configured dynamically using variables in Terraform.

To handle this, I divided the instances map into two parts using locals:
- Protected instances
- Normal instances

Both resource blocks are using the same input variable with for_each.

## Outputs

I have configured two outputs:

1. Instance name mapped to EC2 instance ID.
2. Instance name mapped to private IP address.

## Validation

I used below commands to check the configuration:

- terraform init
- terraform fmt
- terraform validate
- terraform plan
