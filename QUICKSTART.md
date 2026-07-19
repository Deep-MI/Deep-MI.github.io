# Deep-MI Website - Quick Reference

## Quick Start

```bash
# First time setup
gem install bundler --user-install
bundle install

# Run locally
bundle exec jekyll serve
# Visit: http://localhost:4000

# Validate before committing
./scripts/validate_yaml.rb
```

## Adding Content

### Team Member

1. Prepare photo: 365×365px, JPG
2. Optimize: `./scripts/optimize_images.sh member photo.jpg`
3. Save to: `/static/img/members/lastname.jpg`
4. Add entry to: `_data/members.yml` (see `_templates/member-template.md`)
5. Validate: `./scripts/validate_yaml.rb`

### Publication

1. Prepare teaser: Max 200px height, JPG, max 100KB
2. Optimize: `./scripts/optimize_images.sh pub image.jpg`
3. Save files:
    - Image: `/static/pub/id.jpg`
    - BibTeX: `/static/pub/id.bib`
    - PDF (optional): `/static/pub/id.pdf`
4. Add entry to: `_data/publications.yml` (see `_templates/publication-template.md`)
5. Validate: `./scripts/validate_yaml.rb`

### Event

1. Add entry to: `_data/events.yml` (`upcoming:` or `past:` list)
2. For upcoming events, add a teaser image to: `/static/img/events/`
3. Links in `title`/`details` may be inline HTML or Markdown-style (`[text](url)`) — external links open in a new tab
   automatically
4. Validate: `./scripts/validate_yaml.rb`

## File Locations

| Content Type | Data File                | Assets                 | Template                             |
|--------------|--------------------------|------------------------|--------------------------------------|
| Members      | `_data/members.yml`      | `/static/img/members/` | `_templates/member-template.md`      |
| Publications | `_data/publications.yml` | `/static/pub/`         | `_templates/publication-template.md` |
| Events       | `_data/events.yml`       | `/static/img/events/`  | -                                    |
| Alumni       | `_data/alumni.yml`       | -                      | -                                    |

## Image Requirements

| Type               | Size              | Format | Max Size |
|--------------------|-------------------|--------|----------|
| Member Photo       | 365×365px, 72 DPI | JPG    | 100KB    |
| Publication Teaser | Max 200px height  | JPG    | 100KB    |

## Validation Scripts

```bash
# YAML data files (members, publications, etc.)
./scripts/validate_yaml.rb

# Image optimization
./scripts/optimize_images.sh member <file>
./scripts/optimize_images.sh pub <file>
```

## Common Issues

### Jekyll won't start

```bash
bundle install
bundle update
```

### Ruby version error

```bash
# Install correct Ruby version
rbenv install 3.1.0
rbenv local 3.1.0
```

### YAML validation fails

- Check indentation (2 spaces)
- Use single quotes for strings
- Escape quotes: `Alzheimer''s` (two single quotes)
- Required fields must be present

### Images too large

```bash
# Optimize automatically (requires ImageMagick)
./scripts/optimize_images.sh member static/img/members/photo.jpg
./scripts/optimize_images.sh pub static/pub/teaser.jpg
```

**Install ImageMagick**:

- macOS: `brew install imagemagick`
- Linux: `sudo apt-get install imagemagick` or `sudo yum install imagemagick`
- Windows: [imagemagick.org](https://imagemagick.org/script/download.php#windows)

## Useful Commands

```bash
# Full build and test
bundle exec jekyll build
bundle exec ruby scripts/htmlproofer_check.rb

# Clean build
bundle exec jekyll clean
bundle exec jekyll build

# Update dependencies
bundle update

# Install pre-commit hook
cp scripts/pre-commit.sh .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
```

## Resources

- [Jekyll Documentation](https://jekyllrb.com/docs/)
- [Markdown Guide](https://www.markdownguide.org/)
- [YAML Syntax](https://yaml.org/)

## Support

- Check `CONTRIBUTING.md` for detailed guidelines
- Review templates in `_templates/`
- See existing examples in data files
- Contact lab web administrator

