# Application (DevOps Dashboard)

## Overview

This folder contains the frontend application used in the Terraform AWS Kubernetes deployment project.

The application is a simple **DevOps dashboard web UI** that demonstrates how a containerized application can be deployed into a Kubernetes cluster.

The application is built using:

* HTML
* CSS
* JavaScript

It is containerized using **Docker** and served through **Nginx**.

---

## Application Structure

```
app/
├── index.html
├── style.css
├── script.js
└── Dockerfile
```

### index.html

The main web page that renders the DevOps dashboard interface.

### style.css

Contains styling for the dashboard layout and UI components.

### script.js

Handles client-side logic and dynamic UI behavior.

### Dockerfile

Defines how the application is packaged into a Docker container.

---

## Docker Containerization

The application is packaged into a Docker container using the following process:

1. Use a lightweight Nginx base image.
2. Copy the application files into the Nginx web directory.
3. Expose port **80** to serve the application.

### Dockerfile

```
FROM nginx:alpine

COPY index.html /usr/share/nginx/html/
COPY style.css /usr/share/nginx/html/
COPY script.js /usr/share/nginx/html/

EXPOSE 80
```

---

## Build Docker Image

```
docker build -t devops-dashboard .
```

---

## Run Container Locally

```
docker run -p 8080:80 devops-dashboard
```

Open in browser:

```
http://localhost:8080
```

---

## Docker Hub Image

The application image is published to Docker Hub and used by Kubernetes for deployment.

```
preethambr/devops-dashboard
```

---

## Role in the Project

This application serves as the **workload deployed to the Kubernetes cluster** created using Terraform infrastructure.

Deployment flow:

```
Application Code
      ↓
Docker Image
      ↓
Docker Hub
      ↓
Kubernetes Deployment
      ↓
Application running in AWS Kubernetes cluster
```


