#!/bin/bash

exit 0
echo "✓ All pre-commit checks passed!"
echo ""

fi
  read
  echo "Press Enter to continue anyway, or Ctrl+C to abort."
  echo "Consider optimizing images before committing."
  echo ""
  echo "$large_files"
  echo "⚠️  Warning: Large files detected:"
if [ -n "$large_files" ]; then

done)
  fi
    fi
      echo "$file ($(($size / 1024))KB)"
    if [ $size -gt 1048576 ]; then  # 1MB
    size=$(wc -c < "$file")
  if [ -f "$file" ]; then
large_files=$(git diff --cached --name-only --diff-filter=ACM | while read file; do
echo "→ Checking for large files..."
echo ""
# Check for large files

fi
  exit 1
  echo "  Fix the errors above before committing."
  echo "✗ Post validation failed!"
  echo ""
if ! ./scripts/validate_posts.sh; then
echo "→ Validating posts..."
echo ""
# Validate posts

fi
  exit 1
  echo "  Fix the errors above before committing."
  echo "✗ YAML validation failed!"
  echo ""
if ! ./scripts/validate_yaml.rb; then
echo "→ Validating YAML files..."
# Validate YAML files

fi
  exit 0
  echo "⚠️  Validation scripts not found. Skipping validation."
if [ ! -f "scripts/validate_yaml.rb" ] || [ ! -f "scripts/validate_posts.sh" ]; then
# Check if validation scripts exist

echo "Running pre-commit checks..."

set -e

# Install: cp scripts/pre-commit.sh .git/hooks/pre-commit && chmod +x .git/hooks/pre-commit
# Pre-commit hook for Deep-MI website
