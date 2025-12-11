#!/bin/bash
# LaTeX Installation Script for CV Pipeline
# Run this script with sudo to install required dependencies

set -e

echo "=================================="
echo "LaTeX CV Pipeline - Dependency Installer"
echo "=================================="
echo ""

# Check if running as root/sudo
if [ "$EUID" -ne 0 ]; then
    echo "ERROR: Please run with sudo:"
    echo "  sudo bash INSTALL.sh"
    exit 1
fi

echo "Updating package lists..."
apt-get update

echo ""
echo "Installing LaTeX packages (this may take 5-10 minutes)..."
echo "Required packages:"
echo "  - texlive-latex-extra (moderncv and extended LaTeX packages)"
echo "  - texlive-fonts-recommended (professional fonts)"
echo "  - texlive-fonts-extra (additional font support)"
echo ""

apt-get install -y \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-fonts-extra

echo ""
echo "=================================="
echo "Installation Complete!"
echo "=================================="
echo ""
echo "Verifying installation..."
pdflatex --version | head -n 1

echo ""
echo "You can now compile the CV:"
echo "  cd /home/finch/repos/landingpage/cv"
echo "  make build"
echo ""
echo "Or use the compile script:"
echo "  bash compile.sh"
echo ""
