# LaTeX CV Pipeline

**Author:** Alfie R. Pelicano
**Generated:** 2025-12-09
**Template:** moderncv (classic style, blue color scheme)
**Output:** `../docs/AlfiePelicano_CV_2025.pdf`

---

## Overview

This directory contains a fully automated LaTeX CV compilation pipeline with version control, build scripts, and CI/CD integration. The CV is automatically rebuilt and deployed whenever changes are pushed to the repository.

**Key Features:**
- ✅ Professional moderncv template (ATS-friendly)
- ✅ Modular section files for easy maintenance
- ✅ Automated PDF compilation (Makefile + bash script)
- ✅ GitHub Actions CI/CD pipeline
- ✅ Version-controlled CV (track changes over time)
- ✅ Quick updates (<5 minutes to rebuild)

---

## Quick Start

### 1. Install LaTeX Dependencies

```bash
# Run the installation script (requires sudo)
sudo bash INSTALL.sh
```

This installs:
- `texlive-latex-extra` (moderncv and extended packages)
- `texlive-fonts-recommended` (professional fonts)
- `texlive-fonts-extra` (additional font support)

**Installation time:** 5-10 minutes
**Disk space:** ~4GB

---

### 2. Build the CV

**Option A: Using Make (Recommended)**
```bash
cd cv/
make build
```

**Option B: Using the Compile Script**
```bash
cd cv/
bash compile.sh
```

**Option C: Manual Compilation**
```bash
cd cv/
mkdir -p build
pdflatex -output-directory=build cv.tex
pdflatex -output-directory=build cv.tex  # Second pass for references
cp build/cv.pdf ../docs/AlfiePelicano_CV_2025.pdf
```

**Output:** `../docs/AlfiePelicano_CV_2025.pdf`

---

## Directory Structure

```
cv/
├── cv.tex                      # Main LaTeX document
├── config/
│   └── personal.tex            # Contact information (UPDATE THIS!)
├── sections/
│   ├── summary.tex             # Professional summary
│   ├── skills.tex              # Technical skills
│   ├── projects-production.tex # Production applications
│   ├── projects-development.tex # Active development projects
│   ├── experience.tex          # Work history
│   └── education.tex           # Education + publications
├── build/                      # Build artifacts (auto-generated, gitignored)
├── Makefile                    # Build automation
├── compile.sh                  # Standalone compilation script
├── INSTALL.sh                  # Dependency installer
└── README.md                   # This file
```

---

## Making Updates

### Updating Contact Information

Edit `config/personal.tex`:

```latex
\name{Your}{Name}
\title{Your Title}
\email{your.email@example.com}
\homepage{yourwebsite.com}
\social[github]{yourgithub}
```

### Updating Professional Summary

Edit `sections/summary.tex` and modify the `\cvitem{}` blocks.

### Adding a New Project

Edit `sections/projects-production.tex` or `sections/projects-development.tex`:

```latex
\cventry{Year}{Project Title}{\textit{Tech Stack}}{}{}{%
Description of the project.
\begin{itemize}
\item Technical highlight 1
\item Technical highlight 2
\end{itemize}
\textbf{Impact:} Real-world impact\\
\textbf{Repository:} \url{https://github.com/...}
}
```

### Updating Skills

Edit `sections/skills.tex` and modify the `\cvitem{Category}{Skills...}` entries.

### Updating Work Experience

Edit `sections/experience.tex` and use the `\cventry` format.

### After Making Changes

```bash
make build
```

The updated PDF will be at `../docs/AlfiePelicano_CV_2025.pdf`.

---

## Available Make Commands

```bash
make build      # Compile CV to PDF (default)
make clean      # Remove build artifacts
make distclean  # Remove build artifacts + output PDF
make view       # Open the generated PDF
make watch      # Auto-rebuild on file changes (requires inotify-tools)
make help       # Show help message
```

---

## Automated Builds (GitHub Actions)

The CV is automatically rebuilt whenever you push changes to the `cv/` directory.

**Workflow file:** `.github/workflows/build-cv.yml`

**Trigger conditions:**
- Push to `main` branch with changes in `cv/`
- Pull requests modifying `cv/`
- Manual workflow dispatch (from GitHub Actions tab)

**What it does:**
1. Installs LaTeX dependencies
2. Compiles CV to PDF
3. Uploads PDF as artifact (downloadable from Actions tab)
4. Commits updated PDF back to repository (if on `main` branch)

**Access artifacts:**
- Go to repository → Actions → Latest workflow run
- Download `cv-pdf` artifact

---

## Customization

### Changing Template Style

Edit `cv.tex` line 6:

```latex
\moderncvstyle{classic}  % Options: classic, casual, banking, oldstyle, fancy
```

### Changing Color Scheme

Edit `cv.tex` line 7:

```latex
\moderncvcolor{blue}  % Options: blue, orange, green, red, purple, grey, black
```

### Adjusting Page Margins

Edit `cv.tex` line 13:

```latex
\usepackage[scale=0.85]{geometry}  % Increase scale for wider margins (e.g., 0.90)
```

### Adjusting Date Column Width

Edit `cv.tex` line 14:

```latex
\setlength{\hintscolumnwidth}{3.5cm}  % Increase for wider date column
```

---

## Troubleshooting

### "pdflatex: command not found"

LaTeX is not installed. Run:
```bash
sudo bash INSTALL.sh
```

### Compilation Errors

Check the log file:
```bash
cat build/cv.log
```

Common issues:
- **Missing package:** Install `texlive-latex-extra`
- **Encoding error:** Ensure UTF-8 encoding in `.tex` files
- **Special characters:** Escape special LaTeX characters: `&`, `%`, `_`, `$`, `#`, etc.

### PDF Not Updated

