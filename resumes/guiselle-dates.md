# Guiselle Armstrong - Extracted Date Data

**Source Document:** Guiselle Armstrong.pdf  
**Extraction Date:** 2026-04-17  
**Purpose:** AI consumption data source - structured date information from resume

---

## Extracted Dates

| # | Original Text | Context/Section | Line Number |
|---|---------------|-----------------|-------------|
| 1 | `10+ years` | Professional Summary - experience duration | 8 |
| 2 | `Mar 2023 – Present` | NBCUniversal employment period | 40 |
| 3 | `Jun 2021 – Mar 2023` | Publix Super Markets employment period | 56 |
| 4 | `Feb 2019 – Mar 2020` | Digital Aspire / Newgentek employment period | 68 |
| 5 | `Feb 2015 – Feb 2019` | Badcock Home Furniture & More employment period | 78 |

---

## Raw Date Entries (Preserved Exactly)

```
10+ years
Mar 2023 – Present
Jun 2021 – Mar 2023
Feb 2019 – Mar 2020
Feb 2015 – Feb 2019
```

---

## Structured JSON Format (for programmatic consumption)

```json
{
  "source_document": "Guiselle Armstrong.pdf",
  "extraction_date": "2026-04-17",
  "dates": [
    {
      "original_text": "10+ years",
      "context": "Professional Summary - experience duration",
      "line_number": 8,
      "type": "duration"
    },
    {
      "original_text": "Mar 2023 – Present",
      "context": "NBCUniversal - Senior GRC Engineer employment period",
      "line_number": 40,
      "type": "employment_period",
      "employer": "NBCUniversal",
      "position": "Senior GRC Engineer",
      "start_date": "Mar 2023",
      "end_date": "Present"
    },
    {
      "original_text": "Jun 2021 – Mar 2023",
      "context": "Publix Super Markets - Change Manager employment period",
      "line_number": 56,
      "type": "employment_period",
      "employer": "Publix Super Markets",
      "position": "Change Manager",
      "start_date": "Jun 2021",
      "end_date": "Mar 2023"
    },
    {
      "original_text": "Feb 2019 – Mar 2020",
      "context": "Digital Aspire / Newgentek - Technical Support Manager employment period",
      "line_number": 68,
      "type": "employment_period",
      "employer": "Digital Aspire / Newgentek",
      "position": "Technical Support Manager",
      "start_date": "Feb 2019",
      "end_date": "Mar 2020"
    },
    {
      "original_text": "Feb 2015 – Feb 2019",
      "context": "Badcock Home Furniture & More - Network Engineer employment period",
      "line_number": 78,
      "type": "employment_period",
      "employer": "Badcock Home Furniture & More",
      "position": "Network Engineer",
      "start_date": "Feb 2015",
      "end_date": "Feb 2019"
    }
  ]
}
```

---

## Summary

**Total Dates Extracted:** 5  
**Date Types Found:**
- Duration: 1 (10+ years experience)
- Employment Periods: 4 (all in Month YYYY – Month YYYY or Present format)

**Employment Timeline:**
1. Badcock Home Furniture & More: Feb 2015 – Feb 2019 (Network Engineer)
2. Digital Aspire / Newgentek: Feb 2019 – Mar 2020 (Technical Support Manager)
3. Publix Super Markets: Jun 2021 – Mar 2023 (Change Manager)
4. NBCUniversal: Mar 2023 – Present (Senior GRC Engineer)

---

*All date data preserved exactly as it appears in the original PDF document.*
