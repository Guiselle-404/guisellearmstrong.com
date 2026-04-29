# CI/CD Rules - GuiselleArmstrong.com

## Branch Strategy
- `main` is the production branch (protected)
- All changes must come through Pull Requests against `main`
- Feature branches: `feature/description`
- Bug fix branches: `fix/description`
- Do NOT push directly to `main`

## GitHub Actions Workflows

### PR Build Validation (`.github/workflows/pr-build-validation.yml`)
- **Trigger:** Pull requests opened/updated against `main`
- **Purpose:** Validate that the Hugo site builds successfully
- **Behavior:** Cancels previous runs for same PR on new pushes
- **On failure:** Uploads build output artifact for debugging
- **Required:** Must pass before PR can be merged

### GitHub Pages Deployment (`.github/workflows/deploy-github-pages.yml`)
- **Trigger:** Pushes to `main` branch or manual `workflow_dispatch`
- **Purpose:** Build and deploy site to GitHub Pages
- **Behavior:** Only one deployment runs at a time (concurrency group)
- **Environment:** Uses GitHub Pages environment with OIDC authentication

## Building the Site Locally

### Prerequisites
- Hugo Extended version **0.159.2**
- Node.js with pnpm

### Commands
```bash
# Install dependencies
pnpm install

# Start development server
hugo server

# Build for production
hugo --minify --noChmod
```

### Site Structure
- Hugo site is at **repository root** (no subfolder)
- Output goes to `public/` directory
- Theme is fully local in `_vendor/` (no external module dependencies)

## Theme Maintenance
- Theme lives in `layouts/` (overrides) and `_vendor/` (source) at repository root
- No external module dependencies - all templates are vendored locally
- When modifying layouts:
  1. Edit files in `layouts/` directory
  2. Test with `hugo server`
  3. Verify visually in browser
  4. Commit changes

## Working with the Repository

### Making Changes
1. Create a feature branch: `git checkout -b feature/description`
2. Make your changes
3. Test locally with `hugo server` if possible
4. Commit with descriptive messages
5. Push and create a Pull Request against `main`
6. Wait for PR build validation workflow to pass
7. Request review if required

### Content Updates
- Always source professional data from `profile-data/structured/` JSON files
- Update `data/authors/me.yaml` for profile changes
- Update `content/_index.md` for homepage section changes
- Update `content/experience.md` for experience page changes

### Emergency Deploy
If you need to trigger a manual deployment:
1. Go to GitHub Actions tab
2. Select "Deploy to GitHub Pages" workflow
3. Click "Run workflow" button

## Branch Protection Rules (to be configured)
- Require pull request reviews before merging
- Require status checks to pass (pr-build-validation)
- Require branches to be up to date before merging
- Restrict force pushes to `main`