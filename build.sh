#!/bin/bash

echo "building the image"

docker compose build

IMAGE_NAME="rajalakshmi1404/react-image"
DOCKER_USERNAME="rajalakshmi1404"
DOCKER_PASSWORD="Raji@140494"


docker tag devops-build-react-app:latest $IMAGE_NAME:dev

echo "login to dockerhub"

docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD 

echo "logged into dockerhub" 
