# Project Architecture

## Overview

This project demonstrates a complete DevOps workflow where infrastructure and application deployment are automated using modern cloud-native tools.

The infrastructure is provisioned using Terraform and deployed on AWS.
A Kubernetes cluster is created on EC2 instances, and a containerized web application is deployed using Kubernetes manifests.

---

## Architecture Diagram

```
Developer
   │
   ▼
GitHub Repository
   │
   ▼
Terraform (Infrastructure as Code)
   │
   ▼
AWS Cloud
   │
   ├── VPC
   ├── Public Subnets
   ├── Internet Gateway
   ├── Security Groups
   │
   ▼
EC2 Instances (Kubernetes Nodes)
   │
   ▼
Docker Containers
   │
   ▼
Kubernetes Deployment
   │
   ▼
Kubernetes Service
   │
   ▼
Ingress Controller
   │
   ▼
AWS Application Load Balancer
   │
   ▼
User Access via Browser
```

---

## Infrastructure Components

### AWS VPC

Provides isolated networking for the Kubernetes cluster.

### Public Subnets

Hosts the EC2 instances running Kubernetes nodes.

### EC2 Instances

Two instances act as Kubernetes nodes where application containers run.

### Application Load Balancer

Handles incoming traffic and routes requests to the Kubernetes cluster.

### S3 Bucket

Stores Terraform remote state for infrastructure management.

---

## Kubernetes Components

### Deployment

Manages application pods and ensures high availability.

### Service

Exposes the application inside the Kubernetes cluster.

### Ingress

Routes external traffic to the service.

---

Containerization

The application is containerized using Docker and published to Docker Hub.

Docker image used:

preethambr/devops-dashboard
Infrastructure Screenshots
EC2 Instances




Application Load Balancer




Kubernetes Pods




Kubernetes Service




Application UI

## Benefits of This Architecture

* Infrastructure as Code with Terraform
* Scalable container orchestration with Kubernetes
* Cloud-native deployment on AWS
* Automated infrastructure provisioning
* Load-balanced application delivery
