# Hugo Development Rules - GuiselleArmstrong.com

## Theme Information
- **Original Theme Repo:** https://github.com/HugoBlox/hugo-theme-academic-cv
- **Theme Name:** HugoBlox Academic CV Starter
- **Tailwind CSS:** v4 (CSS-based configuration, no JS config files needed)
- **Hugo Required:** Extended version (for `css.TailwindCSS` pipeline)

## Hugo Site Structure

### Site Root
The Hugo site lives at the **repository root** (`/Users/gisi/code/guisellearmstrong.com`). All Hugo commands must be run from the repository root.

### Configuration Files
- `config/_default/hugo.yaml` - Site title, baseURL, build settings, permalinks
- `config/_default/params.yaml` - HugoBlox theme params (identity, theme, layout, SEO)
- `config/_default/menus.yaml` - Navigation menu structure
- `config/_default/languages.yaml` - Language configuration
- `config/_default/module.yaml` - Hugo module config (local vendor only, no external imports)

### Theme Architecture
- **Original theme:** https://github.com/HugoBlox/hugo-theme-academic-cv
- **Local vendor theme:** `_vendor/github.com/HugoBlox/kit/modules/` contains all theme layouts, partials, and assets
- **Modules vendored:** `blox`, `slides`, `analytics`, `integrations/netlify`
- **No external dependencies:** All modules are vendored locally; `wget.disable: true` prevents network access
- **Local overrides:** `layouts/` directory overrides any vendored template
- **Custom hook:** `layouts/_partialhooks/head-end/github-button.html` adds GitHub button script and hides HugoBlox footer

### CSS Pipeline (Tailwind v4)
- **NO `tailwind.config.js` or `postcss.config.js` needed** - Tailwind v4 uses CSS-based configuration
- CSS is handled by `css.html` partial: `resources.Get "css/main.css"` → `css.TailwindCSS`
- `tailwind_sources.html` partial generates dynamic `@source` directives for class scanning
- `main.css` in the vendor uses `@import "tailwindcss"` and `@source` directives (Tailwind v4 syntax)
- **Important:** Do NOT create `assets/css/_entry.css` - the vendor's `css.html` handles everything
- Theme config is in `_vendor/.../assets/css/config/tailwind.css` (uses `@plugin`, `@source`, `@custom-variant`)

### Author System
- **Primary author data:** `data/authors/me.yaml` - This is the main profile
- **Author content:** `content/authors/_index.md` - Author page content
- **Profile image:** `assets/media/authors/me.png`

### Content Organization
- **Homepage:** `content/_index.md` - Landing page with resume-biography-3, experience, projects, skills, contact blocks
- **Experience:** `content/experience.md` - Dedicated experience page
- **Blog posts:** `content/blog/` - Blog article folders
- **Projects:** `content/projects/` - Project showcase cards
- **Content types actively used:** blog, projects, authors, landing pages (experience, volunteer)
- **Content types disabled:** courses, events, publications, slides (ignored via `ignoreFiles` in hugo.yaml)

## Development Commands

### Start Development Server
```bash
hugo server
```

### Build for Production
```bash
hugo --minify --noChmod
```

### Install Node Dependencies (for asset processing)
```bash
pnpm install
```

## Content Update Rules

### When Updating Author Profile (me.yaml)
- Always source data from `profile-data/structured/` JSON files
- Keep education section aligned with `education.json`
- Keep experience section aligned with `employment.json`
- Keep skills section aligned with `skills.json`
- Keep certifications aligned with `certifications.json`

### When Updating Homepage (_index.md)
- The `resume-biography-3` block pulls from `data/authors/me.yaml`
- Button links to `/resume.pdf` (exists in `static/resume.pdf`)
- Keep homepage concise; don't add verbose text

### When Adding Experience Entries
- Use `content/experience.md` for the overview page
- Format: mutex title, organization, dates, location, bullet-point achievements

### Menu Navigation (menus.yaml)
- Main menu items: Home, Experience, Projects, Contact
- Keep it simple and recruiter-friendly
- Weights control ordering (lower = first)

### Adding New Blocks
1. Find the block template in `_vendor/github.com/HugoBlox/kit/modules/blox/blox/`
2. Copy to `layouts/_partials/blox/` if you need to override it
3. Add the block to the desired page's frontmatter sections

## Theme Maintenance

### No External Module Updates
Since all modules are vendored locally, there are no external module updates to worry about. The site is fully self-contained.

### Adding Missing Partials
If a block is missing a partial:
1. Find it in `_vendor/github.com/HugoBlox/kit/modules/blox/layouts/_partials/`
2. Copy it to `layouts/_partials/` maintaining the same directory structure
3. Trace any sub-dependencies it has and copy those too

### File Locations Quick Reference

| What to Change | Where to Edit |
|----------------|---------------|
| Site name/tagline | `config/_default/params.yaml` → `identity` |
| Author bio/skills/certs | `data/authors/me.yaml` |
| Homepage sections | `content/_index.md` |
| Experience page | `content/experience.md` |
| Navigation menu | `config/_default/menus.yaml` |
| Profile photo | `assets/media/authors/me.png` |
| Resume PDF | `static/resume.pdf` |
| SEO settings | `config/_default/params.yaml` → `seo` |
| Theme colors | `config/_default/params.yaml` → `theme` |
| Custom layout overrides | `layouts/` directory |