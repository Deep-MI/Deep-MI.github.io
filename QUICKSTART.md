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
./scripts/validate_posts.sh
```

## Adding Content

### News Post (5 minutes)

1. Create: `_posts/YYYY-MM-DD-Title.md`
2. Copy template from: `_templates/post-template.md`
3. Add images to: `/static/img/`
4. Validate: `./scripts/validate_posts.sh`

### Team Member (10 minutes)

1. Prepare photo: 365×365px, JPG
2. Optimize: `./scripts/optimize_images.sh member photo.jpg`
3. Save to: `/static/img/members/lastname.jpg`
4. Add entry to: `_data/members.yml` (see `_templates/member-template.md`)
5. Validate: `./scripts/validate_yaml.rb`

### Publication (15 minutes)

1. Prepare teaser: Max 200px height, JPG, max 100KB
2. Optimize: `./scripts/optimize_images.sh pub image.jpg`
3. Save files:
   - Image: `/static/pub/id.jpg`
   - BibTeX: `/static/pub/id.bib`
   - PDF (optional): `/static/pub/id.pdf`
4. Add entry to: `_data/publications.yml` (see `_templates/publication-template.md`)
5. Validate: `./scripts/validate_yaml.rb`

## File Locations

| Content Type | Data File | Assets | Template |
|--------------|-----------|--------|----------|
| News Posts | `_posts/*.md` | `/static/img/` | `_templates/post-template.md` |
| Members | `_data/members.yml` | `/static/img/members/` | `_templates/member-template.md` |
| Publications | `_data/publications.yml` | `/static/pub/` | `_templates/publication-template.md` |
| Alumni | `_data/alumni.yml` | - | - |
| Visitors | `_data/visitors.yml` | - | - |

## Image Requirements

| Type | Size | Format | Max Size |
|------|------|--------|----------|
| Member Photo | 365×365px, 72 DPI | JPG | 100KB |
| Publication Teaser | Max 200px height | JPG | 100KB |
| Post Images | Reasonable | JPG/PNG | 500KB |

## Validation Scripts

```bash
# YAML data files (members, publications, etc.)
./scripts/validate_yaml.rb

# Post filename format (YYYY-MM-DD-title.md)
./scripts/validate_posts.sh

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
# Optimize automatically
./scripts/optimize_images.sh member static/img/members/photo.jpg
./scripts/optimize_images.sh pub static/pub/teaser.jpg
```

## Useful Commands

```bash
# Full build and test
bundle exec jekyll build
bundle exec htmlproofer ./_site --disable-external

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
- [Bootstrap 4.4 Docs](https://getbootstrap.com/docs/4.4/)

## Support

- Check `CONTRIBUTING.md` for detailed guidelines
- Review templates in `_templates/`
- See existing examples in data files
- Contact lab web administrator

