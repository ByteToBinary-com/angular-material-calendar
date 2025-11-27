# Quick Start: Deploy to GitHub Pages

## 📋 Quick Steps

### 1️⃣ Verify Configuration
All configuration is already set up! Just verify:

```bash
# Check baseHref is configured
grep -A 2 '"baseHref"' angular.json
# Should show: "baseHref": "/angular-material-calendar/",
```

### 2️⃣ Build Locally (Optional - for testing)

```bash
# Install dependencies (if not already done)
npm install

# Build the library
npm run build -- --project=angular-material-calendar

# Build the demo app for production
npm run build -- --project=angular-material-calendar-demo --configuration production

# Check the output
ls -lh dist/angular-material-calendar-demo/
```

### 3️⃣ Deploy to GitHub Pages

Choose one method:

#### Method A: Automatic Deployment (Recommended)
```bash
# Just push to main branch
git add .
git commit -m "Ready to deploy to GitHub Pages"
git push origin main

# GitHub Actions will automatically build and deploy!
# Monitor at: https://github.com/ByteToBinary-com/angular-material-calendar/actions
```

#### Method B: Using Helper Script
```bash
# Run the deployment script (includes all checks)
./scripts/deploy.sh

# Then push to trigger GitHub Actions
git push origin main
```

### 4️⃣ Verify Deployment

Wait 2-5 minutes, then check:

```bash
# Open in browser
https://bytetobinary-com.github.io/angular-material-calendar/

# Or use curl to check
curl -I https://bytetobinary-com.github.io/angular-material-calendar/
```

## 🔍 What Happens Automatically

When you push to `main`:

1. ✅ GitHub Actions triggers
2. ✅ Installs dependencies
3. ✅ Builds the library
4. ✅ Builds the demo app (production)
5. ✅ Uploads artifacts to GitHub Pages
6. ✅ Deploys live! 🚀

## 📊 Current Setup

- **Workflow:** `.github/workflows/deploy-github-pages.yml`
- **Base Href:** `/angular-material-calendar/`
- **Output Dir:** `dist/angular-material-calendar-demo/`
- **Live URL:** `https://bytetobinary-com.github.io/angular-material-calendar/`

## ⚠️ Troubleshooting

| Issue | Solution |
|-------|----------|
| 404 errors | Clear browser cache, wait 2 min, refresh |
| Build fails | Check Actions logs, run local build |
| Assets missing | Verify baseHref in angular.json |
| Site not updating | Ensure workflow completed, check Actions tab |

## 📚 More Info

- **Full Guide:** `GITHUB_PAGES_DEPLOYMENT.md`
- **Deployment Checklist:** `DEPLOYMENT_CHECKLIST.md`
- **Actions:** `https://github.com/ByteToBinary-com/angular-material-calendar/actions`
- **Settings:** `https://github.com/ByteToBinary-com/angular-material-calendar/settings/pages`

---

**Status:** ✅ Ready for Deployment!
