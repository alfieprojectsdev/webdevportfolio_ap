#!/bin/bash
# Alternative LaTeX Installation - Fixes Dependency Conflicts
# This script tries multiple installation strategies

set -e

echo "===================================="
echo "LaTeX Dependency Conflict Resolver"
echo "===================================="
echo ""

# Check if running as root/sudo
if [ "$EUID" -ne 0 ]; then
    echo "ERROR: Please run with sudo:"
    echo "  sudo bash cv/FIX_INSTALL.sh"
    exit 1
fi

echo "Strategy 1: Try installing minimal LaTeX first..."
echo ""

# Try installing texlive-base first to resolve dependencies
apt-get install -y --fix-broken texlive-base || {
    echo "Base install failed, trying alternative approach..."
}

echo ""
echo "Strategy 2: Install packages individually..."
echo ""

# Install core packages one at a time
apt-get install -y tex-common || echo "tex-common failed, continuing..."
apt-get install -y texlive-binaries || echo "texlive-binaries failed, continuing..."
apt-get install -y texlive-base || echo "texlive-base failed, continuing..."

echo ""
echo "Strategy 3: Install with --fix-missing..."
echo ""

apt-get install -y --fix-missing \
    texlive-latex-base \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-fonts-recommended

echo ""
echo "Strategy 4: Try fonts separately..."
echo ""

# Fonts can be optional if they fail
apt-get install -y texlive-fonts-extra || {
    echo "WARNING: texlive-fonts-extra failed - CV may use fallback fonts"
    echo "This is OK, the CV will still compile"
}

echo ""
echo "===================================="
echo "Checking Installation..."
echo "===================================="
echo ""

if command -v pdflatex &> /dev/null; then
    echo "✓ SUCCESS: pdflatex installed!"
    pdflatex --version | head -n 1
    echo ""
    echo "You can now build your CV:"
    echo "  cd /home/finch/repos/landingpage/cv"
    echo "  make build"
    echo ""
else
    echo "✗ Installation incomplete."
    echo ""
    echo "Trying minimal TeXLive installation..."
    apt-get install -y texlive

    if command -v pdflatex &> /dev/null; then
        echo "✓ Minimal installation successful!"
        echo ""
        echo "NOTE: You may be missing some fonts, but basic compilation will work."
        echo ""
    else
        echo "✗ Installation failed."
        echo ""
        echo "Please try manual installation:"
        echo "  sudo apt-get update"
        echo "  sudo apt-get install texlive-full"
        echo ""
        exit 1
    fi
fi
