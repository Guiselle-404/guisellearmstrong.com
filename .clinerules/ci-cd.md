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
3. **Create descriptive feature branch:** Create a branch name that describes the changes being published (e.g., `feature/add-contact-page`, `feature/update-certifications`, `feature/redesign-homepage`). Summarize the key changes in the branch name using kebab-case.
4. **Commit all changes:** `git add -A && git commit -m "<descriptive message summarizing all changes>"`
5. **Push branch:** `git push origin <descriptive-branch-name>`
6. **Create PR** against `main` via GitHub MCP with a descriptive title and body listing all changes
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
10. **After merge:** Inform user changes are being published and should appear soon publicly. Otherwise check the GitHub Actions for failures on the Deploy to GitHub Pages workflow.

## Branch Naming

- Feature branches: `feature/<description-of-changes>` — e.g., `feature/add-contact-page`, `feature/update-certifications-list`, `feature/simplify-homepage`
- Bug fix branches: `fix/<description-of-fix>` — e.g., `fix/typo-in-bio`, `fix/broken-link`
- Publish branches: Always describe what's being published, never use generic names like `publish-changes` or `update`
- Commit messages: Summarize all changes being published in the commit message and PR description
