#!/bin/bash
# Image optimization script for Deep-MI website
# Requires ImageMagick: brew install imagemagick

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Array to track temporary files for cleanup
TEMP_FILES=()

# Array to track backup files
BACKUP_FILES=()

# Cleanup function
cleanup() {
    if [ ${#TEMP_FILES[@]} -gt 0 ]; then
        for temp_file in "${TEMP_FILES[@]}"; do
            if [ -f "$temp_file" ]; then
                rm -f "$temp_file"
            fi
        done
    fi
}

# Set up trap to cleanup on exit or error
trap cleanup EXIT ERR INT TERM

# Function to create backup
create_backup() {
    local input_file="$1"
    local backup_file="${input_file}.backup"

    if cp "$input_file" "$backup_file" 2>/dev/null; then
        BACKUP_FILES+=("$backup_file")
        return 0
    else
        echo -e "  ${RED}✗ Error: Failed to create backup${NC}"
        return 1
    fi
}

# Function to restore from backup
restore_backup() {
    local input_file="$1"
    local backup_file="${input_file}.backup"

    if [ -f "$backup_file" ]; then
        mv "$backup_file" "$input_file"
        # Remove from backup tracking
        BACKUP_FILES=("${BACKUP_FILES[@]/$backup_file}")
        return 0
    fi
    return 1
}

# Function to remove backup
remove_backup() {
    local input_file="$1"
    local backup_file="${input_file}.backup"

    if [ -f "$backup_file" ]; then
        rm -f "$backup_file"
        # Remove from backup tracking
        BACKUP_FILES=("${BACKUP_FILES[@]/$backup_file}")
    fi
}

# Check if ImageMagick is installed
if ! command -v magick &> /dev/null && ! command -v convert &> /dev/null; then
    echo -e "${RED}Error: ImageMagick is not installed${NC}"
    echo ""
    echo "Please install ImageMagick for your platform:"
    echo ""
    echo "  macOS:"
    echo "    brew install imagemagick"
    echo ""
    echo "  Ubuntu/Debian Linux:"
    echo "    sudo apt-get update"
    echo "    sudo apt-get install imagemagick"
    echo ""
    echo "  Fedora/RHEL/CentOS Linux:"
    echo "    sudo yum install imagemagick"
    echo "    # or on newer systems:"
    echo "    sudo dnf install imagemagick"
    echo ""
    echo "  Arch Linux:"
    echo "    sudo pacman -S imagemagick"
    echo ""
    echo "  Windows:"
    echo "    Download from: https://imagemagick.org/script/download.php#windows"
    echo "    Or use Chocolatey: choco install imagemagick"
    echo "    Or use Scoop: scoop install imagemagick"
    echo ""
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

    # Add to cleanup list
    TEMP_FILES+=("$temp_file")

    echo -e "${YELLOW}Processing member photo: $filename${NC}"

    # Check if input file exists and is readable
    if [ ! -f "$input_file" ]; then
        echo -e "  ${RED}✗ Error: File not found: $input_file${NC}"
        return 1
    fi

    if [ ! -r "$input_file" ]; then
        echo -e "  ${RED}✗ Error: File not readable: $input_file${NC}"
        return 1
    fi

    # Create backup before processing
    if ! create_backup "$input_file"; then
        return 1
    fi

    # Resize to 365x365 if needed, set to 72 DPI, and compress
    if ! $CONVERT_CMD "$input_file" \
        -resize 365x365^ \
        -gravity center \
        -extent 365x365 \
        -density 72 \
        -quality 85 \
        -strip \
        "$temp_file" 2>/dev/null; then
        echo -e "  ${RED}✗ Error: Failed to process image (possibly corrupt or invalid format)${NC}"
        rm -f "$temp_file"
        restore_backup "$input_file"
        return 1
    fi

    # Check file size
    size=$(wc -c < "$temp_file" | tr -d ' ')
    size_kb=$((size / 1024))

    if [ $size_kb -gt 100 ]; then
        echo -e "  ${YELLOW}Warning: ${filename} is ${size_kb}KB (max 100KB)${NC}"
        echo -e "  Attempting further compression..."
        if ! $CONVERT_CMD "$temp_file" -quality 75 "$temp_file" 2>/dev/null; then
            echo -e "  ${RED}✗ Error: Failed to compress image${NC}"
            rm -f "$temp_file"
            restore_backup "$input_file"
            return 1
        fi
        size=$(wc -c < "$temp_file" | tr -d ' ')
        size_kb=$((size / 1024))
    fi

    mv "$temp_file" "$input_file"
    # Remove from cleanup list after successful move
    TEMP_FILES=("${TEMP_FILES[@]/$temp_file}")
    # Remove backup after successful optimization
    remove_backup "$input_file"
    echo -e "  ${GREEN}✓ Optimized: ${size_kb}KB (backup removed)${NC}"
    return 0
}

# Function to optimize publication teasers
optimize_pub_teaser() {
    local input_file="$1"
    local filename=$(basename "$input_file")
    local temp_file="${input_file}.tmp.jpg"

    # Add to cleanup list
    TEMP_FILES+=("$temp_file")

    echo -e "${YELLOW}Processing publication teaser: $filename${NC}"

    # Check if input file exists and is readable
    if [ ! -f "$input_file" ]; then
        echo -e "  ${RED}✗ Error: File not found: $input_file${NC}"
        return 1
    fi

    if [ ! -r "$input_file" ]; then
        echo -e "  ${RED}✗ Error: File not readable: $input_file${NC}"
        return 1
    fi

    # Create backup before processing
    if ! create_backup "$input_file"; then
        return 1
    fi

    # Resize to max height 200px and compress
    if ! $CONVERT_CMD "$input_file" \
        -resize x200\> \
        -quality 85 \
        -strip \
        "$temp_file" 2>/dev/null; then
        echo -e "  ${RED}✗ Error: Failed to process image (possibly corrupt or invalid format)${NC}"
        rm -f "$temp_file"
        restore_backup "$input_file"
        return 1
    fi

    # Check file size
    size=$(wc -c < "$temp_file" | tr -d ' ')
    size_kb=$((size / 1024))

    if [ $size_kb -gt 100 ]; then
        echo -e "  ${YELLOW}Warning: ${filename} is ${size_kb}KB (max 100KB)${NC}"
        echo -e "  Applying maximum compression..."
        if ! $CONVERT_CMD "$temp_file" -quality 70 "$temp_file" 2>/dev/null; then
            echo -e "  ${RED}✗ Error: Failed to compress image${NC}"
            rm -f "$temp_file"
            restore_backup "$input_file"
            return 1
        fi
        size=$(wc -c < "$temp_file" | tr -d ' ')
        size_kb=$((size / 1024))
    fi

    mv "$temp_file" "$input_file"
    # Remove from cleanup list after successful move
    TEMP_FILES=("${TEMP_FILES[@]/$temp_file}")
    # Remove backup after successful optimization
    remove_backup "$input_file"
    echo -e "  ${GREEN}✓ Optimized: ${size_kb}KB (backup removed)${NC}"
    return 0
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
        success_count=0
        error_count=0
        for img in static/img/members/*.jpg; do
            if [ -f "$img" ]; then
                if optimize_member_photo "$img"; then
                    ((success_count++))
                else
                    ((error_count++))
                fi
            fi
        done
        echo ""
        if [ $error_count -eq 0 ]; then
            echo -e "${GREEN}✓ All member photos optimized! ($success_count processed)${NC}"
        else
            echo -e "${YELLOW}⚠ Completed with errors: $success_count succeeded, $error_count failed${NC}"
            exit 1
        fi
        ;;

    all-pubs)
        echo "Optimizing all publication teasers..."
        echo ""
        success_count=0
        error_count=0
        for img in static/pub/*.jpg; do
            if [ -f "$img" ]; then
                if optimize_pub_teaser "$img"; then
                    ((success_count++))
                else
                    ((error_count++))
                fi
            fi
        done
        echo ""
        if [ $error_count -eq 0 ]; then
            echo -e "${GREEN}✓ All publication teasers optimized! ($success_count processed)${NC}"
        else
            echo -e "${YELLOW}⚠ Completed with errors: $success_count succeeded, $error_count failed${NC}"
            if [ ${#BACKUP_FILES[@]} -gt 0 ]; then
                echo -e "${YELLOW}⚠ ${#BACKUP_FILES[@]} backup file(s) retained due to errors${NC}"
                echo -e "  To restore, run: mv <file>.backup <file>"
            fi
            exit 1
        fi
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

