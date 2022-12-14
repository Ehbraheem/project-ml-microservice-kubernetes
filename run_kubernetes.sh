#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath="ehbraheem/housing-ml"

# Step 2
# Run the Docker Hub container with kubernetes
echo "Docker ID and Image: $dockerpath"
kubectl run housing-ml \
    --image=$dockerpath \
    --port=80 --labels app=housing-price-prediction


# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl wait --for=condition=ready pod --all
kubectl port-forward housing-ml 8000:80
