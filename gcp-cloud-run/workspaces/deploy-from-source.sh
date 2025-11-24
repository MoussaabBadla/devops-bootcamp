#!/bin/bash
set -e

PROJECT_ID="project-bac72478-78d1-4256-922"
REGION="us-central1"
SERVICE_NAME="devops-bootcamp-app"

echo "Deploying from source code..."

gcloud config set project $PROJECT_ID

cd ../docker/getting-started-app

gcloud run deploy $SERVICE_NAME \
  --source . \
  --platform managed \
  --region $REGION \
  --allow-unauthenticated \
  --memory 512Mi

cd ../../gcp-cloud-run/workspaces

echo "Done!"
gcloud run services describe $SERVICE_NAME --region $REGION --format 'value(status.url)'
