# Deployment Workflow

## Overview

This document describes the complete workflow of deploying the DevOps dashboard application using Terraform, Docker, and Kubernetes.

The deployment process automates both infrastructure provisioning and application deployment in the AWS cloud environment.

---

## Workflow Steps

### 1. Application Development

The application is developed as a simple frontend dashboard using:

* HTML
* CSS
* JavaScript

Source files are stored in the **app** folder.

---

### 2. Containerization

The application is containerized using Docker.

Docker builds an image using the `Dockerfile`.

Build command:

```bash
docker build -t devops-dashboard .
```

Run locally for testing:

```bash
docker run -p 8080:80 devops-dashboard
```

---

### 3. Push Image to Docker Hub

After building the image locally, it is pushed to Docker Hub so Kubernetes can pull it.

Docker image:

```text
preethambr/devops-dashboard
```

Push command:

```bash
docker push preethambr/devops-dashboard
```

---

### 4. Infrastructure Provisioning (Terraform)

Terraform provisions the required AWS infrastructure.

Resources created include:

* VPC
* Public Subnets
* Internet Gateway
* Route Tables
* Security Groups
* EC2 Instances (Kubernetes nodes)
* Application Load Balancer
* S3 bucket for Terraform remote state

Commands used:

```bash
terraform init
terraform plan
terraform apply
```

---

### 5. Kubernetes Cluster Setup

Each EC2 instance installs **k3s Kubernetes** using the user-data script.

This creates a lightweight Kubernetes cluster where the application will run.

---

### 6. Application Deployment (Kubernetes)

The application is deployed using Kubernetes manifests located in the `kubernetes` folder.

Deployment command:

```bash
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl apply -f ingress.yaml
```

Kubernetes creates:

* Pods running the containerized application
* A service exposing the application
* An ingress routing external traffic

---

### 7. Traffic Routing

Incoming traffic flows through the AWS Application Load Balancer.

Traffic path:

```text
User Browser
      ↓
AWS Application Load Balancer
      ↓
EC2 Kubernetes Nodes
      ↓
Kubernetes Ingress
      ↓
Service
      ↓
Pods
      ↓
DevOps Dashboard
```

---

## Final Result

The application becomes publicly accessible through the Load Balancer DNS endpoint.

This workflow demonstrates a **complete DevOps lifecycle**, including infrastructure provisioning, containerization, Kubernetes orchestration, and cloud deployment.
