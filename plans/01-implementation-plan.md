# Guiselle Armstrong Portfolio - Implementation Plan

**Project:** Professional Portfolio Site using Hugo Academic CV Theme  
**Target Platform:** GitHub Pages  
**Status:** Planning Phase  
**Created:** 2026-04-25

---

## Executive Summary

This Implementation Plan outlines the phased approach to building Guiselle Armstrong's professional portfolio website using the Hugo Academic CV theme. The plan covers theme setup, profile data migration, content creation, testing, deployment, and ongoing maintenance.

---

## Directory Structure Assessment

### Current Structure Analysis

```
guiselle-portfolio/
├── hugo-theme-academic-cv/               # Theme directory (renamed from "copy")
│   ├── config/                           # Hugo configuration
│   ├── content/                          # Hugo content
│   ├── data/                             # Hugo data (authors)
│   ├── static/                           # Static assets
│   └── [theme files]
├── profile-data/                         # Source profile data
│   ├── raw/                              # Raw text extracts
│   ├── structured/                       # JSON structured data
│   ├── master-index.json                 # Database index
│   └── README.md                         # Documentation
├── resumes/                              # Resume PDFs and markdown
└── .devcontainer/                        # Dev container configuration
    └── devcontainer.json                 # Dev container settings
```

### Recommended Restructuring

**Action Required:** Extract theme from "copy" folder and establish proper Hugo project structure.

**New Structure:**

```
guiselle-portfolio/
├── hugo-theme-academic-cv/               # Theme directory (renamed)
│   ├── config/                           # Hugo configuration
│   ├── content/                          # Hugo content
│   ├── data/                             # Hugo data (authors)
│   ├── static/                           # Static assets
│   └── [theme files]
├── profile-data/                         # Source profile data (keep separate)
│   ├── raw/
│   ├── structured/
│   ├── master-index.json
│   └── README.md
├── resumes/                              # Resume files (keep separate)
├── static/uploads/                       # Hugo static uploads (for images, PDFs)
└── [Hugo configuration files]
```

**Rationale:**
- Remove "copy" suffix for cleaner project structure
- Keep `profile-data/` separate as source of truth for AI agent consumption
- Maintain `resumes/` as separate repository for version control of documents
- Use Hugo's built-in `static/uploads/` for site assets

---

## Phase 1: Theme Setup & Configuration

### 1.1 Theme Extraction and Setup

**Objective:** Prepare the Hugo Academic CV theme for development.

**Tasks:**

1. **Rename Theme Directory**
   - Rename `hugo-theme-academic-cv-main copy/` to `hugo-theme-academic-cv/`
   - Verify all internal references are updated
   - **Status: Completed**

2. **Review Theme Configuration Files**
   - [`config/_default/hugo.yaml`](hugo-theme-academic-cv/config/_default/hugo.yaml) - Site configuration
   - [`config/_default/languages.yaml`](hugo-theme-academic-cv/config/_default/languages.yaml) - Language settings
   - [`config/_default/menus.yaml`](hugo-theme-academic-cv/config/_default/menus.yaml) - Navigation menu
   - [`config/_default/module.yaml`](hugo-theme-academic-cv/config/_default/module.yaml) - Module dependencies
   - [`config/_default/params.yaml`](hugo-theme-academic-cv/config/_default/params.yaml) - Site parameters

3. **Install Hugo**
   - Verify Hugo version compatibility (check theme requirements)
   - Install Hugo extended version (required for SCSS processing)

4. **Initialize Hugo Module System**
   - Review [`config/_default/module.yaml`](hugo-theme-academic-cv/config/_default/module.yaml)
   - Set up local theme reference

### 1.2 Dev Container Setup

**Objective:** Create a consistent development environment using Docker Dev Containers.

**Tasks:**

1. **Create Dev Container Configuration**
   - Create `.devcontainer/devcontainer.json` in project root
   - Use HugoBlox development image with pinned Hugo version (0.159.2)
   - Configure VS Code extensions for Hugo development
   - Set up port forwarding for Hugo dev server (port 1313)
   - Configure volume mounts for pnpm store
   - **Status: Completed**

2. **Dev Container Features**
   - Hugo version: 0.159.2 (as specified in [`hugoblox.yaml`](hugo-theme-academic-cv/hugoblox.yaml))
   - Pre-installed development tools
   - Port 1313 forwarding for Hugo dev server
   - VS Code extensions: Ownable, Hugo, Prettier
   - Automatic pnpm installation on container start

### 1.3 Site Configuration

