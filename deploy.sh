#!/bin/bash

echo "Stopping old container..."
docker stop devops-cicd-app || true
docker rm devops-cicd-app || true

echo "Pulling latest image..."
docker pull iamtamil0/devops-cicd-app:latest

echo "Starting new container..."
docker run -d \
  --restart unless-stopped \
  --name devops-cicd-app \
  -p 80:5000 \
  iamtamil0/devops-cicd-app:latest