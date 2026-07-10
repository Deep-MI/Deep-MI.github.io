#!/bin/bash
# Validate Minimal Mistakes theme configuration

echo "==================================="
echo "Minimal Mistakes Theme Validation"
echo "==================================="
echo ""

# Check Ruby version
echo "Checking Ruby version..."
ruby_version=$(ruby -e 'puts RUBY_VERSION')
echo "Ruby version: $ruby_version"

if [[ $(echo "$ruby_version" | cut -d. -f1) -lt 3 ]]; then
    echo "⚠️  Warning: Ruby 3.0+ recommended for Minimal Mistakes"
    echo "   Current version: $ruby_version"
    echo "   Install Ruby 3.0+ using rbenv or RVM"
    echo "   Or push to GitHub and let GitHub Pages build it"
    echo ""
fi

# Check if _config.yml exists and has remote_theme
echo "Checking _config.yml..."
if [ -f "_config.yml" ]; then
    if grep -q "remote_theme.*minimal-mistakes" "_config.yml"; then
        echo "✓ remote_theme configured for Minimal Mistakes"
    else
        echo "✗ remote_theme not found in _config.yml"
    fi

    if grep -q "minimal_mistakes_skin" "_config.yml"; then
        skin=$(grep "minimal_mistakes_skin" "_config.yml" | awk '{print $2}' | tr -d '"')
        echo "✓ Theme skin: $skin"
    fi
else
    echo "✗ _config.yml not found"
fi

# Check navigation
echo ""
echo "Checking navigation..."
if [ -f "_data/navigation.yml" ]; then
    echo "✓ _data/navigation.yml exists"
else
    echo "⚠️  _data/navigation.yml not found (optional but recommended)"
fi

# Check Gemfile
echo ""
echo "Checking Gemfile..."
if [ -f "Gemfile" ]; then
    if grep -q "github-pages" "Gemfile"; then
        echo "✓ github-pages gem configured"
    fi
    if grep -q "jekyll-include-cache" "Gemfile"; then
        echo "✓ jekyll-include-cache plugin configured"
    fi
else
    echo "✗ Gemfile not found"
fi

# Check if bundle is installed
echo ""
echo "Checking bundle..."
if command -v bundle &> /dev/null; then
    echo "✓ Bundler is installed"

    # Try to check bundle status
    if bundle check &> /dev/null; then
        echo "✓ Dependencies are installed"
    else
        echo "⚠️  Dependencies not installed. Run: bundle install"
    fi
else
    echo "⚠️  Bundler not installed. Run: gem install bundler"
fi

# Check homepage
echo ""
echo "Checking homepage..."
if [ -f "index.md" ]; then
    if grep -q "layout: splash" "index.md"; then
        echo "✓ Homepage uses splash layout"
    else
        echo "⚠️  Homepage not using splash layout"
    fi
else
    echo "✗ index.md not found"
fi

echo ""
echo "==================================="
echo "Validation Complete"
echo "==================================="
echo ""
echo "Next steps:"
echo "1. If Ruby < 3.0: Install Ruby 3.0+ or push to GitHub"
echo "2. Run: bundle install (if Ruby 3.0+)"
echo "3. Run: bundle exec jekyll serve (to test locally)"
echo "4. Or: Push to GitHub and let GitHub Pages build"
echo ""

