#!/bin/bash
# Simple setup script for the workshop

echo "🚀 Setting up your CI/CD Workshop Environment"
echo "============================================="

# 1. Initialize Git
if [ ! -d ".git" ]; then
    echo "📦 Initializing Git..."
    git init -b main
    git add .
    git commit -m "Workshop initial commit"
else
    echo "✅ Git is already ready!"
fi

echo ""
echo "📋 YOUR MISSION:"
echo "1. Go to GitHub.com -> New Repository"
echo "2. Name it 'cicd-workshop'"
echo "3. Run these commands (copy/paste from GitHub):"
echo "   git remote add origin https://github.com/YOUR_USER/cicd-workshop.git"
echo "   git push -u origin main"
echo ""
echo "That's it! You are ready for the hands-on."
echo "   - GitHub Actions Docs: https://docs.github.com/en/actions"
echo "   - Docker Hub Tokens: https://hub.docker.com/settings/security"
echo ""
