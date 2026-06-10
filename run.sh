#!/bin/bash
if [ "$1" = "build_generator" ]; then
    docker build -t data-generator -f Dockerfile .
elif [ "$1" = "run_generator" ]; then
    mkdir -p data
    docker run --rm -v "$(pwd)/data:/data" data-generator
elif [ "$1" = "create_local_data" ]; then
    mkdir -p local_data
    python src/generate.py local_data
elif [ "$1" = "build_reporter" ]; then
    docker build -t data-reporter -f Dockerfile.reporter .
elif [ "$1" = "run_reporter" ]; then
    docker run --rm -v "$(pwd)/data:/data" data-reporter
elif [ "$1" = "structure"]; then
    docker exec -it <имя_контейнера> tree 
elif [ "$1" = "clear_data" ]; then
    rm -rf data 
    rm -rf local_data
else
    echo "Wrong command"
fi