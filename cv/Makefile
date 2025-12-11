# Makefile for LaTeX CV compilation
# Author: Alfie R. Pelicano
# Date: 2025-12-09

# Variables
MAIN = cv
OUTPUT_DIR = ../docs
BUILD_DIR = build
LATEX = pdflatex
LATEX_FLAGS = -output-directory=$(BUILD_DIR) -interaction=nonstopmode

# Default target
.PHONY: all
all: build

# Build the CV PDF
.PHONY: build
build: clean
	@echo "========================================"
	@echo "Building CV..."
	@echo "========================================"
	@mkdir -p $(BUILD_DIR)
	@echo ""
	@echo "First pass (generating auxiliary files)..."
	@$(LATEX) $(LATEX_FLAGS) $(MAIN).tex || (echo "ERROR: First pass failed. Check $(BUILD_DIR)/$(MAIN).log"; exit 1)
	@echo "Second pass (resolving references)..."
	@$(LATEX) $(LATEX_FLAGS) $(MAIN).tex || (echo "ERROR: Second pass failed. Check $(BUILD_DIR)/$(MAIN).log"; exit 1)
	@echo ""
	@echo "========================================"
	@echo "Build complete!"
	@echo "========================================"
	@mkdir -p $(OUTPUT_DIR)
	@cp $(BUILD_DIR)/$(MAIN).pdf $(OUTPUT_DIR)/AlfiePelicano_CV_2025.pdf
	@echo "PDF copied to: $(OUTPUT_DIR)/AlfiePelicano_CV_2025.pdf"
	@echo ""
	@ls -lh $(OUTPUT_DIR)/AlfiePelicano_CV_2025.pdf
	@echo ""

# Watch for changes and auto-rebuild
.PHONY: watch
watch:
	@echo "========================================"
	@echo "Watching for changes..."
	@echo "Press Ctrl+C to stop"
	@echo "========================================"
	@while true; do \
		inotifywait -e modify,create,delete -r . 2>/dev/null && \
		make build; \
	done

# Clean build artifacts
.PHONY: clean
clean:
	@echo "Cleaning build artifacts..."
	@rm -rf $(BUILD_DIR)
	@echo "Clean complete."

# Deep clean (including output PDF)
.PHONY: distclean
distclean: clean
	@rm -f $(OUTPUT_DIR)/AlfiePelicano_CV_2025.pdf
	@echo "Deep clean complete."

# View the generated PDF
.PHONY: view
view:
	@if [ -f "$(OUTPUT_DIR)/AlfiePelicano_CV_2025.pdf" ]; then \
		xdg-open $(OUTPUT_DIR)/AlfiePelicano_CV_2025.pdf 2>/dev/null || \
		open $(OUTPUT_DIR)/AlfiePelicano_CV_2025.pdf 2>/dev/null || \
		echo "Please open $(OUTPUT_DIR)/AlfiePelicano_CV_2025.pdf manually"; \
	else \
		echo "ERROR: PDF not found. Run 'make build' first."; \
	fi

# Help target
.PHONY: help
help:
	@echo "LaTeX CV Build System"
	@echo "====================="
	@echo ""
	@echo "Available targets:"
	@echo "  make build      - Compile CV to PDF (default)"
	@echo "  make clean      - Remove build artifacts"
	@echo "  make distclean  - Remove build artifacts and output PDF"
	@echo "  make view       - Open the generated PDF"
	@echo "  make watch      - Auto-rebuild on file changes (requires inotify-tools)"
	@echo "  make help       - Show this help message"
	@echo ""
	@echo "Output: $(OUTPUT_DIR)/AlfiePelicano_CV_2025.pdf"
	@echo ""
