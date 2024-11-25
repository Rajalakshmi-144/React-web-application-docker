#!/bin/bash

echo "building the image"

docker-compose build
       

echo "login to dockerhub"

docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD 

echo "logged into dockerhub"
