# Terraform Infrastructure

This folder contains Terraform configuration files used to provision AWS infrastructure.

## Resources Created

* AWS VPC
* Subnets
* Security Groups
* EC2 or Kubernetes infrastructure
* Networking configuration

## Files

provider.tf → AWS provider configuration
main.tf → Infrastructure resources
variables.tf → Input variables
outputs.tf → Infrastructure outputs
terraform.tfvars → Variable values

## Usage

Initialize Terraform:

terraform init

Preview infrastructure:

terraform plan

Create infrastructure:

terraform apply

Destroy infrastructure:

terraform destroy

Terraform automates cloud infrastructure creation without manual AWS console setup.


