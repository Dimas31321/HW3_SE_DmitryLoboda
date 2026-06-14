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
elif [ "$1" = "structure" ]; then
    find . -maxdepth 3 -print
elif [ "$1" = "clear_data" ]; then
    rm -rf data 
    rm -rf local_data
elif [ "$1" = "inside_generator" ]; then
    docker run --rm -v "$(pwd)/data:/data" \
        data-generator \
        find /data -print
elif [ "$1" = "inside_reporter" ]; then 
    docker run --rm -v "$(pwd)/data:/data" \
        data-reporter \
        find /data -print
elif [ "$1" = "report_server" ]; then
    docker run -d \
        --name report-server \
        -p 8080:80 \
        -v "$(pwd)/data:/usr/share/nginx/html:ro" \
        nginx 
    echo "Чтобы открыть отчет, перейдите по ссылке: http://localhost:8080/report.html"
    echo "Чтобы остановить сервер, выполните команду: ./run.sh stop_report_server"
elif [ "$1" = "stop_report_server" ]; then
    docker stop report-server
else
    echo "Wrong command"
fi