#!/bin/bash
# Image optimization script for Deep-MI website
# Requires ImageMagick: brew install imagemagick

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if ImageMagick is installed
if ! command -v magick &> /dev/null && ! command -v convert &> /dev/null; then
    echo -e "${RED}Error: ImageMagick is not installed${NC}"
    echo "Install it with: brew install imagemagick"
    exit 1
fi

# Determine the correct command (magick or convert)
if command -v magick &> /dev/null; then
    CONVERT_CMD="magick"
else
    CONVERT_CMD="convert"
fi

echo "Image Optimization Script"
echo "=========================="
echo ""

# Function to optimize member photos
optimize_member_photo() {
    local input_file="$1"
    local filename=$(basename "$input_file")
    local temp_file="${input_file}.tmp.jpg"

    echo -e "${YELLOW}Processing member photo: $filename${NC}"

    # Resize to 365x365 if needed, set to 72 DPI, and compress
    $CONVERT_CMD "$input_file" \
        -resize 365x365^ \
        -gravity center \
        -extent 365x365 \
        -density 72 \
        -quality 85 \
        -strip \
        "$temp_file"

    # Check file size
    size=$(wc -c < "$temp_file" | tr -d ' ')
    size_kb=$((size / 1024))

    if [ $size_kb -gt 150 ]; then
        echo -e "  ${YELLOW}Warning: ${filename} is ${size_kb}KB (recommended < 100KB)${NC}"
        echo -e "  Attempting further compression..."
        $CONVERT_CMD "$temp_file" -quality 75 "$temp_file"
        size=$(wc -c < "$temp_file" | tr -d ' ')
        size_kb=$((size / 1024))
    fi

    mv "$temp_file" "$input_file"
    echo -e "  ${GREEN}✓ Optimized: ${size_kb}KB${NC}"
}

# Function to optimize publication teasers
optimize_pub_teaser() {
    local input_file="$1"
    local filename=$(basename "$input_file")
    local temp_file="${input_file}.tmp.jpg"

    echo -e "${YELLOW}Processing publication teaser: $filename${NC}"

    # Resize to max height 200px and compress
    $CONVERT_CMD "$input_file" \
        -resize x200\> \
        -quality 85 \
        -strip \
        "$temp_file"

    # Check file size
    size=$(wc -c < "$temp_file" | tr -d ' ')
    size_kb=$((size / 1024))

    if [ $size_kb -gt 100 ]; then
        echo -e "  ${YELLOW}Warning: ${filename} is ${size_kb}KB (max 100KB)${NC}"
        echo -e "  Applying maximum compression..."
        $CONVERT_CMD "$temp_file" -quality 70 "$temp_file"
        size=$(wc -c < "$temp_file" | tr -d ' ')
        size_kb=$((size / 1024))
    fi

    mv "$temp_file" "$input_file"
    echo -e "  ${GREEN}✓ Optimized: ${size_kb}KB${NC}"
}

# Main script
case "$1" in
    member)
        if [ -z "$2" ]; then
            echo "Usage: $0 member <image-file>"
            echo "Example: $0 member static/img/members/doe.jpg"
            exit 1
        fi
        optimize_member_photo "$2"
        ;;

    pub)
        if [ -z "$2" ]; then
            echo "Usage: $0 pub <image-file>"
            echo "Example: $0 pub static/pub/doe_2026.jpg"
            exit 1
        fi
        optimize_pub_teaser "$2"
        ;;

    all-members)
        echo "Optimizing all member photos..."
        echo ""
        for img in static/img/members/*.jpg; do
            if [ -f "$img" ]; then
                optimize_member_photo "$img"
            fi
        done
        echo ""
        echo -e "${GREEN}✓ All member photos optimized!${NC}"
        ;;

    all-pubs)
        echo "Optimizing all publication teasers..."
        echo ""
        for img in static/pub/*.jpg; do
            if [ -f "$img" ]; then
                optimize_pub_teaser "$img"
            fi
        done
        echo ""
        echo -e "${GREEN}✓ All publication teasers optimized!${NC}"
        ;;

    *)
        echo "Image Optimization Script"
        echo ""
        echo "Usage:"
        echo "  $0 member <image-file>     Optimize a member photo (365x365)"
        echo "  $0 pub <image-file>        Optimize a publication teaser (max 200px height)"
        echo "  $0 all-members             Optimize all member photos"
        echo "  $0 all-pubs                Optimize all publication teasers"
        echo ""
        echo "Examples:"
        echo "  $0 member static/img/members/doe.jpg"
        echo "  $0 pub static/pub/doe_2026.jpg"
        echo "  $0 all-members"
        exit 1
        ;;
esac

