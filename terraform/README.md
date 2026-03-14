# Terraform Infrastructure

## Overview

This directory contains the Terraform configuration used to provision the AWS infrastructure required for the DevOps Dashboard project.

Terraform is used as an **Infrastructure as Code (IaC)** tool to automate the creation of cloud resources including networking, compute instances, load balancing, and remote state storage.

The infrastructure supports a Kubernetes cluster where the application container is deployed.

---

## Infrastructure Components

The Terraform configuration provisions the following AWS resources:

### VPC

Creates an isolated Virtual Private Cloud for the project infrastructure.

### Subnets

Two public subnets are created to host the Kubernetes nodes.

### Internet Gateway

Allows resources in the VPC to communicate with the internet.

### Route Tables

Routes internet traffic through the Internet Gateway.

### Security Groups

Defines inbound and outbound rules for EC2 instances and load balancer access.

### EC2 Instances

Two EC2 instances are created which act as Kubernetes nodes running the k3s cluster.

### Application Load Balancer

Handles incoming traffic and distributes requests to the Kubernetes nodes.

### S3 Bucket

Stores Terraform remote state for infrastructure management.

---

## Folder Structure

```text id="q1g3th"
terraform/
├── backend.tf
├── provider.tf
├── variables.tf
├── terraform.tfvars
├── vpc.tf
├── networking.tf
├── security.tf
├── ec2.tf
├── loadbalancer.tf
├── s3.tf
├── outputs.tf
└── userdata.sh
```

---

## Prerequisites

Before running Terraform, install the following tools:

* Terraform
* AWS CLI
* Git

AWS credentials must be configured using:

```id="3ofgux"
aws configure
```

---

## Initialize Terraform

Navigate to the terraform directory:

```id="ekdb82"
cd terraform
```

Initialize Terraform:

```id="r1rt7p"
terraform init
```

This downloads the AWS provider and initializes the remote backend.

---

## Review Infrastructure Plan

Run the following command to preview the resources Terraform will create:

```id="dm8wck"
terraform plan
```

---

## Deploy Infrastructure

Apply the configuration:

```id="m8gsk7"
terraform apply
```

Terraform will create the AWS infrastructure required for the Kubernetes cluster.

---

## Outputs

After successful deployment, Terraform outputs important information such as:

* Public IP addresses of EC2 instances
* Application Load Balancer DNS

Example output:

```id="h61nqf"
node1_ip = <public-ip>
node2_ip = <public-ip>
alb_dns  = <load-balancer-dns>
```

These values are used to connect to the Kubernetes cluster and access the deployed application.

---

## Infrastructure Workflow

```id="7jnght"
Terraform Configuration
        ↓
AWS Provider
        ↓
Provision Infrastructure
        ↓
VPC + Subnets
        ↓
EC2 Instances (Kubernetes Nodes)
        ↓
Application Load Balancer
        ↓
Kubernetes Deployment
        ↓
Application Accessible via Browser
```

---

## Cleanup

To destroy all infrastructure created by Terraform:

```id="v09z4q"
terraform destroy
```

This removes all AWS resources associated with the project.



