#!/bin/bash

docker build --rm --tag autoware:local-melodic-cuda -f Dockerfile.melodic.cuda .
