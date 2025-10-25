#!/bin/bash

# Create network if it doesn't exist
docker network inspect hermes-network >/dev/null 2>&1 || docker network create hermes-network

docker-compose down
docker-compose up -d --build

echo "YouTube Transcript API started on port 8084"