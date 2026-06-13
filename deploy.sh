#!/bin/bash

# Deploy to GitHub Pages
# Usage: ./deploy.sh

set -e

REPO="git@github.com:chuhandanielzhang/chuhandanielzhang.github.io.git"
SITE_URL="https://chuhandanielzhang.github.io"

echo "Deploying personal website..."

if [ ! -d ".git" ]; then
    echo "Initializing git repository..."
    git init
    git remote add origin "$REPO"
fi

git add .
git diff --cached --quiet && echo "No changes to deploy." && exit 0

git commit -m "Deploy website $(date '+%Y-%m-%d %H:%M:%S')"
git branch -M main
git push -u origin main

echo "Done: $SITE_URL"
