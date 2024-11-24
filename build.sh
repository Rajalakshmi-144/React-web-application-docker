#!/bin/bash


echo "building the image"

docker build -t rajalakshmi1404/react-image:dev .


echo "login to dockerhub"

docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD 

echo "logged into dockerhub"

docker push rajalakshmi1404/react-image:dev

echo "Docker image built and pushed to Docker Hub."
