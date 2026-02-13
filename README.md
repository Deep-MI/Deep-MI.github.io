# Deep-MI.github.io


## Create News Posts

- put an .md file into the _posts directory
- name it like 2020-03-15-Short-Title.md
- have it start with the following markdown
```
---
title: Your Nice Title
author: First Lastname
layout: post
group: news
---
Your text goes here, with images, links etc....
```

See `_templates/post-template.md` for a complete template.

## Add Members

- add member info to _data/members.yml (see file for format)
- put photos (size 365 x 365, 72 dpi) into /static/img/members (jpg compressed)

See `_templates/member-template.md` for a complete template.

## Add Publication

- add publication info to _data/publications.yml (see file for format)
- add teaser image (size height 200 px max, jpg compressed, max 100kB) into /static/pub/paper_id.jpg
- add bibtex file into /static/pub/paper_id.bib
- link to openaccess PDF (journal) or put at /static/pub/paper_id.pdf
- paper_id is the id field in the yml

See `_templates/publication-template.md` for a complete template.

## Validation

Before committing changes, validate your content:

```bash
# Validate YAML data files
./scripts/validate_yaml.rb

# Validate post filenames and format
./scripts/validate_posts.sh
```

See `CONTRIBUTING.md` for detailed contribution guidelines.

## Tools and Scripts

### Validation

```bash
# Validate YAML files (checks structure, required fields, file existence)
./scripts/validate_yaml.rb

# Validate post filenames and format
./scripts/validate_posts.sh
```

### Image Optimization

```bash
# Optimize member photos and publication teasers
./scripts/optimize_images.sh member static/img/members/lastname.jpg
./scripts/optimize_images.sh pub static/pub/paper_id.jpg
```

**Requirements**: ImageMagick
- macOS: `brew install imagemagick`
- Linux: `sudo apt-get install imagemagick` or `sudo yum install imagemagick`
- Windows: See [imagemagick.org](https://imagemagick.org/script/download.php#windows)

### Pre-commit Hook

```bash
# Install pre-commit hook for automatic validation
cp scripts/pre-commit.sh .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
```

## Sources

This website was built using the Fraser Lab [website](http://fraserlab.com/) as a template.  James Fraser's website is open-source and available on [Github](https://github.com/fraser-lab/fraser-lab.github.io)


Technologies this website uses:

    Jekyll
    Github Pages
    Twitter Bootstrap 4.4.1

## Local Development

Before pushing changes, please check that they will work on your system first with the plugins included in the Gemfile using the bundler tool.

### Setup (First Time)

```bash
# Install bundler (without sudo for security)
gem install bundler --user-install

# Install dependencies
bundle install
```

### Running the Site Locally

```bash
# Start the Jekyll server
bundle exec jekyll serve

# Site will be available at: http://localhost:4000
# Or: http://0.0.0.0:4000
```

### Testing

```bash
# Check for broken links and HTML issues
bundle exec jekyll build
bundle exec htmlproofer ./_site --disable-external
```


