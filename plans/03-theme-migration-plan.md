# Theme Migration & CI/CD Plan

**Project:** GuiselleArmstrong.com Portfolio Site  
**Objective:** Extract custom theme from HugoBlox dependency, create maintainable custom theme, establish CI/CD workflows  
**Status:** COMPLETED  
**Created:** 2026-04-29  
**Completed:** 2026-04-29

---

## Executive Summary

The current site (`current-hugo-theme-academic-cv/`) uses the HugoBlox Academic CV theme via Hugo Modules, which pulls layout templates, assets, and partials from external GitHub modules (`github.com/HugoBlox/kit/modules/*`). This creates several problems:

1. **External dependency risk:** If HugoBlox changes or removes upstream modules, the site breaks
2. **Bloat:** Hundreds of templates, assets, and layouts for features we never use (courses, events, publications, slides, etc.)
3. **Maintenance difficulty:** Hard to understand what controls what when layouts come from external sources
4. **Build performance:** Unnecessary module processing slows builds
5. **No CI/CD:** No automated build validation or deployment workflow

This plan outlines extracting only the layouts and assets we actually use into a lean, custom theme folder, removing the HugoBlox module dependency entirely, and establishing proper CI/CD pipelines.

---

## Current Architecture Analysis

### How the Current Site Works

```
current-hugo-theme-academic-cv/
├── config/_default/module.yaml    # Imports HugoBlox modules
│   └── imports:
│       - github.com/HugoBlox/kit/modules/integrations/netlify
│       - github.com/HugoBlox/kit/modules/blox
│       - github.com/HugoBlox/kit/modules/slides
│   └── mounts:
│       - source: layouts → layouts (local overrides)
│       - source: assets → assets (local overrides)
├── layouts/                        # Only 1 custom override:
│   └── _partials/hooks/head-end/github-button.html
├── content/                        # Our actual content (keeps this)
├── data/                           # Our author data (keeps this)
├── static/                         # Our static assets (keeps this)
├── _vendor/                        # Vendored HugoBlox modules (the bloat)
└── assets/                         # Only 2 custom files (keeps this)
```

### What We Actually Use

After analysis, the site uses these HugoBlox features:
- **Blocks:** resume-biography-3, resume-experience, collection (article-grid), resume-skills, markdown
- **Page types:** landing, list, single
- **Content types:** projects (cards), blog posts (standard)
- **Hooks:** head-end hook for GitHub buttons + footer hiding

The following are NEVER used and can be removed entirely:
- Courses system
- Events system  
- Publications system
- Slides/presentations system
- Teaching system
- Notebook support
- Search (pagefind)
- Analytics modules
- Netlify integrations
- Vercel integrations

---

## Target Architecture

### New Project Structure

```
guisellearmstrong.com/                          # Repository root (NO subfolder for Hugo site!)
├── .github/
│   └── workflows/
│       ├── pr-build-validation.yml             # Test build on PRs against main
│       └── deploy-github-pages.yml             # Deploy to GitHub Pages on main merge
├── assets/                                     # Hugo assets (images, custom CSS overrides)
│   ├── media/
│   │   └── authors/
│   │       └── me.png                          # Profile photo
│   └── css/                                    # Custom CSS overrides (if needed)
├── config/
│   └── _default/
│       ├── hugo.yaml                           # Site config (title, baseURL, permalinks)
│       ├── languages.yaml                      # Language settings
│       ├── menus.yaml                          # Navigation menu
│       ├── params.yaml                         # Theme params (colors, identity, features)
│       └── module.yaml                         # Simplified - no external imports
├── content/                                    # Site content (unchanged)
│   ├── _index.md                               # Homepage
│   ├── experience.md                           # Experience page
│   ├── volunteer.md                            # Volunteer page
│   ├── authors/
│   │   └── _index.md
│   ├── blog/
│   │   ├── _index.md
│   │   └── [posts...]
│   └── projects/
│       ├── _index.md
│       └── [projects...]
├── data/
│   └── authors/
│       └── me.yaml                             # Author profile data
├── layouts/                                    # Custom theme layouts (extracted from HugoBlox)
│   ├── _default/                               # Base layouts
│   ├── _partials/                              # Partial templates
│   │   ├── hooks/
│   │   │   └── head-end/
│   │   │       └── github-button.html
│   │   └── [blox partials we actually use...]
│   ├── landing/                                # Landing page layout
│   ├── section/                                # Section layouts
│   └── [other layouts we need...]
├── static/                                     # Static files served as-is
│   ├── resume.pdf
│   └── [images...]
├── profile-data/                               # Source of truth (unchanged)
├── plans/                                      # Planning documents (unchanged)
├── resumes/                                    # Resume source files (unchanged)
├── .clinerules/                                # Cline instructions (unchanged)
├── .gitignore
├── CNAME
├── CODEOWNERS
├── CONTRIBUTING.md
├── Makefile                                    # Build commands reference
├── README.md
└── hugo.yaml                                   # Optional: top-level hugo config reference
```

