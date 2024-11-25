#!/bin/bash

# Pull the latest Docker image
echo "Pulling the latest Docker image..."
docker pull soniamohan/siansawebserver:latest || { echo "Docker pull failed"; exit 1; }

# Stop the existing container (if any)
echo "Stopping any existing container..."
docker stop siansawebserver-container || echo "No container to stop"

# Remove the existing container (if any)
echo "Removing any existing container..."
docker rm siansawebserver-container || echo "No container to remove"

# Start the new container
echo "Starting the new container..."
docker run -d --name siansawebserver-container -p 8080:8080 soniamohan/siansawebserver:latest || { echo "Failed to start container"; exit 1; }

echo "Deployment complete!"
