#!/bin/bash
# LaTeX CV Compilation Script
# Author: Alfie R. Pelicano
# Date: 2025-12-09

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
MAIN_FILE="cv.tex"
BUILD_DIR="build"
OUTPUT_DIR="../docs"
OUTPUT_FILE="AlfiePelicano_CV_2025.pdf"

# Functions
print_header() {
    echo -e "${BLUE}========================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}========================================${NC}"
    echo ""
}

print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠ $1${NC}"
}

# Check if LaTeX is installed
check_latex() {
    if ! command -v pdflatex &> /dev/null; then
        print_error "pdflatex not found!"
        echo ""
        echo "Please install LaTeX by running:"
        echo "  sudo bash INSTALL.sh"
        echo ""
        exit 1
    fi
    print_success "LaTeX installation found"
}

# Create build directory
setup_build_dir() {
    mkdir -p "$BUILD_DIR"
    mkdir -p "$OUTPUT_DIR"
    print_success "Build directories created"
}

# Clean build artifacts
clean_build() {
    if [ -d "$BUILD_DIR" ]; then
        rm -rf "$BUILD_DIR"
        print_success "Build artifacts cleaned"
    fi
}

# Compile LaTeX
compile_latex() {
    local pass=$1
    echo -e "${YELLOW}Pass $pass: Compiling...${NC}"

    if pdflatex -output-directory="$BUILD_DIR" -interaction=nonstopmode "$MAIN_FILE" > /dev/null 2>&1; then
        print_success "Pass $pass completed"
        return 0
    else
        print_error "Pass $pass failed"
        echo ""
        echo "Check the log file for details:"
        echo "  $BUILD_DIR/cv.log"
        echo ""
        echo "Last 20 lines of log:"
        tail -n 20 "$BUILD_DIR/cv.log"
        return 1
    fi
}

# Copy output PDF
copy_output() {
    if [ -f "$BUILD_DIR/cv.pdf" ]; then
        cp "$BUILD_DIR/cv.pdf" "$OUTPUT_DIR/$OUTPUT_FILE"
        print_success "PDF copied to: $OUTPUT_DIR/$OUTPUT_FILE"

        # Show file size
        local size=$(ls -lh "$OUTPUT_DIR/$OUTPUT_FILE" | awk '{print $5}')
        echo -e "${GREEN}File size: $size${NC}"
        return 0
    else
        print_error "Output PDF not found in build directory"
        return 1
    fi
}

# Main execution
main() {
    print_header "LaTeX CV Compilation"

    # Check prerequisites
    check_latex
    echo ""

    # Setup
    setup_build_dir
    echo ""

    # Compile (two passes for proper reference resolution)
    print_header "Compiling LaTeX Document"

    if ! compile_latex 1; then
        exit 1
    fi

    echo ""

    if ! compile_latex 2; then
        exit 1
    fi

    echo ""

    # Copy output
    print_header "Finalizing"

    if ! copy_output; then
        exit 1
    fi

    echo ""
    print_header "Build Complete!"

    echo "Your CV is ready:"
    echo "  $OUTPUT_DIR/$OUTPUT_FILE"
    echo ""
    echo "To view the PDF:"
    echo "  xdg-open $OUTPUT_DIR/$OUTPUT_FILE"
    echo ""
    echo "To rebuild:"
    echo "  bash compile.sh"
    echo "  or: make build"
    echo ""
}

# Handle command-line arguments
case "${1:-}" in
    clean)
        print_header "Cleaning Build Artifacts"
        clean_build
        print_success "Clean complete"
        ;;
    help|--help|-h)
        echo "LaTeX CV Compilation Script"
        echo ""
        echo "Usage:"
        echo "  bash compile.sh        - Compile CV to PDF"
        echo "  bash compile.sh clean  - Remove build artifacts"
        echo "  bash compile.sh help   - Show this help message"
        echo ""
        ;;
    *)
        main
        ;;
esac
