# CI/CD & Publishing Workflow - GuiselleArmstrong.com

## 🚨 CRITICAL RULES

1. **NEVER push directly to `main`** — All changes MUST go through a Pull Request
2. **NEVER publish without explicit user request** — Make changes locally, wait for "publish"
3. **ALWAYS validate locally before publishing** — Build must pass with `hugo --minify --noChmod`

## Default Workflow: Local Changes Only

For all content updates, edits, and changes:
- Modify files locally
- Test with `hugo --minify --noChmod` to verify the build
- **Do NOT create a PR or push** — The user works iteratively, making multiple changes before publishing
- Inform the user the changes are ready and tested

## When User Says "Publish"

Only when the user explicitly says:
- "publish it", "push it to public", "deploy the changes", "make it live", "push the site", "publish the site", "merge all changes"

### Publishing Steps

1. **Build & verify locally:** `hugo --minify --noChmod` — must succeed with zero errors
2. **Validate visually:** Start `hugo server`, use browser_action to scroll through the homepage and verify all sections render correctly
3. **Create feature branch:** `git checkout -b feature/publish-changes`
4. **Commit all changes:** `git add -A && git commit -m "<descriptive message>"`
5. **Push branch:** `git push origin feature/publish-changes`
6. **Create PR** against `main` via GitHub MCP
7. **Wait for build checks** (poll every 25s, max 3 min):
   - Use `pull_request_read` with `get_check_runs` method
   - "Build Hugo Site" must have `conclusion: "success"`
8. **If build passes:** Merge PR (squash merge)
9. **If build fails:**
   - **Simple fix** (typo, YAML syntax): Fix locally, push to same branch, wait for build again
   - **Complex/unclear issue:** STOP and alert the user with:
     - What the error is and where it occurred
     - 2-3 suggested fixes
     - Ask how to proceed
10. **After merge:** Inform user changes are on `main`. Deployment to the live site requires manual trigger via GitHub Actions.

## Deployment to Live Site

After merging to `main`, the user must manually trigger deployment:
1. Go to https://github.com/Guiselle-404/guisellearmstrong.com/actions/workflows/deploy-github-pages.yml
2. Click "Run workflow" → select "main" → click "Run workflow"

## Branch Naming

- Feature branches: `feature/description`
- Bug fix branches: `fix/description`