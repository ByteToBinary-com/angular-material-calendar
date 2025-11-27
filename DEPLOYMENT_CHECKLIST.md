# GitHub Pages Deployment Checklist

Complete this checklist to deploy your Angular Material Calendar application to GitHub Pages.

## Pre-Deployment Steps

### 1. Local Environment Setup
- [ ] Node.js 18+ installed
  ```bash
  node --version  # Should be v18.x or higher
  ```
- [ ] npm or yarn available
  ```bash
  npm --version
  ```
- [ ] Repository cloned and up-to-date
  ```bash
  git status
  ```

### 2. Code Quality Checks
- [ ] All tests passing locally
  ```bash
  npm run test -- --watch=false --browsers=Chrome
  ```
- [ ] Linting passes without errors
  ```bash
  npm run lint
  ```
- [ ] No console errors in development mode
  ```bash
  npm start
  ```

### 3. Build Verification
- [ ] Library builds successfully
  ```bash
  npm run build -- --project=angular-material-calendar
  ```
- [ ] Demo app builds successfully
  ```bash
  npm run build -- --project=angular-material-calendar-demo --configuration production
  ```
- [ ] Build output is in `dist/angular-material-calendar-demo/`
  ```bash
  ls -la dist/angular-material-calendar-demo/
  ```

## GitHub Configuration

### 4. GitHub Repository Settings
1. Go to: `https://github.com/ByteToBinary-com/angular-material-calendar`
2. Navigate to **Settings** → **Pages**
   - [ ] Source is set to **GitHub Actions**
   - [ ] Verify the deployment domain will be: `https://bytetobinary-com.github.io/angular-material-calendar/`
3. Navigate to **Settings** → **Actions**
   - [ ] Actions are **enabled**
   - [ ] Workflow permissions: **Read and write permissions** enabled

### 5. Secrets & Environments (if needed)
- [ ] No additional secrets required for public repo
- [ ] GitHub Pages environment is configured automatically

## Deployment Steps

### 6. Commit Your Changes
```bash
# View changes
git status

# Stage all changes
git add .

# Commit with descriptive message
git commit -m "chore: configure GitHub Pages deployment"

# Verify commit
git log --oneline -1
```

### 7. Push to Main Branch
```bash
# Push to origin/main
git push origin main

# Verify push succeeded
git log --oneline origin/main -1
```

### 8. Verify Workflow Execution
1. Go to: `https://github.com/ByteToBinary-com/angular-material-calendar/actions`
2. [ ] See "Build and Deploy to GitHub Pages" workflow running
3. [ ] Wait for workflow to complete (typically 2-5 minutes)
4. [ ] Verify all steps passed (should show green checkmarks)
5. [ ] Check the "Deploy to GitHub Pages" step output for the deployment URL

## Post-Deployment Verification

### 9. Site Accessibility
- [ ] Visit: `https://bytetobinary-com.github.io/angular-material-calendar/`
- [ ] Page loads successfully
- [ ] No 404 errors
- [ ] All resources load (styles, scripts, images)
- [ ] Layout renders correctly
- [ ] Navigation works

### 10. Application Functionality
- [ ] Calendar displays
- [ ] Date picker works
- [ ] Event display works (if enabled)
- [ ] Theme selection works (if available)
- [ ] Responsive design works on mobile
- [ ] No console errors (check browser DevTools)

### 11. Performance Check
```bash
# Check build size
du -sh dist/angular-material-calendar-demo/

# Should be reasonable (typically < 5MB)
```

- [ ] Build size is acceptable (< 10MB)
- [ ] Page load time is reasonable (< 3 seconds)
- [ ] No broken images or resources

## Monitoring & Maintenance

### 12. Continuous Monitoring
- [ ] Setup GitHub Actions notifications (if desired)
- [ ] Monitor deployment logs at: `/actions`
- [ ] Watch for failed deployments

### 13. Documentation
- [ ] Update README with live demo link
- [ ] Document any deployment-specific configurations
- [ ] Create issues for known limitations (if any)

### 14. Future Deployments
For subsequent deployments, you only need to:
1. Make code changes
2. Commit to main: `git commit -m "message"`
3. Push: `git push origin main`
4. GitHub Actions automatically deploys

## Troubleshooting Checklist

If something goes wrong:

### Build Failed
- [ ] Check Actions logs for error messages
- [ ] Review build step output
- [ ] Run local build: `npm run build -- --project=angular-material-calendar-demo --configuration production`
- [ ] Fix errors and push again

### Site Not Loading
- [ ] Verify GitHub Pages is enabled in Settings
- [ ] Clear browser cache (Ctrl+Shift+Del)
- [ ] Check workflow completed successfully
- [ ] Wait 2-3 minutes and refresh
- [ ] Try in incognito mode

### Assets Not Loading
- [ ] Verify baseHref in `angular.json`: `/angular-material-calendar/`
- [ ] Check browser console for 404 errors
- [ ] Rebuild and redeploy

### Routing Issues
- [ ] GitHub Pages handles routing automatically with our configuration
- [ ] If issues persist, check `.nojekyll` file existence
- [ ] Rebuild with `--base-href /angular-material-calendar/`

## Quick Reference Commands

```bash
# Full deployment process
npm install
npm run build -- --project=angular-material-calendar
npm run build -- --project=angular-material-calendar-demo --configuration production
git add .
git commit -m "Deploy to GitHub Pages"
git push origin main

# Or use the helper script
./scripts/deploy.sh

# Monitor deployment
open https://github.com/ByteToBinary-com/angular-material-calendar/actions

# View live site
open https://bytetobinary-com.github.io/angular-material-calendar/
```

## Support & Resources

- **GitHub Pages Docs:** https://docs.github.com/en/pages
- **GitHub Actions Docs:** https://docs.github.com/en/actions
- **Angular Deployment:** https://angular.io/guide/deployment
- **Issues:** https://github.com/ByteToBinary-com/angular-material-calendar/issues

---

**Last Updated:** November 27, 2025
**Deployment Method:** GitHub Actions
**Status:** ✓ Configured and Ready
