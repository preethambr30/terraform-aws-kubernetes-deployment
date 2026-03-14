# Setup Guide

## Overview

This guide explains how to set up and deploy the **Terraform AWS Kubernetes Deployment** project from scratch.

The project provisions AWS infrastructure using Terraform and deploys a containerized application to a Kubernetes cluster.

---

## Prerequisites

Before starting, ensure the following tools are installed:

* Git
* Docker
* Terraform
* AWS CLI
* kubectl

---

## 1. Clone the Repository

Clone the project repository:

```
git clone https://github.com/preethambr30/terraform-aws-kubernetes-deployment.git
```

Navigate into the project:

```
cd terraform-aws-kubernetes-deployment
```

---

## 2. Configure AWS Credentials

Configure AWS CLI credentials:

```
aws configure
```

Provide:

```
AWS Access Key ID
AWS Secret Access Key
Region: ap-south-1
Output format: json
```

---

## 3. Provision Infrastructure with Terraform

Navigate to the Terraform folder:

```
cd terraform
```

Initialize Terraform:

```
terraform init
```

Check the infrastructure plan:

```
terraform plan
```

Apply the infrastructure:

```
terraform apply
```

Terraform will create:

* VPC
* Subnets
* Internet Gateway
* Security Groups
* EC2 Instances
* Application Load Balancer
* S3 bucket for Terraform state

---

## 4. Connect to Kubernetes Node

After Terraform finishes, connect to the first EC2 instance:

```
ssh -i <your-key>.pem ubuntu@<node1-ip>
```

---

## 5. Deploy Kubernetes Application

Navigate to the Kubernetes manifests folder:

```
cd terraform-aws-kubernetes-deployment/kubernetes
```

Deploy the application:

```
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl apply -f ingress.yaml
```

Verify pods:

```
kubectl get pods
```

---

## 6. Access the Application

Open the application using the Load Balancer DNS:

```
http://<ALB-DNS>
```

The **DevOps Dashboard application** should now be accessible.

---

## Project Workflow

```
Application Code
      ↓
Docker Image
      ↓
Docker Hub
      ↓
Terraform Infrastructure
      ↓
AWS Kubernetes Cluster
      ↓
Kubernetes Deployment
      ↓
Application Load Balancer
      ↓
User Access
```
