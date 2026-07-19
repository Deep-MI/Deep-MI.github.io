# Contributing to Deep-MI Website

Thank you for contributing to the Deep-MI lab website! This guide will help you add content correctly.

## Table of Contents

- [Adding Members](#adding-members)
- [Adding Publications](#adding-publications)
- [Adding Events](#adding-events)
- [Validation Before Committing](#validation-before-committing)
- [Local Development](#local-development)

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

## Adding Events

### Upcoming Events

1. **Add event info** to the `upcoming:` list in `_data/events.yml`
2. **Prepare a teaser image** and save it to `/static/img/events/`

#### Fields

- `type`: Event type (e.g., Workshop, Talk)
- `date_range`: Displayed date range (e.g., `'Oct 14&ndash;16, 2026'`)
- `location`: Where the event takes place
- `image` / `image_alt`: Teaser image path and alt text
- `title`: Event title
- `description`: Short description shown on the card
- `links`: List of buttons, each with `label`, `url`, and `class` (`lab-btn lab-btn-accent`, `lab-btn lab-btn-outline`,
  or `lab-btn lab-btn-light`); for a local file (e.g. a PDF flyer) that should open in a new tab, add `target: '_blank'`
  and `rel: 'noopener'` explicitly — absolute `http(s)` links get this automatically (see Links below)

### Past Events

1. **Add an entry** to the `past:` list in `_data/events.yml`, most recent first

#### Fields

- `date`: Short date shown next to the entry (e.g., `'Sep 2025'`)
- `title`: Required. Supports inline HTML (`<a href="...">text</a>`) or Markdown-style links (`[text](url)`)
- `details` (optional): Shown on its own line below the title — use for a talk abstract/quote or a short venue note

### Workshop Pages

For a full course/workshop microsite (course details, registration, program, location), copy an existing folder under
`events/workshops/` (e.g., `fastsurfer-course-2026/`) as a template.

### Links

External links (`http://` or `https://`) automatically open in a new tab site-wide — no need to add `target="_blank"`
manually, whether the link is written as inline HTML, Markdown shorthand, or in an events `links` entry. This only
applies to absolute `http(s)` URLs; for a local file (e.g. a PDF) that should still open in a new tab, add
`target="_blank"` explicitly.

## Validation Before Committing

Always validate your changes before committing:

```bash
# Validate YAML files
./scripts/validate_yaml.rb

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

**Requirements**: ImageMagick

**Installation**:

- macOS: `brew install imagemagick`
- Ubuntu/Debian: `sudo apt-get install imagemagick`
- Fedora/RHEL: `sudo yum install imagemagick` or `sudo dnf install imagemagick`
- Arch Linux: `sudo pacman -S imagemagick`
- Windows: Download from [imagemagick.org](https://imagemagick.org/script/download.php#windows) or use
  `choco install imagemagick`

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

# Check for broken links (uses scripts/htmlproofer_check.rb to skip known
# placeholder links to sibling repos without their own GitHub Pages site)
bundle exec ruby scripts/htmlproofer_check.rb
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
    - Member photos: max 100KB
    - Publication teasers: max 100KB

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


