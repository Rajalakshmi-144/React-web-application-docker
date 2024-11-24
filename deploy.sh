#!/bin/bash

# exit the code if fails
set -e

echo "pulling the image from dockerhub"

docker pull rajalakshmi1404/react-image:dev

#stop container if it is running

docker stop react-app|| true
docker rm react-app|| true

# deploy the container

docker compose up -d

echo "deployed the application"
