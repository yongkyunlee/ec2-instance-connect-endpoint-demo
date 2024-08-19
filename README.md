# ec2-instance-connect-endpoint-demo

This repository contains demo code for blog post

## eic-endpoint-setup-tf

This terraform script creates several resources for the demo:

1. IAM for EIC Endpoint admin role. It is used to create policy and resources needed for EIC Endpoint admin to create EIC Endpoint.
1. IAM for EIC Endpoint user role. It is used to create policy needed for EIC Endpoint user to connect to EIC Endpoint.

This Terraform is not needed if we can use AWS Admin Role.

### Steps

1. Go to `./eic-endpoint-setup-tf` directory.
1. Update placeholders in `terraform.tfvars` and `provider.tf`.
1. Assume admin role.
1. Run `terraform init`.
1. Run `terraform apply`.
1. Attach the policy to roles or user groups to be used.

## ec-endpoint-tf

This terraform script creates three resources:

1. Security group for EC2 Instance Connect Endpoint.
1. Security group for the instance that you want to ssh into.
1. EC2 Instance Connect Endpoint.

### Steps

1. Go to `./eic-endpoint-tf` directory.
1. Update placeholders in `terraform.tfvars` and `provider.tf`.
1. Assume role or user group with `eic_endpoint_admin_iam_policy` policy attached.
1. Run `terraform init`.
1. Run `terraform apply`.

## Connecting to EC2 Instance

### Steps

1. Add security group `eic_endpoint_target_sg` to the instance to connect to.
1. Get Instance ID.
1. Run `aws ec2-instance-connect ssh --instance-id <INSTANCE_ID> --region <AWS_REGION>`.

## Reference

- https://aws.amazon.com/blogs/compute/secure-connectivity-from-public-to-private-introducing-ec2-instance-connect-endpoint-june-13-2023/.
