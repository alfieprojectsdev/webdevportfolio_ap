# CLAUDE.md - Landing Page Portfolio

**Project:** webdevportfolio_ap (Landing Page)
**Location:** `/home/ltpt420/repos/landingpage/`
**Purpose:** Professional portfolio website showcasing real projects
**Tech Stack:** HTML5, CSS3, Vanilla JavaScript
**Deployment:** GitHub Pages

---

## Project Overview

This is a professional portfolio landing page showcasing Alfie Pelicano's web development projects. It features:

- **Parkboard** - Condo parking marketplace (In Production)
- **PipetGo** - B2B lab services marketplace (Active Development)
- **Carpool Coordinator** - School carpool platform (Planning)
- **Window Cards Generator** - Math worksheet generator (In Production)

**Design Philosophy:** Clean, professional, accessible, and performance-focused.

---

## Technology Stack

**Frontend:**
- HTML5 (semantic markup)
- CSS3 (custom properties, Grid, Flexbox)
- Vanilla JavaScript (no frameworks - keep it light)

**Typography:**
- Google Fonts: Inter (primary font family)

**Deployment:**
- GitHub Pages (static hosting)
- Custom domain: TBD

---

## File Structure

```
landingpage/
├── index.html           # Main landing page
├── styles.css           # All styling (no CSS frameworks)
├── README.md            # Project documentation
├── .claude/             # Claude Code configuration
│   ├── agents/          # Symlinked from claude-config
│   └── commands/        # Symlinked from claude-config
└── CLAUDE.md            # This file
```

---

## Design System

### Color Palette

```css
--primary: #2563eb         /* Primary blue */
--primary-dark: #1e40af    /* Dark blue */
--secondary: #64748b       /* Slate gray */
--text-primary: #0f172a    /* Almost black */
--text-secondary: #475569  /* Dark gray */
--bg-primary: #ffffff      /* White */
--bg-secondary: #f8fafc    /* Light gray */
--bg-tertiary: #f1f5f9     /* Lighter gray */
--border: #e2e8f0          /* Border color */
--success: #10b981         /* Green */
--warning: #f59e0b         /* Orange */
--info: #3b82f6            /* Blue */
```

### Typography Scale

- **Hero Title:** 3.5rem (56px)
- **Hero Subtitle:** 1.5rem (24px)
- **Section Title:** 2.5rem (40px)
- **Project Title:** 1.5rem (24px)
- **Body:** 1.125rem (18px)
- **Small:** 0.875rem (14px)

### Spacing System

- **Section Padding:** 80px vertical
- **Card Padding:** 32px
- **Grid Gap:** 32px
- **Element Gap:** 16px

---

## Project Cards Structure

Each project card includes:

1. **Header:** Icon + Status badge
2. **Title:** Project name
3. **Description:** 2-3 sentence overview
4. **Details Section:**
   - Problem being solved
   - Solution implemented
   - Current impact/stage
5. **Tech Stack:** Technology tags
6. **Links:** GitHub + Live Demo (if applicable)

**Status Types:**
- `In Production` - Live and being used (green)
- `Active Development` - Currently being built (blue)
- `Planning` - In design/planning phase (yellow)

---

## Responsive Breakpoints

```css
/* Desktop: Default (1200px+ container) */
/* Tablet: 768px and below */
/* Mobile: 480px and below */
```

**Responsive Behavior:**
- Hero: Font sizes scale down on mobile
- Projects Grid: Stacks to single column on mobile
- Skills Grid: Stacks to single column on tablet
- Buttons: Full width on mobile

---

## Performance Optimization

**Loading Strategy:**
- Critical CSS inline (if needed)
- Google Fonts with `preconnect`
- Smooth scrolling with JavaScript
- No heavy frameworks (pure vanilla JS)

**Target Metrics:**
- Lighthouse Performance: 95+
- First Contentful Paint: <1.5s
- Time to Interactive: <2.5s
- Total Bundle Size: <50KB

---

## Accessibility Standards

