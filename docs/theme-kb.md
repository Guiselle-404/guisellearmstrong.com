# HugoBlox Academic CV Theme - Local Knowledge Base

> **Original Theme Repo:** https://github.com/HugoBlox/hugo-theme-academic-cv
> **Original Theme Docs:** https://docs.ownable.dev/
> **Last Updated:** 2026-04-29

## Overview

This site uses the "HugoBlox Academic CV" theme (based on HugoBlox/kit framework). The theme is vendored locally in `_vendor/` with no external module dependencies.

## Core Architecture

### Theme Loading
- **No external imports** - All modules are vendored locally in `_vendor/`
- `config/_default/module.yaml` sets `wget.disable: true`
- Theme modules vendored: `blox`, `slides`, `analytics`, `integrations/netlify`
- **Layout overrides** go in `layouts/` directory

### CSS System (Tailwind v4)
- **NO `tailwind.config.js` or `postcss.config.js` needed** - Tailwind v4 uses CSS-based configuration
- CSS handled by `css.html` partial: `resources.Get "css/main.css"` → `css.TailwindCSS`
- Theme config in `_vendor/.../assets/css/config/tailwind.css`
- Do NOT create `assets/css/_entry.css`

### Author System
- **Primary author data:** `data/authors/me.yaml` - This is the main profile
- **Author content:** `content/authors/_index.md`
- **Profile image:** `assets/media/authors/me.png`

---

## Available HugoBlox Blocks

### Blocks Used on Our Site

| Block | Used On | Description |
|-------|---------|-------------|
| `resume-biography-3` | Homepage | Bio section with name, title, summary, button |
| `resume-experience` | Homepage | Work experience timeline (from me.yaml) |
| `collection` | Homepage | Project cards from `content/projects/` |
| `resume-skills` | Homepage | Skills from me.yaml |
| `resume-awards` | Homepage | Certifications from me.yaml |
| `markdown` | Homepage | Custom markdown (Get in Touch section) |

### All Available Blocks (for reference)

| Block | Purpose |
|-------|---------|
| `hero` | Full-width hero section |
| `search-hero` | Hero with search functionality |
| `resume-biography` | Bio with image and text |
| `resume-biography-3` | Bio with button, interests, contact |
| `resume-experience` | Experience timeline from author YAML |
| `resume-skills` | Skills grouped by category |
| `resume-awards` | List of awards/certifications |
| `resume-languages` | Language proficiency list |
| `collection` | Grid/list of content items (blog, projects, etc.) |
| `features` | Feature grid/icons |
| `faq` | FAQ accordion |
| `stats` | Number statistics |
| `testimonials` | Testimonial quotes |
| `logos` | Logo carousel |
| `tech-stack` | Technology logos list |
| `markdown` | Raw markdown content |
| `contact-info` | Contact details |
| `cta-button-list` | Call-to-action buttons |
| `cta-card` | CTA card |
| `portfolio` | Portfolio grid |

---

## Block Configuration Reference

### resume-biography-3
```yaml
- block: resume-biography-3
  content:
    username: me  # References data/authors/me.yaml
    button:
      text: Download Resume
      url: resume.pdf
    text: |        # Bio markdown text
    email: email@example.com
    gradient_text: true
    interests:
      title: Interests
      items:
        - name: Interest Name
          icon: icon-name  # Font Awesome icon
```

### resume-experience
```yaml
- block: resume-experience
  content:
    title: Experience
    user: me
    date_format: Jan 2006  # Go date format
    user_resource_limit: 3  # Max entries to show
```

### collection
```yaml
- block: collection
  content:
    title: Projects
    filters:
      folders:
        - projects  # content/projects/
      tags:
        - tag-name  # Optional
      page_type: page  # Optional
    archive:
      enable: true
      text: See all
      link: /projects/
  design:
    view: article-grid  # card, article-grid, article-grid-simple
    columns: 3          # 1-4
    show_date: false     # Hide dates on cards
    fill_image: true     # Fill images to card size
    show_read_time: true
    show_read_more: true
```

### resume-skills
```yaml
- block: resume-skills
  content:
    title: Skills
    user: me  # References data/authors/me.yaml
```

### resume-awards
```yaml
- block: resume-awards
  content:
    title: Certifications
    user: me  # References data/authors/me.yaml
```

### markdown
```yaml
- block: markdown
  content:
    title: Section Title
    text: |      # Markdown content
      Line 1
      Line 2
```

---

## Front Matter Fields

### Content Pages (projects, blog posts)
```yaml
---
title: 'Page Title'
summary: 'Brief description shown on cards'
tags: [tag1, tag2]
date: 2024-01-01
featured: false

image:
  focal_point: Smart  # Smart, Center, Top, TopLeft, etc.
---
```

### Landing Pages (homepage)
```yaml
---
title: ''
summary: ''
date: 2024-01-01
type: landing

design:
  spacing: '6rem'  # Section spacing

sections:
  # Blocks go here (see above)
---
```

---

## Hugo Configuration

### Key Config Files

| File | Purpose |
|------|---------|
| `config/_default/hugo.yaml` | Site title, baseURL, build settings |
| `config/_default/params.yaml` | Identity, theme, layout, SEO |
| `config/_default/menus.yaml` | Navigation menu |
| `config/_default/languages.yaml` | Language config |
| `config/_default/module.yaml` | Hugo module config |

### Important hugo.yaml Settings
- `publishDir: public`
- `uglyURLs: false`
- `disableAliases: true`
- `ignoreFiles` - Patterns for content types we don't use

### Important params.yaml Sections
- `identity` - Name, title, email, phone
- `theme` - Day/night mode, custom CSS
- `seo` - Open Graph, Twitter card settings

---

## Commands

```bash
# Dev server
hugo server

# Production build
hugo --minify --noChmod

# Hugo version required: 0.159.2 (extended)
```

---

## Local Customizations

### Layout Overrides (`layouts/`)
- `_partials/hooks/head-end/github-button.html` - GitHub button script, hides HugoBlox footer

### Static Assets
- `static/resume.pdf` - Resume download
- `static/*.jpeg` - Project images

---

## Troubleshooting

### Common Issues
1. **Build fails** - Check YAML syntax, especially quotes and dashes
2. **Block not rendering** - Verify block name matches available blocks
3. **Images not showing** - Check `featured.jpg` exists in content folder
4. **Styles not applied** - The theme uses Tailwind v4; custom CSS goes in `assets/css/`

### Debugging
- Run `hugo server` to see live errors in terminal
- Check browser console for JavaScript errors
- Verify all YAML indentation is correct