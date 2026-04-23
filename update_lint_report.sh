#!/bin/bash

# Configuration
REPORT_FILE="lint_report.txt"
DCM_REPORT_FILE="dcm_report.txt"
README_FILE="README.md"
LINT_MD_FILE="LINT_REPORT.md"

# Get standard analyzer stats
ISSUES=$(grep -oE "[0-9]+ issues found" $REPORT_FILE | head -n1 | cut -d' ' -f1)
[ -z "$ISSUES" ] && ISSUES=0
ISSUES=$(echo "$ISSUES" | head -n1 | tr -dc '0-9')

ERRORS=$(grep -c "error •" $REPORT_FILE || echo 0)
ERRORS=$(echo "$ERRORS" | head -n1 | tr -dc '0-9')
[ -z "$ERRORS" ] && ERRORS=0

WARNINGS=$(grep -c "warning •" $REPORT_FILE || echo 0)
WARNINGS=$(echo "$WARNINGS" | head -n1 | tr -dc '0-9')
[ -z "$WARNINGS" ] && WARNINGS=0

INFOS=$(grep -c "info •" $REPORT_FILE || echo 0)
INFOS=$(echo "$INFOS" | head -n1 | tr -dc '0-9')
[ -z "$INFOS" ] && INFOS=0

# Get DCM stats if file exists
DCM_ISSUES=0
if [ -f "$DCM_REPORT_FILE" ]; then
    DCM_ISSUES=$(grep -c "•" $DCM_REPORT_FILE || echo 0)
    DCM_ISSUES=$(echo "$DCM_ISSUES" | head -n1 | tr -dc '0-9')
fi

TOTAL_ISSUES=$((ISSUES + DCM_ISSUES))


DATE=$(date +%Y-%m-%d)

# Color based on severity
COLOR="success"
if [ "$TOTAL_ISSUES" -gt 100 ]; then
    COLOR="red"
elif [ "$TOTAL_ISSUES" -gt 0 ]; then
    COLOR="yellow"
fi

echo "Updating $README_FILE and $LINT_MD_FILE with lint results (Standard + DCM): $TOTAL_ISSUES issues"

# 1. Update the badge in README.md
if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' "s/lints-[0-9]*%20issues-[a-z]*/lints-$TOTAL_ISSUES%20issues-$COLOR/g" $README_FILE
else
    sed -i "s/lints-[0-9]*%20issues-[a-z]*/lints-$TOTAL_ISSUES%20issues-$COLOR/g" $README_FILE
fi

# 2. Update LINT_REPORT.md content using Python for reliability
python3 -c "
import sys
import re
import os

readme_path = '$README_FILE'
lint_md_path = '$LINT_MD_FILE'
dcm_report_path = '$DCM_REPORT_FILE'

# Standard stats
issues = $ISSUES
dcm_issues = $DCM_ISSUES
total_issues = $TOTAL_ISSUES
errors = $ERRORS
warnings = $WARNINGS
infos = $INFOS
date = '$DATE'

dcm_status = 'Enabled' if os.path.exists(dcm_report_path) else 'N/A'

new_report = f'''# 📊 Lint Report

*Last updated: {date}*

## 📈 Summary
- **Total Issues (Combined)**: {total_issues}
- **Standard Analyzer Issues**: {issues}
- **DCM Issues (Presets)**: {dcm_issues}

### 🔍 Standard Analyzer Breakdown
- **Errors**: {errors}
- **Warnings**: {warnings}
- **Infos**: {infos}

### 🛠️ Tooling Status
- **Standard Analyzer**: Active
- **DCM (Presets)**: {dcm_status}

---

## 📄 Detailed Raw Reports
- [Standard Analysis Output](./lint_report.txt)
- [DCM Analysis Output (CI Only)](./dcm_report.txt)

---
&copy; 2026 PT. VNEU TEKNOLOGI INDONESIA.
'''

# Update LINT_REPORT.md
with open(lint_md_path, 'w') as f:
    f.write(new_report)
"

echo "Reports updated successfully."
