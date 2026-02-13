#!/bin/bash
# Pre-commit hook for Deep-MI website
# Install: cp scripts/pre-commit.sh .git/hooks/pre-commit && chmod +x .git/hooks/pre-commit

set -e

echo "Running pre-commit checks..."

# Check if validation scripts exist
if [ ! -f "scripts/validate_yaml.rb" ] || [ ! -f "scripts/validate_posts.sh" ]; then
  echo "⚠️  Validation scripts not found. Skipping validation."
  exit 0
fi

# Validate YAML files
echo "→ Validating YAML files..."
if ! ./scripts/validate_yaml.rb; then
  echo ""
  echo "✗ YAML validation failed!"
  echo "  Fix the errors above before committing."
  exit 1
fi

# Validate posts
echo ""
echo "→ Validating posts..."
if ! ./scripts/validate_posts.sh; then
  echo ""
  echo "✗ Post validation failed!"
  echo "  Fix the errors above before committing."
  exit 1
fi

# Check for large files
echo ""
echo "→ Checking for large files..."
large_files=$(git diff --cached --name-only --diff-filter=ACM | while read file; do
  if [ -f "$file" ]; then
    size=$(wc -c < "$file")
    if [ $size -gt 1048576 ]; then  # 1MB
      echo "$file ($(($size / 1024))KB)"
    fi
  fi
done)

if [ -n "$large_files" ]; then
  echo "⚠️  Warning: Large files detected:"
  echo "$large_files"
  echo ""
  echo "Consider optimizing images before committing."
  echo "Press Enter to continue anyway, or Ctrl+C to abort."
  read
fi

echo ""
echo "✓ All pre-commit checks passed!"
exit 0
