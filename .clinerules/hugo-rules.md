# Hugo Development Conventions - GuiselleArmstrong.com

## Theme Information
- **Original Theme Repo:** https://github.com/HugoBlox/hugo-theme-academic-cv
- **Tailwind CSS:** v4 (CSS-based configuration)
- **Hugo:** Extended version required

## Site Structure

- Hugo site lives at the **repository root** — run all Hugo commands from there
- `config/_default/` — Hugo configuration (hugo.yaml, params.yaml, menus.yaml, etc.)
- `layouts/` — Custom layout overrides for vendored theme
- `_vendor/github.com/HugoBlox/kit/modules/` — Local vendor theme (no external dependencies)

## Key Files
- **Author profile:** `data/authors/me.yaml` — Main profile (bio, skills, certifications, experience)
- **Homepage:** `content/_index.md` — Landing page sections
- **Navigation:** `config/_default/menus.yaml`
- **Profile image:** `assets/media/authors/me.png`
- **Resume PDF:** `static/resume.pdf`

## Commands
- `hugo server` — Start dev server
- `hugo --minify --noChmod` — Production build
- `pnpm install` — Node dependencies

## File Locations Reference

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