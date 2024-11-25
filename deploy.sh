#!/bin/bash

#stop container if it is running

docker stop react-app|| true
docker rm react-app|| true

# deploy the container

docker-compose up -d

echo "deployed the application"
