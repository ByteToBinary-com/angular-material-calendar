# GitHub Pages Deployment Configuration

This file documents all configuration made for GitHub Pages deployment.

## Files Modified

### 1. `angular.json`
**Changes Made:**
- Added `"baseHref": "/angular-material-calendar/"` to build options
- Added `"baseHref": "/angular-material-calendar/"` to production configuration

**Why:** Angular needs to know the base path for the app to load assets correctly.

```json
{
  "projects": {
    "angular-material-calendar-demo": {
      "architect": {
        "build": {
          "options": {
            "baseHref": "/angular-material-calendar/",
            "outputPath": "dist/angular-material-calendar-demo",
            ...
          },
          "configurations": {
            "production": {
              "baseHref": "/angular-material-calendar/",
              ...
            }
          }
        }
      }
    }
  }
}
```

## Files Created

### 1. `.github/workflows/deploy-github-pages.yml`
**Purpose:** GitHub Actions workflow for automatic deployment
**Triggers:** 
- Push to `main` branch
- Pull requests to `main` (builds only, doesn't deploy)

**Steps:**
1. Checkout code
2. Setup Node.js 18.x
3. Install dependencies
4. Build library
5. Build demo app with production config
6. Upload artifacts to GitHub Pages
7. Deploy to GitHub Pages (main branch only)

### 2. `.nojekyll`
**Purpose:** Tells GitHub Pages to skip Jekyll processing
**Why:** Prevents Jekyll from modifying Angular's built files

### 3. `scripts/deploy.sh`
**Purpose:** Local helper script for testing deployment process
**Usage:** `./scripts/deploy.sh`
**Features:**
- Validates Node version
- Checks npm installation
- Installs dependencies
- Builds library
- Builds demo app
- Validates output
- Provides next steps

## Documentation Created

### 1. `DEPLOYMENT_README.md` (Main entry point)
- Overview of deployment setup
- Quick deploy instructions
- Documentation guide
- Troubleshooting tips

### 2. `QUICKSTART_DEPLOY.md`
- 4-step quick start guide
- Minimal information, maximum clarity
- Links to detailed docs

### 3. `GITHUB_PAGES_DEPLOYMENT.md`
- Comprehensive deployment guide
- Environment setup
- GitHub Pages configuration
- Troubleshooting guide
- FAQ

### 4. `DEPLOYMENT_CHECKLIST.md`
- Pre-deployment checklist
- GitHub configuration steps
- Deployment steps
- Post-deployment verification
- Monitoring checklist

### 5. `DEPLOYMENT_SETUP_SUMMARY.md`
- What was configured
- How to deploy
- File structure
- Quick verification

## Environment Setup

### GitHub Repository Settings
**Path:** Settings → Pages

Required Configuration:
- Source: "GitHub Actions"
- Branch: main (automatic)

Recommended:
- Enable branch protection for main
- Require PR reviews before merge
- Dismiss stale PR approvals on new commits

### GitHub Actions Permissions
**Path:** Settings → Actions

Required:
- Actions enabled
- Read and write permissions for workflows

## Deployment Flow

```
Developer commits and pushes
         ↓
GitHub Actions webhook triggered
         ↓
Workflow matrix: Node 18.x
         ↓
Run: Install dependencies (npm ci)
         ↓
Run: Build library
         ↓
Run: Build demo app (production)
         ↓
Configure GitHub Pages
         ↓
Upload artifact (dist/angular-material-calendar-demo)
         ↓
Deploy to GitHub Pages
         ↓
Site accessible at: https://bytetobinary-com.github.io/angular-material-calendar/
```

## Build Configuration

### Library Build
```bash
npm run build -- --project=angular-material-calendar
```
Output: `dist/angular-material-calendar/`

### Demo App Build
```bash
npm run build -- --project=angular-material-calendar-demo --configuration production
```
Output: `dist/angular-material-calendar-demo/`

Build Options:
- `--configuration production` - Optimized production build
- Includes minification
- Includes CSS optimization
- Hash-based asset names
- No source maps

## Base Href

**Configured Value:** `/angular-material-calendar/`

**Why:** GitHub Pages serves user/org pages at domain root, but project pages (this project) are served at `https://bytetobinary-com.github.io/angular-material-calendar/`

**Impact:**
- All routes are relative to `/angular-material-calendar/`
- Assets load from correct path
- Links work correctly

## Workflow Permissions

Configured in `.github/workflows/deploy-github-pages.yml`:

```yaml
permissions:
  contents: read          # Read repository contents
  pages: write            # Write to GitHub Pages
  id-token: write         # Create OIDC token for deployment
```

## Security Considerations

### ✅ Safe Practices
- No API keys in configuration
- No credentials stored
- No environment secrets needed for public deployment
- All code is public (as it's open source)

### 🔒 If Adding Private Data
- Use GitHub Secrets for API keys
- Reference in workflow: `${{ secrets.SECRET_NAME }}`
- Never commit secrets to repository

## Monitoring & Logs

### GitHub Actions Logs
URL: `https://github.com/ByteToBinary-com/angular-material-calendar/actions`

View:
- Workflow runs
- Build logs
- Deployment status
- Error messages

### Build Artifacts
Available for 90 days (GitHub default)
- Uploaded automatically
- Can be downloaded
- Names: `artifact` (contains dist folder)

## Troubleshooting

### Build Fails in Actions
1. Check workflow logs
2. Run local build to replicate
3. Fix issues locally
4. Push updated code

### Site Not Deploying
1. Verify GitHub Pages enabled
2. Check workflow permissions
3. Review Actions logs
4. Verify main branch build passed

### 404 Errors on Site
1. Check baseHref value
2. Rebuild and redeploy
3. Clear browser cache
4. Wait 2-3 minutes

## Manual Deployment (if needed)

For manual deployment without GitHub Actions:

```bash
# Build
npm run build -- --project=angular-material-calendar
npm run build -- --project=angular-material-calendar-demo --configuration production

# The dist/angular-material-calendar-demo folder can be deployed to any static host
```

## Version Information

- **Created:** November 27, 2025
- **Node.js Version:** 18.x (specified in workflow)
- **Angular Version:** 13.x (from package.json)
- **Workflow Version:** GitHub Actions v3 API

## Configuration Validation

To verify everything is set up correctly:

```bash
# 1. Check baseHref
grep '"baseHref"' angular.json
# Should show: "baseHref": "/angular-material-calendar/"

# 2. Check workflow
cat .github/workflows/deploy-github-pages.yml | grep -A 2 "uses:"

# 3. Check .nojekyll exists
test -f .nojekyll && echo "✓ .nojekyll found" || echo "✗ .nojekyll missing"

# 4. Check deploy script
ls -l scripts/deploy.sh
# Should be executable
```

## Related Documentation

- GitHub Pages: https://docs.github.com/en/pages
- GitHub Actions: https://docs.github.com/en/actions
- Angular Deployment: https://angular.io/guide/deployment
- Workflow Syntax: https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions

---

**Configuration Status:** ✅ Complete
**Ready to Deploy:** ✅ Yes
**Next Step:** Run `git push origin main`