**Objective:** Configure site-wide settings for Guiselle Armstrong's portfolio.

**Tasks:**

1. **Update [`config/_default/hugo.yaml`](hugo-theme-academic-cv/config/_default/hugo.yaml)**
   - Set `baseURL` to GitHub Pages URL (e.g., `https://guisellearmstrong.github.io/guiselle-portfolio/`)
   - Configure `title` to "Guiselle Armstrong"
   - Set `defaultContentLanguage` to "en"
   - Review and adjust build settings
   - **Status: Completed**

2. **Update [`config/_default/params.yaml`](hugo-theme-academic-cv/config/_default/params.yaml)**
   - Set `hugoblox.identity.name` to "Guiselle Armstrong"
   - Set `hugoblox.identity.tagline` to "GRC & Process Improvement Professional | Six Sigma Black Belt"
   - Configure `hugoblox.identity.description` with professional summary
   - Update `hugoblox.social` with LinkedIn URL
   - Configure theme colors (primary, secondary)
   - Set typography preferences
   - Configure header settings
   - **Status: Completed**

3. **Update [`config/_default/menus.yaml`](hugo-theme-academic-cv/config/_default/menus.yaml)**
   - Configure main navigation menu
   - Add links to: About, Experience, Projects, Publications, Courses, Contact
   - Set menu ordering and weights

### 1.4 Author Profile Setup

**Objective:** Configure the author profile using Hugo's author system.

**Tasks:**

1. **Review [`data/authors/me.yaml`](hugo-theme-academic-cv/data/authors/me.yaml)**
   - This file controls the main author profile displayed on the site

2. **Update Author Profile Data**
   - Extract data from [`profile-data/structured/contact-info.json`](profile-data/structured/contact-info.json)
   - Update name, title, summary
   - Add contact information (email, LinkedIn, phone)
   - Configure social links
   - Set location information
   - Add education, experience, skills, and certifications
   - **Status: Completed**

3. **Add Profile Image**
   - Copy profile image to [`assets/media/authors/me.png`](hugo-theme-academic-cv/assets/media/authors/me.png)
   - Or use existing image if appropriate

### 1.5 Homepage Configuration

**Objective:** Configure the homepage with user's profile content.

**Tasks:**

1. **Update [`content/_index.md`](hugo-theme-academic-cv/content/_index.md)**
   - Configure landing page sections
   - Add biography section with professional summary
   - Set up experience collection
   - Configure certifications display
   - **Status: Completed**

---

## Phase 2: Profile Data Migration

### 2.1 Data Extraction Strategy

**Objective:** Migrate professional data from `profile-data/` to Hugo content format.

**Source Data:**
- [`profile-data/structured/employment.json`](profile-data/structured/employment.json) - 12 employment positions
- [`profile-data/structured/education.json`](profile-data/structured/education.json) - 4 education records
- [`profile-data/structured/certifications.json`](profile-data/structured/certifications.json) - 8 certifications
- [`profile-data/structured/skills.json`](profile-data/structured/skills.json) - Skills and competencies
- [`profile-data/structured/contact-info.json`](profile-data/structured/contact-info.json) - Contact details and summary

### 2.2 Experience Section Migration

**Objective:** Create Hugo content for professional experience.

**Tasks:**

1. **Review [`content/experience.md`](hugo-theme-academic-cv/content/experience.md)**
   - Understand the Hugo Academic CV experience content format
   - Identify front matter structure for experience blocks

2. **Create Experience Content Blocks**
   - Convert employment data to Hugo shortcodes or content blocks
   - Focus on key positions with detailed responsibilities
   - Include: Universal Destinations & Experiences, NBCUniversal, Publix Super Markets
   - Format dates consistently (e.g., "June 2023 - October 2025")
   - Include location information

3. **Experience Content Structure**
   ```markdown
   ---
   title: "Experience"
   weight: 10
   ---

   ## Senior Information Security Engineer
   **Universal Destinations & Experiences** | June 2023 - October 2025 | United States

   - Managed vulnerability lifecycle for 500+ enterprise systems
   - Developed PCI DSS compliance training
   - Conducted user access review training for 200+ employees
   - Designed security controls for SOX, SOC 2, PCI DSS, GDPR, CCPA
   - Reduced manual compliance reporting by 50% through automation

   ## Senior GRC Engineer
   **NBCUniversal** | March 2023 - Present | United States

   - Managed vulnerability lifecycle for 500+ enterprise systems
   - Developed and delivered PCI DSS compliance training
   - Conducted user access review training for 200+ employees
   - Designed and tested security controls
   - Reduced manual compliance reporting effort by 50%
   ```

