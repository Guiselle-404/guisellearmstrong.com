# Hugo Development Rules - GuiselleArmstrong.com

## Hugo Site Structure

### Site Root
The Hugo site lives in `hugo-theme-academic-cv/`. All Hugo commands must be run from this directory.

### Configuration Files
- `config/_default/hugo.yaml` - Site title, baseURL, build settings
- `config/_default/params.yaml` - HugoBlox theme params (identity, theme, layout, SEO)
- `config/_default/menus.yaml` - Navigation menu structure
- `config/_default/languages.yaml` - Language configuration
- `config/_default/module.yaml` - Hugo module dependencies

### Author System
- **Primary author data:** `data/authors/me.yaml` - This is the main profile
- **Author content:** `content/authors/_index.md` - Author page content
- **Profile image:** `assets/media/authors/me.png`

### Content Organization
- **Homepage:** `content/_index.md` - Landing page with resume-biography-3 block
- **Experience:** `content/experience.md` - Dedicited experience page
- **Blog posts:** `content/blog/` - Blog article folders
- **Projects:** `content/projects/` - Project showcase cards
- **Publications:** `content/publications/` - Academic/publication entries

## Development Commands

### Start Development Server
```bash
cd hugo-theme-academic-cv && hugo server
```

### Build for Production
```bash
cd hugo-theme-academic-cv && hugo --minify
```

### Install Dependencies
```bash
cd hugo-theme-academic-cv && pnpm install
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
- Button links to `uploads/resume.pdf` (must exist in `static/uploads/`)
- Don't add verbose text; keep homepage concise

### When Adding Experience Entries
- Create folders under `content/experience/` for detailed entries
- Use `content/experience.md` for the overview page
- Format: mutex title, organization, dates, location, bullet-point achievements

### Menu Navigation (menus.yaml)
- Main menu items: Home, Experience, Projects, Contact
- Keep it simple and recruiter-friendly
- Weights control ordering (lower = first)

## Theme Customization

### Colors
- Primary/secondary colors set in `params.yaml` under `hugoblox.theme.colors`
- Use Tailwind palette names or hex values

### Typography
- Font pack: `hugoblox.typography.pack` (default: "academic")

### Background
- Gradient mesh enabled by default on biography section
- Controlled in `content/_index.md` under `design.background`

## File Locations Quick Reference

| What to Change | Where to Edit |
|----------------|---------------|
| Site name/tagline | `config/_default/params.yaml` → `identity` |
| Author bio/skills/certs | `data/authors/me.yaml` |
| Homepage sections | `content/_index.md` |
| Experience page | `content/experience.md` |
| Navigation menu | `config/_default/menus.yaml` |
| Profile photo | `assets/media/authors/me.png` |
| Resume PDF | `static/uploads/resume.pdf` |
| SEO settings | `config/_default/params.yaml` → `seo` |