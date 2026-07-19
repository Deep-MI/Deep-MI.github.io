# Deep-MI Lab Website

This is the official website for the AI in Medical Imaging (Deep-MI) Lab.

The website is built with Jekyll and hosted on GitHub Pages.

## Quick Links

- **Live Website**: [https://deep-mi.github.io](https://deep-mi.github.io)
- **Contributing**: See [CONTRIBUTING.md](CONTRIBUTING.md) for how to add members, publications, and events
- **Quick Start**: See [QUICKSTART.md](QUICKSTART.md) for copy-paste commands, a file-location reference, and
  troubleshooting

## Technologies Used

- Jekyll - Static site generator
- GitHub Pages - Hosting

## Local Development

```bash
# First time setup
gem install bundler --user-install
bundle install

# Run locally
bundle exec jekyll serve
# Visit: http://localhost:4000
```

Before pushing changes, build and check the site with the plugins pinned in the Gemfile:

```bash
bundle exec jekyll build
bundle exec ruby scripts/htmlproofer_check.rb
```

See [QUICKSTART.md](QUICKSTART.md) for more commands and [CONTRIBUTING.md](CONTRIBUTING.md) for detailed content
guidelines.
