#!/bin/bash
set -e

PROJECT_ID="project-bac72478-78d1-4256-922"
REGION="us-central1"
REPO_NAME="devops-bootcamp"
SERVICE_NAME="devops-bootcamp-app"
LOCAL_IMAGE="${1}"

if [ -z "$LOCAL_IMAGE" ]; then
  echo "Usage: ./deploy-from-container.sh <local-image-name>"
  echo "Example: ./deploy-from-container.sh my-app:latest"
  exit 1
fi

echo "Deploying local image: $LOCAL_IMAGE"

gcloud config set project $PROJECT_ID

# Enable APIs
gcloud services enable artifactregistry.googleapis.com run.googleapis.com

# Create repository if not exists
gcloud artifacts repositories create $REPO_NAME \
  --repository-format=docker \
  --location=$REGION \
  --description="DevOps Bootcamp images" 2>/dev/null || echo "Repository exists"

# Configure Docker
gcloud auth configure-docker ${REGION}-docker.pkg.dev

# Tag local image for Artifact Registry
REMOTE_IMAGE="${REGION}-docker.pkg.dev/${PROJECT_ID}/${REPO_NAME}/${LOCAL_IMAGE}"
echo "Tagging image as: $REMOTE_IMAGE"
docker tag $LOCAL_IMAGE $REMOTE_IMAGE

# Push to Artifact Registry
echo "Pushing to Artifact Registry..."
docker push $REMOTE_IMAGE

# Deploy to Cloud Run
echo "Deploying to Cloud Run..."
gcloud run deploy $SERVICE_NAME \
  --image $REMOTE_IMAGE \
  --platform managed \
  --region $REGION \
  --allow-unauthenticated \
  --port 3000 \
  --memory 512Mi \
  --timeout 300 \
  --cpu 1 \
  --min-instances 0 \
  --max-instances 10 \
  --cpu-boost        
echo "Done!"
gcloud run services describe $SERVICE_NAME --region $REGION --format 'value(status.url)'
