# Guiselle Armstrong Professional Data Database

## Overview

This database contains AI-readable structured data extracted from Guiselle Armstrong's professional documents. All content has been extracted and preserved in its original form, organized into machine-readable JSON formats alongside human-readable text files.

## Database Structure

```
ai-database/
├── raw/
│   ├── guiselle-armstrong-full-text.txt    # Full text from Guiselle Armstrong.pdf
│   └── profile-2-full-text.txt             # Full text from Profile-2.pdf
├── structured/
│   ├── employment.json                     # Employment history (12 positions)
│   ├── education.json                      # Educational background (4 records)
│   ├── skills.json                         # Skills, competencies, frameworks, tools
│   ├── certifications.json                 # Professional certifications (8 total)
│   └── contact-info.json                   # Contact details and professional summary
├── master-index.json                       # Complete database index and metadata
└── README.md                               # This file
```

## Source Documents

| Document | Type | Description |
|----------|------|-------------|
| Guiselle Armstrong.pdf | PDF | Primary resume with experience, certifications, education |
| Profile-2.pdf | PDF | LinkedIn-style profile with detailed employment history |
| resume-short.md | Markdown | Short resume format (empty) |
| resume-long.md | Markdown | Long resume format (empty) |
| profile-2.md | Markdown | Markdown version of Profile-2.pdf |
| guiselle-dates.md | Markdown | Extracted date data with structured JSON |

## Structured Data Categories

### Employment (`employment.json`)
- 12 employment positions documented
- Includes employer, position, dates, duration, location
- Detailed responsibilities for key positions
- Source attribution for each record

### Education (`education.json`)
- 4 education records from 2 institutions
- Degrees, fields of study, dates, and status
- Institutions: Southern New Hampshire University, ITT Technical Institute

### Skills (`skills.json`)
- 14 core competencies
- 7 technical skills
- 8 frameworks and standards (SOX, SOC 2, PCI DSS, GDPR, CCPA, HIPAA, NIST, ITGC)
- 7 tools and platforms (ServiceNow, Power BI, Nessus, Qualys, etc.)
- 2 languages (Spanish - Native/Bilingual, English - Fluent)
- 8 key achievements with metrics

### Certifications (`certifications.json`)
- 8 total certifications
- 4 Six Sigma certifications (Black Belt, Green Belt, White Belt)

### Contact Info (`contact-info.json`)
- Name, phone, email, LinkedIn URL
- Location: Auburndale, Florida, United States
- Professional title and full summary

## Usage

### For AI Consumption
All JSON files are structured for programmatic access with consistent field naming and source attribution.

### For Human Reading
Raw text files preserve exact document content. Markdown files provide formatted human-readable versions.

### Data Integrity
- **No modifications**: All data preserved exactly as it appears in source documents
- **No summaries**: Full content retained without condensation
- **Source tracking**: Each record includes source_document field for traceability

## Statistics

| Category | Count |
|----------|-------|
| Employment Positions | 12 |
| Education Records | 4 |
| Certifications | 8 |
| Core Competencies | 14 |
| Technical Skills | 7 |
| Frameworks/Standards | 8 |
| Tools/Platforms | 7 |
| Languages | 2 |
| Key Achievements | 8 |

## Extraction Date
2026-04-17

## Notes
- This database is designed for AI consumption and programmatic access
- All original content has been preserved without modification
- Structured JSON enables easy querying and analysis
- Raw text files maintain document fidelity for reference
