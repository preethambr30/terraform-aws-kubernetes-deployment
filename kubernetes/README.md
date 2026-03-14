# Kubernetes Deployment

This folder contains Kubernetes configuration files used to deploy the containerized application.

## Files

deployment.yaml → Defines application pods and replicas
service.yaml → Exposes the application to the internet

## Deployment Process

1. Kubernetes pulls the Docker image from DockerHub
2. Pods are created to run the container
3. Service exposes the application externally

## Commands

Deploy application:

kubectl apply -f deployment.yaml

Expose application:

kubectl apply -f service.yaml

Check running pods:

kubectl get pods

Check service external IP:

kubectl get svc