### 2.3 Education Section Migration

**Objective:** Create Hugo content for educational background.

**Tasks:**

1. **Review Education Content Format**
   - Check existing education content in theme
   - Understand degree, institution, date formatting

2. **Create Education Content Blocks**
   - Extract from [`profile-data/structured/education.json`](profile-data/structured/education.json)
   - Include: Southern New Hampshire University, ITT Technical Institute
   - Format: Degree, Field of Study, Institution, Dates, Status

### 2.4 Certifications Section Migration

**Objective:** Create Hugo content for professional certifications.

**Tasks:**

1. **Review Certifications Format**
   - Check if theme has dedicated certifications section
   - Determine best display format (grid, list, or cards)

2. **Create Certifications Content**
   - Extract from [`profile-data/structured/certifications.json`](profile-data/structured/certifications.json)
   - Six Sigma certifications (Black Belt, Green Belt, White Belt x2)
   - Include issuer and date for each

### 2.5 Skills Section Migration

**Objective:** Create Hugo content for skills and competencies.

**Tasks:**

1. **Review Skills Display Format**
   - Check theme's skills display options
   - Determine categorization approach

2. **Create Skills Content**
   - Extract from [`profile-data/structured/skills.json`](profile-data/structured/skills.json)
   - Core Competencies (14 items)
   - Technical Skills (7 items)
   - Frameworks and Standards (8 items: SOX, SOC 2, PCI DSS, GDPR, CCPA, HIPAA, NIST, ITGC)
   - Tools and Platforms (7 items: ServiceNow, Power BI, Nessus, Qualys, etc.)
   - Languages (Spanish - Native/Bilingual, English - Fluent)
   - Key Achievements (8 items with metrics)

---

## Phase 3: Content Creation

### 3.1 Homepage Content

**Objective:** Create compelling homepage content.

**Tasks:**

1. **Update [`content/_index.md`](hugo-theme-academic-cv/content/_index.md)**
   - Configure hero section with professional summary
   - Set up featured content sections
   - Configure call-to-action buttons

2. **Professional Summary Integration**
   - Extract from [`profile-data/structured/contact-info.json`](profile-data/structured/contact-info.json)
   - Condense for homepage display (2-3 paragraphs)
   - Highlight key achievements and expertise areas

### 3.2 Projects Section

**Objective:** Create project showcase content.

**Tasks:**

1. **Review Projects Format**
   - Examine existing project examples in theme
   - Understand project card structure

2. **Create Project Content**
   - Identify 3-5 key projects from employment history
   - Examples:
     - Vulnerability Management Program (NBCUniversal)
     - Compliance Automation Initiative (ServiceNow)
     - User Access Review Program (Publix)
     - Change Management Framework (Publix)
   - Include: Title, description, technologies/frameworks, outcomes

### 3.3 Publications Section

**Objective:** Create publications content (if applicable).

**Tasks:**

1. **Assess Publications Need**
   - Review if Guiselle has publications to include
   - Check [`profile-data`](profile-data/) for any publication references

2. **Create Publication Content (if applicable)**
   - Use theme's publication format
   - Include: Title, authors, venue, date, link

### 3.4 Courses Section

**Objective:** Create courses content (if applicable).

**Tasks:**

1. **Assess Courses Need**
   - Review if Guiselle has courses to teach or create
   - Check [`profile-data`](profile-data/) for teaching experience

2. **Create Course Content (if applicable)**
   - Use theme's course format
   - Include: Course title, description, level, students

### 3.5 Events Section

**Objective:** Create events content (if applicable).

**Tasks:**

1. **Assess Events Need**
   - Review if Guiselle has speaking engagements or conferences
   - Check [`profile-data`](profile-data/) for event references

2. **Create Event Content (if applicable)**
   - Use theme's event format
   - Include: Event name, date, location, description

### 3.6 Resume Integration

**Objective:** Make resume documents accessible on the site.

**Tasks:**

1. **Copy Resume to Static Directory**
   - Copy [`resumes/Guiselle Armstrong.pdf`](resumes/Guiselle Armstrong.pdf) to `static/uploads/resume.pdf`
   - Ensure proper file naming and accessibility

2. **Add Download Link**
   - Add "Download Resume" button to header or contact section
   - Link to `uploads/resume.pdf`

---

## Phase 4: Testing & Deployment

### 4.1 Local Testing

