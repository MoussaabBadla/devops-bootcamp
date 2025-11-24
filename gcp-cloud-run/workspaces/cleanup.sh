#!/bin/bash
set -e

PROJECT_ID="project-bac72478-78d1-4256-922"
REGION="us-central1"
REPO_NAME="devops-bootcamp"
SERVICE_NAME="devops-bootcamp-app"

echo "Cleaning up Cloud Run and Artifact Registry resources..."

gcloud config set project $PROJECT_ID

# Delete Cloud Run service
echo "Deleting Cloud Run service..."
gcloud run services delete $SERVICE_NAME \
  --region $REGION \
  --quiet 2>/dev/null || echo "Service not found or already deleted"

# Delete Artifact Registry repository
echo "Deleting Artifact Registry repository..."
gcloud artifacts repositories delete $REPO_NAME \
  --location=$REGION \
  --quiet 2>/dev/null || echo "Repository not found or already deleted"

echo "Cleanup complete!"
