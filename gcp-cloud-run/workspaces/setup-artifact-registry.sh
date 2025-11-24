#!/bin/bash
set -e

PROJECT_ID="project-bac72478-78d1-4256-922"
REGION="us-central1"
REPO_NAME="devops-bootcamp"
SERVICE_NAME="devops-bootcamp-app"
IMAGE_NAME="devops-app"
IMAGE_TAG="v1.0.0"

echo "Setting up Artifact Registry and deploying..."

gcloud config set project $PROJECT_ID

# Enable APIs
gcloud services enable artifactregistry.googleapis.com run.googleapis.com cloudbuild.googleapis.com

# Create repository (ignore if exists)
gcloud artifacts repositories create $REPO_NAME \
  --repository-format=docker \
  --location=$REGION \
  --description="DevOps Bootcamp images" 2>/dev/null || echo "Repository exists"

# Configure Docker
gcloud auth configure-docker ${REGION}-docker.pkg.dev

# Build image
IMAGE_PATH="${REGION}-docker.pkg.dev/${PROJECT_ID}/${REPO_NAME}/${IMAGE_NAME}:${IMAGE_TAG}"
cd sample-app
docker build -t $IMAGE_PATH .
cd ..

# Push image
docker push $IMAGE_PATH

# Deploy to Cloud Run
gcloud run deploy $SERVICE_NAME \
  --image $IMAGE_PATH \
  --platform managed \
  --region $REGION \
  --allow-unauthenticated \
  --port 8080 \
  --memory 512Mi

echo "Done!"
gcloud run services describe $SERVICE_NAME --region $REGION --format 'value(status.url)'
