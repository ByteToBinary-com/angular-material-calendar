# GitHub Pages Deployment Guide

This guide explains how to deploy the Angular Material Calendar demo application to GitHub Pages.

## Overview

The Angular Material Calendar project is configured for automatic deployment to GitHub Pages using GitHub Actions. The deployment workflow:

1. Triggers on push to the `main` branch
2. Builds the Angular library and demo application
3. Deploys the demo app to GitHub Pages
4. Makes it accessible at: `https://bytetobinary-com.github.io/angular-material-calendar/`

## Prerequisites

- GitHub repository with admin access (to configure Pages settings)
- Node.js 18+ installed locally (for testing builds)
- npm or yarn package manager

## Automatic Deployment (GitHub Actions)

### How It Works

The workflow file `.github/workflows/deploy-github-pages.yml` automatically:

1. **Triggers on:** Push to `main` branch or pull requests
2. **Installs dependencies:** `npm ci`
3. **Builds the library:** `ng build angular-material-calendar`
4. **Builds the demo app:** `ng build angular-material-calendar-demo --configuration production`
5. **Uploads artifacts** to GitHub Pages
6. **Deploys** to GitHub Pages on main branch only

### Configuration

The following has been configured in `angular.json`:

```json
{
  "baseHref": "/angular-material-calendar/",
  "outputPath": "dist/angular-material-calendar-demo"
}
```

This ensures the app loads from the correct GitHub Pages path.

## GitHub Pages Settings

To enable GitHub Pages for your repository:

1. Go to your GitHub repository
2. Navigate to **Settings** → **Pages**
3. Under "Build and deployment":
   - Source: Select **GitHub Actions**
   - Branch: `main` (automatically configured by workflow)
4. Save settings

## Local Testing

You can test the build locally before pushing to GitHub:

```bash
# Install dependencies
npm install

# Build the library
npm run build -- --project=angular-material-calendar

# Build the demo app with production configuration
npm run build -- --project=angular-material-calendar-demo --configuration production
```

The built app will be in `dist/angular-material-calendar-demo/`

## Manual Deployment (If Needed)

If you need to deploy manually without GitHub Actions:

```bash
# Clean previous builds
rm -rf dist

# Install dependencies
npm install

# Build both library and demo
npm run build -- --project=angular-material-calendar
npm run build -- --project=angular-material-calendar-demo --configuration production

# The dist/angular-material-calendar-demo folder contains the production build
# Push this folder to gh-pages branch (if using manual deployment)
```

## Troubleshooting

### Build Fails

1. **Check Node version:** Ensure you're using Node 18+
   ```bash
   node --version  # Should be v18.x or higher
   ```

2. **Clear cache:** Remove node_modules and reinstall
   ```bash
   rm -rf node_modules package-lock.json
   npm install
   ```

3. **Check for errors:** Review the GitHub Actions workflow output in:
   - **Settings** → **Actions** → **Workflows** → Select the failed run

### Site Not Accessible

1. Verify GitHub Pages is enabled in repository Settings
2. Check that the workflow completed successfully
3. Clear browser cache and hard refresh (Ctrl+Shift+R or Cmd+Shift+R)
4. Wait 1-2 minutes for GitHub Pages to fully deploy

### Routing Issues

If you get 404 errors on page refresh:

1. The app uses client-side routing
2. GitHub Pages requires `index.html` fallback (configured via actions)
3. If manual deployment needed, create `.nojekyll` file in root

## Environment Variables

If you need environment-specific configuration:

1. Edit: `projects/angular-material-calendar-demo/src/environments/environment.prod.ts`
2. Rebuild and push to trigger deployment

## Continuous Integration

The workflow also runs on pull requests for validation (doesn't deploy):

- Builds the application
- Tests changes
- Prevents broken code from reaching main branch

## Quick Links

- **Live Demo:** `https://bytetobinary-com.github.io/angular-material-calendar/`
- **Repository:** `https://github.com/ByteToBinary-com/angular-material-calendar`
- **Workflow File:** `.github/workflows/deploy-github-pages.yml`
- **Angular Config:** `angular.json`

## Additional Resources

- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Angular Deployment Guide](https://angular.io/guide/deployment)
- [Angular Material Documentation](https://material.angular.io/)

## FAQ

**Q: How often is the site updated?**  
A: Every time you push to the `main` branch. The workflow typically completes in 2-5 minutes.

**Q: Can I deploy from a different branch?**  
A: Yes, edit `.github/workflows/deploy-github-pages.yml` and change the `on.push.branches` value.

**Q: How do I rollback to a previous version?**  
A: Push a previous commit to main: `git push origin <commit-hash>:main`

**Q: Can I use a custom domain?**  
A: Yes, add the domain in GitHub Pages settings and configure DNS records accordingly.

**Q: What's the size limit?**  
A: GitHub Pages supports up to 1GB per site. Check `dist/angular-material-calendar-demo` size with:
```bash
du -sh dist/angular-material-calendar-demo/
```
