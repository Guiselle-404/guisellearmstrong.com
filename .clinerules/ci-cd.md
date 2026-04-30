# CI/CD & Publishing Workflow - GuiselleArmstrong.com

## Recommended Workflow

- All changes should go through a PR before merging to `main` (branch protection enforces this)
- Wait for explicit user request before publishing ("publish", "deploy", "make it live", etc.)
- Always validate locally first: `hugo --minify --noChmod`

### Publishing Steps

1. Build & verify: `hugo --minify --noChmod`
2. Optionally preview: `hugo server` + browser verification
3. Create a descriptive feature branch (e.g., `feature/add-contact-page`, `feature/update-certs`)
4. Commit and push
5. Create PR against `main`
6. Wait for "Build Hugo Site" check to pass
7. Squash merge
8. Deploy via GitHub Actions: https://github.com/Guiselle-404/guisellearmstrong.com/actions/workflows/deploy-github-pages.yml → "Run workflow"

### Branch Naming

- `feature/<description>` for new features or content changes
- `fix/<description>` for bug fixes
- Use descriptive names that summarize what's changing
