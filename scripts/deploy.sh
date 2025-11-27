#!/bin/bash

# GitHub Pages Deployment Script
# This script builds and prepares the app for GitHub Pages deployment

set -e

# Color output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}=== Angular Material Calendar - GitHub Pages Deployment ===${NC}\n"

# Check Node version
NODE_VERSION=$(node -v | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 18 ]; then
    echo -e "${RED}✗ Node.js 18+ is required. Current version: $(node -v)${NC}"
    exit 1
fi
echo -e "${GREEN}✓ Node.js version: $(node -v)${NC}"

# Check npm
echo -e "${GREEN}✓ npm version: $(npm -v)${NC}\n"

# Step 1: Install dependencies
echo -e "${YELLOW}Step 1: Installing dependencies...${NC}"
if npm ci; then
    echo -e "${GREEN}✓ Dependencies installed${NC}\n"
else
    echo -e "${RED}✗ Failed to install dependencies${NC}"
    exit 1
fi

# Step 2: Build the library
echo -e "${YELLOW}Step 2: Building Angular Material Calendar library...${NC}"
if npm run build -- --project=angular-material-calendar; then
    echo -e "${GREEN}✓ Library built successfully${NC}\n"
else
    echo -e "${RED}✗ Failed to build library${NC}"
    exit 1
fi

# Step 3: Build the demo application
echo -e "${YELLOW}Step 3: Building demo application (production)...${NC}"
if npm run build -- --project=angular-material-calendar-demo --configuration production; then
    echo -e "${GREEN}✓ Demo application built successfully${NC}\n"
else
    echo -e "${RED}✗ Failed to build demo application${NC}"
    exit 1
fi

# Step 4: Check output directory
DEMO_DIR="dist/angular-material-calendar-demo"
if [ -d "$DEMO_DIR" ]; then
    SIZE=$(du -sh "$DEMO_DIR" | cut -f1)
    FILE_COUNT=$(find "$DEMO_DIR" -type f | wc -l)
    echo -e "${GREEN}✓ Build output directory: $DEMO_DIR${NC}"
    echo -e "${GREEN}  Size: $SIZE${NC}"
    echo -e "${GREEN}  Files: $FILE_COUNT${NC}\n"
else
    echo -e "${RED}✗ Build output directory not found: $DEMO_DIR${NC}"
    exit 1
fi

# Step 5: Check for index.html
if [ -f "$DEMO_DIR/index.html" ]; then
    echo -e "${GREEN}✓ index.html found${NC}\n"
else
    echo -e "${RED}✗ index.html not found in build output${NC}"
    exit 1
fi

echo -e "${GREEN}=== Build Complete ===${NC}"
echo -e "${YELLOW}Next steps:${NC}"
echo -e "1. Review the build output in: $DEMO_DIR"
echo -e "2. Commit and push your changes:"
echo -e "   git add ."
echo -e "   git commit -m 'Deploy to GitHub Pages'"
echo -e "   git push origin main"
echo -e "3. GitHub Actions will automatically deploy to:"
echo -e "   https://bytetobinary-com.github.io/angular-material-calendar/"
echo -e "\n${YELLOW}Monitor deployment progress:${NC}"
echo -e "https://github.com/ByteToBinary-com/angular-material-calendar/actions"
