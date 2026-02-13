# Contributing to Deep-MI Website

Thank you for contributing to the Deep-MI lab website! This guide will help you add content correctly.

## Table of Contents

- [Creating News Posts](#creating-news-posts)
- [Adding Members](#adding-members)
- [Adding Publications](#adding-publications)
- [Validation Before Committing](#validation-before-committing)
- [Local Development](#local-development)

## Creating News Posts

1. **Create a new file** in `_posts/` directory
2. **Name it**: `YYYY-MM-DD-Short-Title.md` (e.g., `2026-02-13-New-Grant.md`)
3. **Use the template** from `_templates/post-template.md`

### Required Front Matter

```yaml
---
title: Your Article Title
author: First Lastname
layout: post
group: news
---
```

### Tips

- Use Markdown for formatting
- Include images in `/static/img/` directory
- Keep image file sizes reasonable (< 500KB)

## Adding Members

1. **Add member info** to `_data/members.yml`
2. **Prepare photo**: 365×365 pixels, 72 DPI, JPEG format
3. **Save photo** to `/static/img/members/lastname.jpg`
4. **Use the template** from `_templates/member-template.md`

### Required Fields

- `name`: Full name
- `image`: Path to photo (e.g., `/static/img/members/lastname.jpg`)
- `position`: Job title

### Optional Fields

- `email`: Email address
- `scholar`: Google Scholar ID
- `twitter`: Twitter handle
- `orcid`: ORCID identifier
- `github`: GitHub username
- `description`: Biography (use single quotes for multi-line)

## Adding Publications

1. **Add publication info** to `_data/publications.yml`
2. **Prepare teaser image**: Max 200px height, JPEG, max 100KB
3. **Save files**:
   - Image: `/static/pub/paper_id.jpg`
   - BibTeX: `/static/pub/paper_id.bib`
   - PDF (optional): `/static/pub/paper_id.pdf`
4. **Use the template** from `_templates/publication-template.md`

### Required Fields

- `id`: Unique identifier (usually `lastname_year`)
- `authors`: Author list (bold lab members: `**Name**`)
- `title`: Paper title
- `journal`: Journal/conference name
- `type`: One of: journal, conference, workshop, abstract, poster, preprint
- `year`: Publication year

### Recommended Fields

- `doi`: Digital Object Identifier
- `image`: Teaser image path
- `bibtex`: BibTeX file path
- `pdf`: Link to open access PDF or local file

## Validation Before Committing

Always validate your changes before committing:

```bash
# Validate YAML files
./scripts/validate_yaml.rb

# Validate post filenames and format
./scripts/validate_posts.sh

# Test the site locally
bundle exec jekyll serve
```

Visit http://localhost:4000 to preview your changes.

## Automation Tools

### Image Optimization

Optimize images to meet size requirements:

```bash
# Optimize a single member photo (365x365, 72 DPI)
./scripts/optimize_images.sh member static/img/members/lastname.jpg

# Optimize a single publication teaser (max 200px height, max 100KB)
./scripts/optimize_images.sh pub static/pub/paper_id.jpg

# Optimize all member photos at once
./scripts/optimize_images.sh all-members

# Optimize all publication teasers at once
./scripts/optimize_images.sh all-pubs
```

**Requirements**: ImageMagick (`brew install imagemagick`)

### Pre-commit Hook

Install a pre-commit hook to automatically validate changes:

```bash
cp scripts/pre-commit.sh .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
```

This will automatically run validation scripts before each commit.

## Local Development

### First-Time Setup

```bash
# Install bundler (without sudo)
gem install bundler --user-install

# Install dependencies
bundle install
```

### Running Locally

```bash
# Start development server
bundle exec jekyll serve

# Site available at: http://localhost:4000
```

### Testing

```bash
# Build site
bundle exec jekyll build

# Check for broken links
bundle exec htmlproofer ./_site --disable-external
```

## Style Guidelines

### Writing

- Use clear, concise language
- Check spelling and grammar
- Use proper citations for published work

### Images

- Optimize images before uploading
- Use descriptive filenames
- Keep file sizes small:
  - Member photos: ~50-100KB
  - Publication teasers: max 100KB
  - Post images: < 500KB

### Code

- Follow Jekyll conventions
- Keep YAML files properly indented (2 spaces)
- Use single quotes for strings in YAML
- Escape single quotes with double single quotes: `Alzheimer''s`

## Questions?

If you have questions or run into issues, please:
1. Check the templates in `_templates/`
2. Review existing examples in the data files
3. Contact the lab's web administrator

## Continuous Integration

All pull requests are automatically tested using GitHub Actions:
- Jekyll build verification
- HTML validation
- Link checking

Make sure your changes pass these tests before requesting review.


