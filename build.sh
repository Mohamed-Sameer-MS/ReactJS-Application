#!/bin/bash

echo "🔧 Building Docker Image..."

docker build -t devops-app .

echo "Build completed!"