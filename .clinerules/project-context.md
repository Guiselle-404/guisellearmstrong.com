# Project Context - GuiselleArmstrong.com

## Project Overview
- **Name:** GuiselleArmstrong.com
- **Type:** Professional Portfolio / Resume Website
- **Purpose:** Showcase Guiselle Armstrong's skills, experience, and achievements to help her secure employment opportunities in the GRC (Governance, Risk, and Compliance) field
- **Technology Stack:** Hugo (static site generator) + Hugo Academic CV theme (HugoBlox)
- **Target URL:** GuiselleArmstrong.com (CNAME file present at root)

## Current Working Directory Structure
```
/workspaces/GuiselleArmstrong.com/
├── .clinerules/            # These instruction files
├── hugo-theme-academic-cv/ # Hugo site root (the actual website)
│   ├── config/_default/    # Hugo configuration (params.yaml, hugo.yaml, menus.yaml, etc.)
│   ├── content/            # Markdown content files
│   │   ├── _index.md       # Homepage landing page
│   │   ├── experience.md   # Experience page
│   │   ├── authors/        # Author profiles
│   │   ├── blog/           # Blog posts
│   │   ├── projects/       # Project showcases
│   │   ├── publications/   # Publications
│   │   ├── courses/        # Courses
│   │   └── events/         # Events
│   ├── data/authors/       # Author YAML data (me.yaml is the primary author)
│   ├── assets/media/       # Images, icons, media
│   ├── static/             # Static files served as-is
│   └── layouts/            # Custom layout overrides
├── profile-data/           # SOURCE OF TRUTH for Guiselle's professional data
│   ├── raw/                # Raw text extractions from PDFs
│   ├── structured/         # JSON-structured data (employment, education, skills, etc.)
│   └── guiselle-armstrong-complete-profile.md
├── resumes/                # Resume PDFs and markdown versions
├── plans/                  # Implementation and management plans
└── .devcontainer/          # Docker dev container configuration
```

## Key Data Sources
- **Primary profile:** `profile-data/guiselle-armstrong-complete-profile.md`
- **Contact info:** `profile-data/structured/contact-info.json`
- **Employment history:** `profile-data/structured/employment.json`
- **Education:** `profile-data/structured/education.json`
- **Skills:** `profile-data/structured/skills.json`
- **Certifications:** `profile-data/structured/certifications.json`
- **Resume PDF:** `resumes/Guiselle Armstrong.pdf`

## Local Knowledge Base (`docs/`)
- **`docs/theme-kb.md`** - HugoBlox theme documentation (blocks, config, architecture)
- **`docs/site-kb.md`** - Site-specific documentation (structure, current state, recent changes)
- **These KBs are maintained after every structural or content change**
- Theme original repo: https://github.com/HugoBlox/hugo-theme-academic-cv

## Person Being Representated
- **Name:** Guiselle Armstrong
- **Location:** Auburndale, FL
- **Email:** g_a25@outlook.com
- **LinkedIn:** www.linkedin.com/in/guisellearmstrong-12217760
- **Phone:** (305) 915-5273
- **Professional Title:** GRC & Process Improvement Professional | Six Sigma Black Belt | Compliance & Risk Management Specialist
- **Languages:** English (Fluent), Spanish (Native/Bilingual)

## Development Goals
1. Create a polished, professional portfolio site
2. Highlight GRC expertise, certifications, and measurable achievements
3. Make it easy for recruiters to contact Guiselle
4. Include downloadable resume
5. Showcase career progression and key accomplishments with metrics