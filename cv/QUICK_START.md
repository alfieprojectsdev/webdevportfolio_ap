# LaTeX CV - Quick Start Guide

**For when you need to update your CV fast** ⚡

---

## 🚀 First Time Setup (5-10 minutes)

```bash
# 1. Install LaTeX (one-time, requires sudo password)
cd cv/
sudo bash INSTALL.sh

# 2. Build your CV
make build

# 3. View the PDF
xdg-open ../docs/AlfiePelicano_CV_2026.pdf
```

**That's it!** Your CV is now at `docs/AlfiePelicano_CV_2026.pdf`

---

## ✏️ Common Updates (2-5 minutes each)

### Update Contact Info

```bash
# Edit this file:
nano config/personal.tex

# Change email, website, GitHub, etc.
# Then rebuild:
make build
```

### Add a New Project

```bash
# For production projects:
nano sections/projects-production.tex

# For projects in development:
nano sections/projects-development.tex

# Then rebuild:
make build
```

### Update Skills

```bash
nano sections/skills.tex
make build
```

### Update Summary

```bash
nano sections/summary.tex
make build
```

---

## 🔧 Essential Commands

```bash
make build      # Build the CV (use this 99% of the time)
make clean      # Clear build artifacts if something's broken
make view       # Open the PDF
make help       # Show all available commands
```

---

## 📝 Project Entry Template

Copy-paste this into `sections/projects-production.tex`:

```latex
\cventry{2024--Present}{Project Name}{\textit{Tech Stack Here}}{}{}{%
Brief description of what this project does.
\begin{itemize}
\item Key technical achievement 1
\item Key technical achievement 2
\item Key technical achievement 3
\end{itemize}
\textbf{Impact:} Real-world impact or deployment status\\
\textbf{Repository:} \url{https://github.com/yourusername/repo}
}

\vspace{0.5em}
```

---

## 🐛 When Something Breaks

```bash
# 1. Clean everything
make clean

# 2. Try again
make build

# 3. If still broken, check the log
cat build/cv.log | tail -n 30

# 4. Still stuck? Check README.md troubleshooting section
```

---

## 🎯 Pre-Job Application Checklist

```bash
# 1. Update CV content
nano sections/projects-production.tex  # Add latest work
nano sections/summary.tex               # Tailor to job
nano config/personal.tex                # Verify contact info

# 2. Rebuild
make build

# 3. Check the PDF
xdg-open ../docs/AlfiePelicano_CV_2026.pdf

# 4. Spell check (visually review PDF)

# 5. Test links work
#    - GitHub profile
#    - Portfolio website
#    - Live demo links

# 6. Save a dated copy
cp ../docs/AlfiePelicano_CV_2026.pdf ~/Desktop/AlfiePelicano_CV_$(date +%Y%m%d).pdf
```

---

## 📤 Commit and Push Changes

```bash
# 1. Build first
make build

# 2. Stage changes
git add cv/ docs/AlfiePelicano_CV_2026.pdf

# 3. Commit with meaningful message
git commit -m "feat(cv): add Washboard project to production section"

# 4. Push
git push origin main

# GitHub Actions will rebuild automatically and verify compilation!
```

---

## 💡 Pro Tips

- **Always build locally before committing** - catches errors early
- **Keep sections modular** - easier to reorder or remove projects
- **Use semantic commits** - `feat(cv):`, `fix(cv):`, `chore(cv):`
- **Date your exports** - helpful when applying to multiple jobs
- **Test on multiple devices** - ensure PDF looks good everywhere

---

## 🆘 Need Help?

1. **Full documentation:** `README.md` in this directory
2. **LaTeX errors:** Check `build/cv.log` for details
3. **Broken PDF:** Try `make clean && make build`

---

**Remember:** The CV source files (`cv/*.tex`) are your source of truth. The PDF is just the compiled output. Always edit the `.tex` files, never try to edit the PDF directly!

---

**Generated:** 2025-12-09
**Last Updated:** 2026-03-18
**Template:** moderncv classic (blue)
**Output:** `docs/AlfiePelicano_CV_2026.pdf`