1. Clean build artifacts: `make clean`
2. Rebuild: `make build`
3. Check if file was overwritten: `ls -lh ../docs/AlfiePelicano_CV_2025.pdf`

### GitHub Actions Failing

1. Check workflow run logs (repository → Actions)
2. Common issues:
   - LaTeX syntax errors (check locally first)
   - File encoding issues
   - Git push failures (check repository permissions)

---

## Version Control Best Practices

### Commit Messages

Use semantic commit messages:

```bash
# Adding new content
git commit -m "feat(cv): add Washboard project to production section"

# Fixing errors
git commit -m "fix(cv): correct PipetGo tech stack listing"

# Updating contact info
git commit -m "chore(cv): update email address"

# Updating skills
git commit -m "docs(cv): add TypeScript to frontend skills"
```

### Branching Strategy

For major CV rewrites:

```bash
git checkout -b cv-update-2025
# Make changes
make build  # Test locally
git add cv/
git commit -m "feat(cv): major update with production projects"
git push origin cv-update-2025
# Create pull request
```

### Tracking Changes

View CV history:
```bash
cd cv/
git log --oneline -- .
```

View specific file history:
```bash
git log --oneline -- sections/projects-production.tex
```

Compare versions:
```bash
git diff HEAD~5 sections/summary.tex
```

---

## Generating Multiple Versions

### 1-Page Resume (Quick Apply)

Create `cv-short.tex`:

```latex
% Copy cv.tex and comment out:
% - Active Development Projects section
% - Detailed project descriptions (keep only 2-3 top projects)
% - Select publications (keep only 1-2 most recent)
```

Compile:
```bash
pdflatex -output-directory=build cv-short.tex
cp build/cv-short.pdf ../docs/AlfiePelicano_Resume_1Page.pdf
```

### Technical Focus Version

Create `cv-tech.tex`:

```latex
% Emphasize:
% - Production projects (expand details)
% - Technical skills (full breakdown)
% - Testing/QA achievements
% Minimize:
% - Scientific computing experience (brief mention)
```

### Research Focus Version

Create `cv-research.tex`:

```latex
% Emphasize:
% - PHIVOLCS experience (expand)
% - Publications (full list)
% - Python/scientific computing projects
% Minimize:
% - Web development projects (brief mention)
```

---

## Maintenance Schedule

### Regular Updates (Every 3-6 Months)

- [ ] Review and update professional summary
- [ ] Add new projects or significant features
- [ ] Update skills section (remove outdated, add new)
- [ ] Update work experience with recent achievements
- [ ] Check for new publications/research

### Before Job Applications

- [ ] Ensure contact information is current
- [ ] Tailor professional summary to target role
- [ ] Highlight relevant projects for position
- [ ] Verify all links work (GitHub, portfolio, live demos)
- [ ] Spell check and proofread
- [ ] Test PDF opens correctly on different devices

### After Major Projects

- [ ] Add to production or development section
- [ ] Update technical highlights
- [ ] Add test coverage metrics
- [ ] Include deployment URLs if applicable

---

## Advanced Features

### Watch Mode (Auto-Rebuild on Changes)

Install inotify-tools:
```bash
sudo apt-get install inotify-tools
```

Enable watch mode:
```bash
make watch
```

Now the CV rebuilds automatically whenever you save changes to any `.tex` file.

### Pre-Commit Hook (Auto-Build Before Commit)

Create `.git/hooks/pre-commit`:

```bash
#!/bin/bash
cd cv/
make build
git add ../docs/AlfiePelicano_CV_2025.pdf
```

Make it executable:
```bash
chmod +x .git/hooks/pre-commit
```

Now the CV rebuilds automatically before every commit.

---

## File Size Optimization

Current PDF size: ~150-200KB (estimated)

To reduce file size:

1. **Remove unnecessary fonts:**
   ```latex
   % Use only essential fonts
   ```

2. **Compress images (if added):**
   ```bash
   convert input.png -quality 85 output.png
   ```

3. **Use PDF compression:**
   ```bash
   gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook \
      -dNOPAUSE -dQUIET -dBATCH \
      -sOutputFile=output.pdf input.pdf
   ```

---

## Resources

### LaTeX Documentation

- **moderncv manual:** [CTAN moderncv](https://www.ctan.org/pkg/moderncv)
- **LaTeX symbols:** [Detexify](http://detexify.kirelabs.org/classify.html)
- **LaTeX tables generator:** [TablesGenerator](https://www.tablesgenerator.com/)

### CV Best Practices

- Keep to 2-3 pages maximum
- Use active voice ("Built", "Implemented", not "Responsible for")
- Quantify achievements (test numbers, coverage percentages)
- Include live demo links for deployed projects
- Ensure ATS-friendly formatting (moderncv classic style is good)

### Checking ATS Compatibility

Upload CV to:
- [Resume Worded](https://resumeworded.com/)
- [Jobscan](https://www.jobscan.co/)

---

## Support

### Issues

If you encounter problems:

1. Check the troubleshooting section above
2. Review LaTeX log file: `cat build/cv.log`
3. Test compilation manually: `pdflatex cv.tex`
4. Verify LaTeX installation: `pdflatex --version`

### Questions

For CV content questions, refer to:
- `CV_UPDATE_RECOMMENDATIONS.md` (comprehensive update guide)
- `PORTFOLIO_UPDATE_RECOMMENDATIONS.md` (portfolio sync guide)

---

## License

This CV template and build system is customized for Alfie R. Pelicano. The moderncv class is licensed under the LaTeX Project Public License (LPPL).

---

**Last Updated:** 2025-12-09
**Maintained By:** Alfie R. Pelicano
**Repository:** https://github.com/alfieprojectsdev/webdevportfolio_ap