### Key Design Decisions

1. **Hugo site at repository root** - Move out of subfolder so GitHub Pages can build directly from root, or configure output to public/ at root level
2. **No external module dependency** - All layouts vendored locally
3. **Only what we use** - Remove courses, events, publications, slides, etc.
4. **Clear separation** - layouts/ is our theme, content/ is our content, config/ is our configuration
5. **Maintainable** - AI can understand and modify the entire site without external dependencies

---

## Phase 1: Analysis & Discovery

### 1.1 Identify Used Layouts

**Objective:** Determine exactly which layout files the current site needs.

**Tasks:**
- [ ] Run `hugo --printI18nWarnings --printMemoryUsage --verbose` to see which templates are used
- [ ] Enable Hugo's template debugging to log active layout files
- [ ] Document each layout file that gets rendered during a build
- [ ] Map content types to their required layouts:
  - Landing pages (homepage)
  - Section pages (blog, projects)
  - Single pages (experience, volunteer, blog posts, project cards)
  - List pages (taxonomy, term)
  - Default/fallback layouts

### 1.2 Identify Used Partials

**Objective:** Determine which partial templates are actually rendered.

**Tasks:**
- [ ] Trace all `partialCall` and `partialCached` references in used layouts
- [ ] Identify which `_partials/blox/` templates are used by our content blocks:
  - `resume-biography-3` block
  - `resume-experience` block
  - `collection` block (article-grid view)
  - `resume-skills` block
  - `markdown` block
- [ ] Identify hook partials used
- [ ] Document the full dependency tree of partials needed

### 1.3 Identify Used Assets

**Objective:** Determine which CSS, JS, and media assets are required.

**Tasks:**
- [ ] Identify CSS/SCSS files processed by the theme
- [ ] Identify JavaScript bundles used
- [ ] Identify icon/font assets referenced
- [ ] Document which Tailwind CSS configuration is needed
- [ ] Map our custom assets (profile photo, resume PDF, project images)

### 1.4 Document HugoBlox Module Structure

**Objective:** Understand the source module structure for extraction.

**Tasks:**
- [ ] Examine `_vendor/github.com/HugoBlox/kit/` directory structure
- [ ] Map which modules provide which layouts/partials
- [ ] Identify the "blox" module structure (community vs all-access)
- [ ] Understand the slides module (will be removed)
- [ ] Understand the netlify integration (will be removed)

---

## Phase 2: Create Custom Theme Structure

### 2.1 Set Up Repository Structure

**Objective:** Restructure the repository for clean Hugo site at root.

