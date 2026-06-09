#!/bin/bash
if [ "$1" = "build_generator" ]; then
    docker build -t data-generator -f Dockerfile .
elif [ "$1" = "run_generator" ]; then
    mkdir -p data
    docker run --rm -v "$(pwd)/data:/data" data-generator
elif [ "$1" = "create_local_data" ]; then
    mkdir -p local_data
    python src/generate.py local_data
else
    echo "Usage:"
    echo "./run.sh build_generator"
    echo "./run.sh run_generator"
    echo "./run.sh create_local_data"
fi