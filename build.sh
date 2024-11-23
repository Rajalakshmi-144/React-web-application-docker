#!/bin/bash

echo "building the image"

docker-compose build

IMAGE_NAME="rajalakshmi1404/react-image:dev"
DOCKER_USERNAME="rajalakshmi1404"
DOCKER_PASSWORD="Raji@140494"

echo "tagging the image"

docker tag devops-build-react-app:latest $IMAGE_NAME

echo "login to dockerhub"

docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD 

echo "logged into dockerhub" 

echo "pushing the image to dockerhub dev repo"

docker push $IMAGE_NAME

echo "Docker image built and pushed to Docker Hub"
