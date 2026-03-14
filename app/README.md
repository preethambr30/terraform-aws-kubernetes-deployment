# Web Application

This folder contains the frontend web application and Docker configuration.

## Files

index.html → Web application UI
style.css → Styling for the web page
Dockerfile → Builds the Docker image

## Docker Build

Build the container image:

docker build -t devops-demo-app .

Tag image for DockerHub:

docker tag devops-demo-app yourdockerhub/devops-demo

Push image:

docker push yourdockerhub/devops-demo

## Purpose

The application acts as a simple DevOps dashboard showing that the infrastructure and deployment pipeline are functioning correctly.