**Objective:** Verify site functionality locally before deployment.

**Tasks:**

1. **Build Site Locally**
   - Run `hugo server` to start development server
   - Verify all content renders correctly
   - Check for build errors or warnings

2. **Content Review**
   - Review all pages for accuracy
   - Verify contact information
   - Check experience dates and descriptions
   - Validate certifications and skills display

3. **Responsive Testing**
   - Test on desktop, tablet, and mobile views
   - Verify navigation works on all screen sizes
   - Check image loading and sizing

4. **Link Validation**
   - Verify all internal links work
   - Check external links (LinkedIn, etc.)
   - Test resume download link

### 4.2 GitHub Pages Setup

**Objective:** Deploy site to GitHub Pages.

**Tasks:**

1. **Create GitHub Repository**
   - Create new repository on GitHub
   - Name: `guisellearmstrong.github.io` (for user/organization pages)
   - Or: `portfolio` (for project pages)

2. **Initialize Git Repository**
   - Run `git init` in project directory
   - Create `.gitignore` for Hugo (exclude `public/`, `node_modules/`, etc.)

3. **Configure GitHub Pages**
   - Go to repository Settings > Pages
   - Select deployment branch and folder
   - Configure custom domain (if applicable)

4. **Deploy Site**
   - Build site: `hugo`
   - Commit and push to repository
   - Verify site is live at GitHub Pages URL

### 4.3 Post-Deployment Verification

**Objective:** Confirm successful deployment.

**Tasks:**

1. **Live Site Testing**
   - Visit GitHub Pages URL
   - Test all functionality
   - Verify SEO meta tags

2. **Analytics Setup (Optional)**
   - Configure Google Analytics or other tracking
   - Add to [`params.yaml`](hugo-theme-academic-cv/config/_default/params.yaml)

3. **Search Engine Submission**
   - Submit to Google Search Console
   - Submit to Bing Webmaster Tools

---

## Phase 5: Maintenance & Updates

### 5.1 Content Updates

**Objective:** Maintain current and accurate site content.

**Tasks:**

1. **Regular Content Review**
   - Quarterly review of experience section
   - Update with new positions, certifications, skills
   - Remove outdated information

2. **Version Control Workflow**
   - Commit changes with descriptive messages
   - Use feature branches for major updates
   - Tag releases for major versions

### 5.2 Theme Updates

**Objective:** Keep theme up to date.

**Tasks:**

1. **Monitor Theme Updates**
   - Check Hugo Academic CV repository for updates
   - Review changelog for breaking changes

2. **Update Process**
   - Test updates in local environment first
   - Review theme migration guides
   - Update configuration if needed

### 5.3 Performance Monitoring

**Objective:** Ensure site performs well.

**Tasks:**

1. **Performance Testing**
   - Run Google PageSpeed Insights regularly
   - Monitor Core Web Vitals
   - Optimize images and assets as needed

2. **SEO Monitoring**
   - Check Search Console for issues
   - Monitor organic search performance
   - Update meta descriptions as needed

---

## Appendix: Data Mapping Reference

### Employment Data Mapping

| Source Field | Hugo Content Field |
|--------------|-------------------|
| employer | Organization |
| position | Position/Role |
| start_date | Date Start |
| end_date | Date End |
| location | Location |
| responsibilities | Description (bullet points) |

### Education Data Mapping

| Source Field | Hugo Content Field |
|--------------|-------------------|
| institution | Institution |
| degree | Degree |
| field_of_study | Field of Study |
| start_date | Date Start |
| end_date | Date End |
| status | Status (e.g., "Completed", "In Progress") |

### Skills Data Mapping

| Source Category | Hugo Display |
|-----------------|--------------|
| core_competencies | Skills section - Core |
| technical_skills | Skills section - Technical |
| frameworks_and_standards | Skills section - Frameworks |
| tools_and_platforms | Skills section - Tools |
| languages | Skills section - Languages |
| key_achievements | Featured achievements or experience bullets |

---

## Success Criteria

- [ ] Theme properly extracted and configured
- [ ] All profile data migrated to Hugo content
- [ ] Site builds without errors
- [ ] Site deploys successfully to GitHub Pages
- [ ] All links and downloads work correctly
- [ ] Site is responsive on all devices
- [ ] SEO meta tags are properly configured
- [ ] Resume download is functional
- [ ] Content is accurate and up-to-date

---

**Document Version:** 1.0  
**Last Updated:** 2026-04-25  
**Next Review:** After Phase 1 completion
