#!/bin/bash

# Set the maximum allowed number of lines
MAX_LINES=1000

# List of files to ignore
IGNORED_FILES=(
  "./lib/src/app/resource/accounting_repository.dart"
  "./lib/src/app/resource/purchasing_repository.dart"
  "./lib/src/app/resource/material_repository.dart"
  "./lib/src/app/resource/product_repository.dart"
  "./lib/src/app/resource/material_request_repository.dart"
  "./lib/src/app/resource/company_repository.dart"
  "./packages/flexurio_chiron_finance/lib/src/app/resource/finance_repository.dart"
  "./packages/flexurio_chiron_accounting/lib/src/app/view/page/ebitda/widget/ebitda_expansion_tile_coa_group.dart"
  "./packages/flexurio_chiron_accounting/lib/src/app/view/page/ebitda/widget/ebitda_expansion_tile_marketing_area.dart"
  "./lib/constant/finance_customer.dart"
)

# List of file patterns to ignore (e.g., .freezed.dart, .g.dart)
IGNORED_PATTERNS=(
  ".freezed.dart"
  ".g.dart"
)

# List of directories to check
DIRECTORIES=(
  "./lib"
  "./packages/flexurio_chiron_accounting/lib"
  "./packages/flexurio_chiron_business_trip/lib"
  "./packages/flexurio_chiron_company/lib"
  "./packages/flexurio_chiron_customer/lib"
  "./packages/flexurio_chiron_finance/lib"
  "./packages/flexurio_chiron_marketing/lib"
  "./packages/flexurio_chiron_material/lib"
  "./packages/flexurio_chiron_material_stock/lib"
  "./packages/flexurio_chiron_presence/lib"
  "./packages/flexurio_chiron_product/lib"
  "./packages/flexurio_chiron_product_stock/lib"
  "./packages/flexurio_chiron_production/lib"
  "./packages/flexurio_chiron_purchase_order/lib"
  "./packages/flexurio_chiron_purchase_request/lib"
  "./packages/flexurio_chiron_sales_order/lib"
  "./packages/flexurio_chiron_tax/lib"
  "./packages/flexurio_chiron_ticket/lib"
  "./packages/flexurio_chiron_vendor/lib"
)

# Function to check the line count of Dart files
check_file_lines() {
  local file=$1
  local line_count
  line_count=$(wc -l < "$file")
  if [ "$line_count" -gt "$MAX_LINES" ]; then
    echo "File $file has $line_count lines, which exceeds the limit of $MAX_LINES."
    exit 1
  fi
}

# Loop through directories and check each Dart file
for dir in "${DIRECTORIES[@]}"; do
  # Find all .dart files in the directory recursively
  find "$dir" -type f -name "*.dart" | while read -r file; do
    # Skip files in the ignored list
    if [[ " ${IGNORED_FILES[@]} " =~ " $file " ]]; then
      continue
    fi

    # Skip files matching the ignored patterns
    skip_file=false
    for pattern in "${IGNORED_PATTERNS[@]}"; do
      if [[ "$file" == *"$pattern" ]]; then
        skip_file=true
        break
      fi
    done
    if [ "$skip_file" = true ]; then
      continue
    fi

    # Check the line count of the file
    check_file_lines "$file"
  done
done

echo "All files have passed the line count check."
