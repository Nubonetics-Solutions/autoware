#!/bin/bash

docker build --rm --tag nubonetics/autoware:latest-melodic-cuda -f Dockerfile.melodic.cuda .
docker login 
docker push nubonetics/autoware:latest-melodic-cuda
