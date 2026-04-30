# GuiselleArmstrong.com - Site-Specific Knowledge Base

> **Domain:** GuiselleArmstrong.com  
> **Purpose:** Professional portfolio/resume website for GRC & Process Improvement professional  
> **Last Updated:** 2026-04-29

## Site Structure Summary

```
content/
├── _index.md              # Homepage (landing page with 6 blocks)
├── experience.md          # Experience page
├── volunteer.md           # Volunteer page
├── authors/_index.md      # Author page content
├── blog/                  # Blog posts (5 posts, 1 disabled)
└── projects/              # Project showcase cards (3 active projects)
    ├── change-management-framework/
    ├── compliance-automation/
    └── vulnerability-management/
```

## Homepage Blocks (in order)

1. **resume-biography-3** - Name, title, professional summary, Download Resume button, interests
2. **resume-experience** - Work history (limited to 3 most recent)
3. **collection (projects)** - "Key Professional Initiatives" - 3 project cards, no dates shown
4. **resume-skills** - Technical and soft skills
5. **resume-awards** - Certifications list
6. **markdown** - "Get in Touch" call-to-action

## Active Projects

| Project | File | Title | Framework |
|---------|------|-------|-----------|
| Change Management | `projects/change-management-framework/` | Change Management & Controlled Release Governance | SOC 2 CC7, ISO 27001 |
| Compliance Automation | `projects/compliance-automation/` | (see file) | - |
| Vulnerability Management | `projects/vulnerability-management/` | Vulnerability Management & Risk Reduction Program | SOC 2, ISO 27001 |

## Author Data

- **Primary data file:** `data/authors/me.yaml`
- **Profile image:** `assets/media/authors/me.png`
- **Resume PDF:** `static/resume.pdf`

## Navigation Menu

- Home (weight 1), Experience (weight 2), Projects (weight 3), Contact (weight 4)

## Custom Layouts

- `layouts/_partials/hooks/head-end/github-button.html` - GitHub button, hides HugoBlox footer

## Content Rules

- Project cards: `show_date: false`
- Experience limit on homepage: 3 entries
- All professional data sourced from `profile-data/structured/` JSON files

## Recent Changes

| Date | PR | Change |
|------|-----|--------|
| 2026-04-29 | #14 | Updated Change Management project |
| 2026-04-29 | #13 | Updated Vulnerability Management project |
| 2026-04-29 | #12 | Removed project card dates |
| 2026-04-29 | #11 | Updated Audit Readiness project |
| 2026-04-29 | #10 | Updated professional summary |