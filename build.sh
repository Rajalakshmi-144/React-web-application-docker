#!/bin/bash

echo "building the image"

docker-compose build

echo "tagging image"
docker tag pipeline-react-app:latest rajalakshmi1404/react-image:dev        

echo "login to dockerhub"

docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD 

echo "logged into dockerhub"

docker push rajalakshmi1404/react-image:dev

echo "Docker image built and pushed to Docker Hub."