**WCAG 2.1 AA Compliance:**
- Semantic HTML5 elements
- Proper heading hierarchy (h1 → h2 → h3)
- Sufficient color contrast (4.5:1 minimum)
- Keyboard navigation support
- Focus states on interactive elements
- Alt text for future images

---

## Development Workflow

### Making Changes

1. **Edit HTML/CSS** in respective files
2. **Test locally:** Open `index.html` in browser
3. **Commit changes** with descriptive messages
4. **Push to GitHub** - Auto-deploys to GitHub Pages

### Testing Checklist

Before committing:
- [ ] Test in Chrome, Firefox, Safari
- [ ] Test responsive design (mobile, tablet, desktop)
- [ ] Validate HTML (https://validator.w3.org/)
- [ ] Check accessibility (Lighthouse, WAVE)
- [ ] Verify all links work
- [ ] Check smooth scrolling

---

## Deployment to GitHub Pages

**Setup:**
```bash
# Ensure on main branch
git checkout main

# Push to GitHub
git push origin main

# Enable GitHub Pages in repo settings:
# Settings → Pages → Source: main branch → /root
```

**URL:** `https://alfieprojectsdev.github.io/webdevportfolio_ap/`

---

## Content Update Guidelines

### Adding a New Project

1. Add new `<article class="project-card">` in `index.html`
2. Include all required sections:
   - Icon, status badge
   - Title, description
   - Problem/Solution/Impact details
   - Tech stack tags
   - Links (GitHub + demo)
3. Update README.md if needed

### Updating Project Status

**Status changes:**
- `Planning` → `Active Development` → `In Production`

Update both:
- Status badge class (`status-planning`, `status-active`, `status-production`)
- Badge text

---

## Future Enhancements

**Phase 2 (Optional):**
- [ ] Add project screenshots/videos
- [ ] Blog section for technical write-ups
- [ ] Contact form
- [ ] Dark mode toggle
- [ ] Analytics (GoatCounter - privacy-friendly)
- [ ] Case studies for each project

**Phase 3 (If needed):**
- [ ] Convert to Next.js for better SEO
- [ ] Add CMS for easier content updates
- [ ] Custom domain setup

---

## Agent Usage Guidelines

### When to Use Specific Agents

**@architect:**
- Planning new sections/features
- Restructuring content hierarchy
- Accessibility improvements

**@developer:**
- Implementing new features
- Refactoring CSS
- Adding JavaScript functionality

**@ux-reviewer:**
- Reviewing accessibility
- Evaluating user flow
- Checking responsive design

**@technical-writer:**
- Updating this CLAUDE.md
- Writing project descriptions
- Creating documentation

---

## Root Instance Coordination

**Project Status:** Active - Portfolio Development
**Priority:** Medium (after pipetgo Phase 4)

**Coordination Files:**
- `/home/ltpt420/repos/claude-config/coordination/project-status/landingpage-status.md` (to be created)

**Escalation Triggers:**
- Design decisions requiring user input
- Major structure changes
- Deployment issues

---

## Git Workflow

**Branching Strategy:** Simple main branch (no feature branches needed for small portfolio)

**Commit Message Format:**
```
<type>: <description>

Examples:
feat: add new project card for Drive Archaeologist
fix: correct responsive layout on mobile
style: improve project card hover effects
docs: update CLAUDE.md with deployment instructions
```

---

## Quality Standards

**Before Committing:**
- [ ] HTML validates (https://validator.w3.org/)
- [ ] CSS is clean (no unused rules)
- [ ] Links are functional
- [ ] Responsive on all breakpoints
- [ ] Lighthouse score 95+ (Performance, Accessibility)
- [ ] No console errors

---

## Notes

- **Keep it simple:** No frameworks needed - vanilla HTML/CSS/JS is perfect for this
- **Performance first:** Static site should be blazing fast
- **Content over code:** Focus on showcasing projects clearly
- **Mobile-first:** Many recruiters view portfolios on mobile

---

**Last Updated:** 2025-11-02
**Maintained By:** Alfie Pelicano
**Claude Instance:** landingpage-specific (coordinated with root)
