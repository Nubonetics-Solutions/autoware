#!/bin/bash

docker build --rm --tag autoware:local-melodic-carla -f Dockerfile.melodic.carla .