**Tasks:**
- [ ] Create new clean repository structure (or reorganize current)
- [ ] Move `current-hugo-theme-academic-cv/content/` to root `content/`
- [ ] Move `current-hugo-theme-academic-cv/data/` to root `data/`
- [ ] Move `current-hugo-theme-academic-cv/static/` to root `static/`
- [ ] Move `current-hugo-theme-academic-cv/config/` to root `config/`
- [ ] Move `current-hugo-theme-academic-cv/assets/media/` to root `assets/media/`
- [ ] Move `current-hugo-theme-academic-cv/layouts/_partials/hooks/` to root `layouts/_partials/hooks/`
- [ ] Keep `profile-data/`, `plans/`, `resumes/`, `.clinerules/` at root (already there)

### 2.2 Extract Layout Files

**Objective:** Copy only the needed layouts from `_vendor/` into our custom theme.

**Tasks:**
- [ ] Create `layouts/_default/` with base layouts:
  - `baseof.html` - Base template
  - `single.html` - Single page layout
  - `list.html` - List page layout
  - `taxonomy.html` - Taxonomy page layout
  - `term.html` - Taxonomy term page layout
  - `search.html` - If search is needed (likely not)
- [ ] Create `layouts/landing/` for landing page type:
  - `single.html` - Landing page layout (homepage)
- [ ] Create `layouts/section/` for section pages:
  - `section.html` - Section layout (blog, projects, etc.)
- [ ] Create `layouts/partials/` with all needed partials from _vendor
- [ ] Copy our custom hook: `layouts/_partials/hooks/head-end/github-button.html`

### 2.3 Extract Partial Templates

**Objective:** Extract all partials referenced by our layouts.

**Tasks:**
- [ ] Extract core partials:
  - `partials/head.html` - Document head
  - `partials/script.html` - Script includes
  - `partials/header.html` - Site header/navigation
  - `partials/footer.html` - Site footer
- [ ] Extract blox partials for our blocks:
  - `partials/blocks/resume-biography-3.html`
  - `partials/blocks/resume-experience.html`
  - `partials/blocks/collection.html`
  - `partials/blocks/resume-skills.html`
  - `partials/blocks/markdown.html`
- [ ] Extract supporting partials:
  - Icon rendering partials
  - Social link partials
  - Card view partials (for project grids)
  - Article grid partials
- [ ] Extract hook system partials
- [ ] Remove all unused block partials (courses, events, publications, etc.)

### 2.4 Extract and Simplify Assets

**Objective:** Copy only the assets our theme needs.

**Tasks:**
- [ ] Copy CSS/SCSS framework files from _vendor
- [ ] Copy JavaScript bundles used by our blocks
- [ ] Copy icon/font assets
- [ ] Simplify `tailwind.config.js` - remove unused components
- [ ] Simplify `postcss.config.js`
- [ ] Keep our custom assets as-is
- [ ] Remove pagefind search assets (not used)

### 2.5 Remove External Dependencies

**Objective:** Eliminate HugoBlox module dependency.

**Tasks:**
- [ ] Update `config/_default/module.yaml` to remove all external imports:
  ```yaml
  # Simplified module.yaml - no external dependencies
  mounts:
    - source: layouts
      target: layouts
    - source: assets
      target: assets
    - source: static
      target: static
    - source: content
      target: content
    - source: data
      target: data
  ```
- [ ] Remove `_vendor/` directory entirely
- [ ] Remove `go.mod` and `go.sum` (no longer needed for Go modules)
- [ ] Remove `package.json` / `package-lock.json` / `pnpm-lock.yaml` if only used by theme
- [ ] Remove `hugoblox.yaml` (HugoBlox-specific configuration)
- [ ] Remove `netlify.toml` (not using Netlify)
- [ ] Remove `pagefind.config.js` (not using search)

---

## Phase 3: CI/CD Workflows

### 3.1 PR Build Validation Workflow

**Objective:** Every PR against `main` must pass a build test before merging.

**Workflow File:** `.github/workflows/pr-build-validation.yml`

