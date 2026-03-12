#!/bin/bash
echo "Deploying Application..."
docker-compose down
docker-compose up -d
echo "Deployment Completed!"
