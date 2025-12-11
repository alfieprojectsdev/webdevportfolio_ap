#!/bin/bash
# Minimal LaTeX Installation (Lightweight Alternative)
# Installs only what's absolutely necessary for moderncv

set -e

echo "===================================="
echo "Minimal LaTeX Installation"
echo "===================================="
echo ""
echo "This installs a lightweight LaTeX setup (~1GB instead of ~4GB)"
echo ""

# Check if running as root/sudo
if [ "$EUID" -ne 0 ]; then
    echo "ERROR: Please run with sudo:"
    echo "  sudo bash cv/INSTALL_MINIMAL.sh"
    exit 1
fi

echo "Step 1: Update package lists..."
apt-get update

echo ""
echo "Step 2: Installing minimal LaTeX distribution..."
echo ""

# Install minimal base
apt-get install -y texlive-latex-base

echo ""
echo "Step 3: Installing recommended packages..."
echo ""

# Install recommended packages for moderncv
apt-get install -y texlive-latex-recommended

echo ""
echo "Step 4: Installing moderncv dependencies..."
echo ""

# These are needed for moderncv specifically
apt-get install -y \
    texlive-fonts-recommended \
    texlive-generic-recommended

echo ""
echo "Step 5: Installing additional LaTeX packages..."
echo ""

# Try to install extras, but don't fail if it doesn't work
apt-get install -y texlive-latex-extra || {
    echo "WARNING: texlive-latex-extra failed, trying alternative..."

    # Install specific packages needed by moderncv
    apt-get install -y \
        texlive-plain-generic \
        texlive-pictures || echo "Some packages unavailable, continuing..."
}

echo ""
echo "===================================="
echo "Installation Complete!"
echo "===================================="
echo ""

if command -v pdflatex &> /dev/null; then
    pdflatex --version | head -n 1
    echo ""
    echo "✓ SUCCESS!"
    echo ""
    echo "You can now build your CV:"
    echo "  cd /home/finch/repos/landingpage/cv"
    echo "  make build"
    echo ""
else
    echo "✗ Installation incomplete, but trying one more approach..."
    echo ""

    # Last resort: install the full distribution
    apt-get install -y texlive

    if command -v pdflatex &> /dev/null; then
        echo "✓ Minimal installation successful!"
    else
        echo "✗ Failed. Please manually install: sudo apt-get install texlive-full"
        exit 1
    fi
fi