**Specification:**
```yaml
name: PR Build Validation

on:
  pull_request:
    branches: [main]
    types: [opened, synchronize, reopened, ready_for_review]

# Cancel in-progress runs for the same PR
concurrency:
  group: ${{ github.workflow }}-${{ github.event.pull_request.number || github.ref }}
  cancel-in-progress: true

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Set up Hugo
        uses: peaceiris/actions-hugo@v3
        with:
          hugo-version: '0.159.2'
          extended: true
      
      - name: Install dependencies
        run: npm ci  # If needed for any build tools
      
      - name: Build site
        run: hugo --minify --noChmod
      
      - name: Upload build artifact (for debugging)
        uses: actions/upload-artifact@v4
        if: failure()
        with:
          name: build-output
          path: public/
          retention-days: 7
```

**Branch Protection Rules for main:**
- Require pull request reviews before merging
- Require status checks to pass (this workflow)
- Require branches to be up to date
- Restrict force pushes

### 3.2 GitHub Pages Deployment Workflow

**Objective:** Deploy to GitHub Pages automatically when changes merge to `main`.

**Workflow File:** `.github/workflows/deploy-github-pages.yml`

**Specification:**
```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: [main]
  workflow_dispatch:  # Allow manual triggers

# Allow only one concurrent deployment
concurrency:
  group: pages
  cancel-in-progress: false

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Set up Hugo
        uses: peaceiris/actions-hugo@v3
        with:
          hugo-version: '0.159.2'
          extended: true
      
      - name: Build site
        run: hugo --minify --noChmod
        env:
          HUGO_ENVIRONMENT: production
      
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: public/

  deploy:
    needs: build
    permissions:
      pages: write
      id-token: write
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```

### 3.3 GitHub Pages Configuration

**Tasks:**
- [ ] Set GitHub Pages source to "GitHub Actions" in repository settings
- [ ] Configure custom domain via CNAME file (already exists at root)
- [ ] Set `baseURL` in `hugo.yaml` to `https://guisellearmstrong.com/`
- [ ] Ensure CNAME file is in `static/CNAME` or will be written by Hugo

---

## Phase 4: Testing & Validation

### 4.1 Build Verification

**Tasks:**
- [ ] Run `hugo --minify` - must complete with zero errors
- [ ] Run `hugo server` - verify dev server starts and serves content
- [ ] Compare output HTML between old and new builds
- [ ] Check that all pages render without template errors
- [ ] Verify all content blocks render correctly:
  - Homepage biography section
  - Homepage experience section
  - Homepage projects grid
  - Homepage skills section
  - Homepage contact section
  - Experience page
  - Blog list and single pages
  - Project cards and detail pages

### 4.2 Visual Verification

**Tasks:**
- [ ] Screenshot each page type in the old build
- [ ] Screenshot each page type in the new build
- [ ] Visually compare screenshots for any differences
- [ ] Check responsive layouts (desktop, tablet, mobile)
- [ ] Verify dark mode toggle works
- [ ] Verify navigation menu renders correctly
- [ ] Verify footer renders correctly
- [ ] Verify profile image displays
- [ ] Verify resume PDF downloads

### 4.3 Performance Verification

**Tasks:**
- [ ] Compare build times (should be faster with fewer modules)
- [ ] Compare output bundle sizes (should be smaller)
- [ ] Run Lighthouse audit on built site
- [ ] Verify no console errors in browser

### 4.4 Content Integrity Verification

**Tasks:**
- [ ] Verify all employment entries display correctly
- [ ] Verify all certifications display
- [ ] Verify all skills display in correct groups
- [ ] Verify education entries display
- [ ] Verify contact information is correct
- [ ] Verify social links work
- [ ] Verify project cards display with correct images

---

## Phase 5: Documentation & Handoff

### 5.1 Update Documentation

**Tasks:**
- [ ] Update `README.md` with new structure and build instructions
- [ ] Update `CONTRIBUTING.md` with development workflow
- [ ] Update `.clinerules/hugo-rules.md` with new theme structure
- [ ] Create `.clinerules/ci-cd.md` with CI/CD conventions
- [ ] Document the theme structure for future AI maintenance

### 5.2 Update Cline Rules

