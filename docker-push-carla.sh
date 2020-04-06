#!/bin/bash

docker build --rm --tag nubonetics/autoware:latest-melodic-carla -f Dockerfile.melodic.carla .
docker login 
docker push nubonetics/autoware:latest-melodic-carla
