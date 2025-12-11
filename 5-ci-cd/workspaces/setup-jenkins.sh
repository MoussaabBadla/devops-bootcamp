#!/bin/bash

# Jenkins Setup Script
# This script runs Jenkins in a Docker container for local testing

set -e

echo "🔧 Setting up Jenkins with Docker"
echo "=================================="
echo ""

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "❌ Error: Docker is not running"
    echo "Please start Docker and try again"
    exit 1
fi

echo "✅ Docker is running"
echo ""

# Check if Jenkins container already exists
if docker ps -a | grep -q jenkins-workshop; then
    echo "⚠️  Jenkins container already exists"
    read -p "Do you want to remove it and start fresh? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "🗑️  Removing existing container..."
        docker rm -f jenkins-workshop
    else
        echo "Exiting..."
        exit 0
    fi
fi

echo "🚀 Starting Jenkins container..."
echo ""

# Run Jenkins container
docker run -d \
  --name jenkins-workshop \
  -p 8080:8080 \
  -p 50000:50000 \
  -v jenkins_home:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  jenkins/jenkins:lts

echo "⏳ Waiting for Jenkins to start (this may take a minute)..."
sleep 30

# Get initial admin password
echo ""
echo "✅ Jenkins is starting!"
echo ""
echo "📋 Access Information:"
echo "   URL: http://localhost:8080"
echo ""
echo "🔑 Initial Admin Password:"
docker exec jenkins-workshop cat /var/jenkins_home/secrets/initialAdminPassword
echo ""
echo ""
echo "📚 Setup Instructions:"
echo "1. Open http://localhost:8080 in your browser"
echo "2. Enter the admin password shown above"
echo "3. Click 'Install suggested plugins'"
echo "4. Create your first admin user"
echo "5. Start creating pipelines!"
echo ""
echo "💡 Tips:"
echo "   - To view logs: docker logs -f jenkins-workshop"
echo "   - To stop Jenkins: docker stop jenkins-workshop"
echo "   - To start Jenkins: docker start jenkins-workshop"
echo "   - To remove Jenkins: docker rm -f jenkins-workshop"
echo "   - To remove data: docker volume rm jenkins_home"
echo ""
echo "🎯 Next Steps:"
echo "   1. Create a new Pipeline job"
echo "   2. Use 'Pipeline script from SCM' or paste Jenkinsfile"
echo "   3. Run your first build!"
echo ""
