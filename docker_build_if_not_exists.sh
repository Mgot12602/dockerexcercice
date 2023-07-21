#!/bin/bash

# Set the image name and tag
IMAGE_NAME="getting-started"
IMAGE_TAG="latest"

# Check if the image exists in the local Docker registry
if docker image inspect $IMAGE_NAME:$IMAGE_TAG &>/dev/null; then
  echo "Docker image '$IMAGE_NAME:$IMAGE_TAG' already exists. Skipping build."
else
  echo "Docker image '$IMAGE_NAME:$IMAGE_TAG' not found. Building the image..."
  docker build -t $IMAGE_NAME:$IMAGE_TAG .
fi

# Run the container using Docker Compose
docker-compose up -d