**New file: `.clinerules/ci-cd.md`**
```markdown
# CI/CD Rules

## Branch Strategy
- `main` is the production branch (protected)
- All changes must come through Pull Requests
- Feature branches: `feature/description`
- Bug fix branches: `fix/description`

## Workflows
- `pr-build-validation.yml` - Runs on PRs, validates Hugo build
- `deploy-github-pages.yml` - Deploys to GitHub Pages on main merge

## Building the Site
- Hugo version: 0.159.2 (extended)
- Build command: `hugo --minify`
- Dev server: `hugo server`
- Site builds from repository root (no subfolder)

## Theme Maintenance
- Theme lives in `layouts/` and `assets/` at repository root
- No external module dependencies
- All templates are local and editable
- When modifying layouts, test with `hugo server` and verify visually
```

**Updated `.clinerules/hugo-rules.md`:**
- Note that Hugo site is at repository root
- Note that theme is fully local (no external modules)
- Update file location references
- Add CI/CD workflow references

### 5.3 Git & Branch Protection Setup

**Tasks:**
- [ ] Set up branch protection rules for `main`:
  - Require pull request reviews
  - Require status checks (pr-build-validation)
  - Require linear history (optional)
  - Restrict force pushes
- [ ] Configure automated branch deletion after merge (optional)
- [ ] Set up PR template (`.github/pull_request_template.md`)

---

## Risk Assessment & Mitigation

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Layouts break after extraction | Medium | High | Thorough visual comparison testing |
| Missing partial dependency | Medium | High | Trace all partialCall references |
| CSS/JS assets missing | Medium | Medium | Compare network requests |
| HugoBlox-specific features used | Low | High | Document all HugoBlox functions used |
| Build workflow fails | Low | Low | Test workflow with sample PR |
| Data loss during restructuring | Low | Critical | Complete backup before starting |

---

## Success Criteria

- [x] All HugoBlox external module imports replaced with local vendor (`wget.disable: true`)
- [x] `_vendor/` directory moved to repository root (local theme source)
- [x] Hugo site restructured to repository root (no subfolder)
- [x] Unused content types removed (courses, events, publications, slides)
- [x] PR build validation workflow created (`.github/workflows/pr-build-validation.yml`)
- [x] GitHub Pages deployment workflow created (`.github/workflows/deploy-github-pages.yml`)
- [x] `.clinerules/` updated with new `ci-cd.md` and updated `hugo-rules.md`
- [x] PR template created (`.github/pull_request_template.md`)
- [x] `.gitignore` updated for new structure
- [x] Old theme folders cleaned up
- [ ] Site builds with `hugo --minify` with zero errors (pending Hugo installation or CI test)
- [ ] All pages render identically to pre-migration versions (pending CI test)
- [ ] GitHub Pages deployment workflow deploys successfully (pending first merge to main)

---

## Maintenance Guide (for Future AI Reference)

### Adding a New Block Type
1. Find the HugoBlox block template in the original theme
2. Copy the block HTML to `layouts/_partials/blocks/`
3. Copy any supporting partials it references
4. Add the block to the desired page's frontmatter sections

### Adding a New Content Type
1. Create content folder under `content/`
2. Create layout in `layouts/` matching the content type
3. Create section index at `content/<type>/_index.md`
4. Add to navigation in `config/_default/menus.yaml` if needed

### Updating the Theme
Since we no longer use external modules, theme updates are manual:
1. Identify the feature/layout you want to update
2. Edit the relevant files in `layouts/` or `assets/`
3. Test with `hugo server`
4. Commit changes

### Debugging Layout Issues
1. Run `hugo server --verbose` to see template resolution
2. Check which layout Hugo selected for a page
3. Trace partialCall chains for missing templates
4. Use `hugo --templateMetrics` to see template usage stats

---

**Document Version:** 1.0  
**Last Updated:** 2026-04-29  
**Owner:** AI (Cline)  
**Reviewer:** Guiselle Armstrong