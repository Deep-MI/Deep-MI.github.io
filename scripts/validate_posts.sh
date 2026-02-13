#!/bin/bash
# Validate that post filenames follow the YYYY-MM-DD-title.md convention

set -e

echo "Validating post filenames..."

error_count=0

for file in _posts/*.md; do
  if [ ! -f "$file" ]; then
    continue
  fi

  filename=$(basename "$file")

  # Check naming convention: YYYY-MM-DD-*.md
  if [[ ! $filename =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}-.+\.md$ ]]; then
    echo "✗ Invalid post filename: $filename"
    echo "  Expected format: YYYY-MM-DD-title.md"
    ((error_count++))
    continue
  fi

  # Extract and validate date
  date_part="${filename:0:10}"
  if ! date -d "$date_part" "+%Y-%m-%d" > /dev/null 2>&1 && \
     ! date -j -f "%Y-%m-%d" "$date_part" > /dev/null 2>&1; then
    echo "✗ Invalid date in filename: $filename"
    ((error_count++))
    continue
  fi

  # Check for front matter
  if ! head -n 1 "$file" | grep -q "^---$"; then
    echo "✗ Missing front matter in: $filename"
    ((error_count++))
    continue
  fi

  echo "✓ $filename"
done

if [ $error_count -eq 0 ]; then
  echo ""
  echo "✓ All post files are valid!"
  exit 0
else
  echo ""
  echo "✗ Found $error_count error(s)"
  exit 1
fi

