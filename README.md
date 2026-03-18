# webdevportfolio_ap

Personal portfolio site for Alfie Pelicano — Research Specialist & Geodetic Software Developer.

**Live:** https://ithinkandicode.space
**GitHub Pages:** https://alfieprojectsdev.github.io/webdevportfolio_ap/

---

## About

I work at the intersection of earth science and software engineering — processing GNSS and geophysical data for earthquake research and fault monitoring at PHIVOLCS, while building the software to automate what shouldn't still be manual. 16+ years in scientific computing and spatial data.

> *"All models are wrong, but some are useful." — George E. P. Box*

---

## Projects

### 🌋 Earth Science & Field Automation

| Project | Description | Status |
|---|---|---|
| **[MOVE Faults](https://github.com/alfieprojectsdev/movefaults)** | Flagship GNSS automation monorepo — Celery-backed distributed task queue, NMEA TCP streaming, offline React field app | Active Dev |
| **[EIL Hazard Suite](https://github.com/alfieprojectsdev/eil-viz)** | Decoupled geohazard system: EIL-Calc headless spatial processing engine + EIL-Viz React ground-truth visualizer | Active Dev |
| **[PHAST](https://github.com/alfieprojectsdev/phat)** | Chrome Extension injecting GIS controls into Leaflet maps; auto-generates official PHIVOLCS hazard assessment text | In Production |
| **[SIPAT](https://github.com/alfieprojectsdev/sipat)** | Open-source CAPI alternative for field researchers — offline-first, complex survey logic, audio transcription | Active Dev |
| **[Drive Archaeologist](https://github.com/alfieprojectsdev/drive-archaeologist)** | Python CLI for excavating and organizing legacy GNSS data (RINEX), deduplication, migration scripts | Active Dev |

### 💻 Full-Stack Platforms & Civic Tech

| Project | Description | Status |
|---|---|---|
| **[YAKAP-Link](https://github.com/alfieprojectsdev/yakap-link)** | Civic tech for PhilHealth YAKAP program — transaction constraints and dispensing guard logic to prevent phantom claims | Active Dev |
| **[PipetGo](https://github.com/alfieprojectsdev/pipetgo)** | B2B laboratory marketplace MVP connecting businesses with ISO-accredited testing labs; multi-tiered pricing (QUOTE/FIXED/HYBRID), role-based auth | In Production |
| **Homebase** | Multi-residence household command center for ADHD executive function support — aggressive urgency system, recurring bill engine, heuristics anomaly detection, distributed notification loop | Active Dev |
| **[Carpool Coordinator](https://github.com/alfieprojectsdev/carpool-app)** | Community carpooling platform with schedule matching, vehicle details, interest tracking | Active Dev |
| **[Washboard](https://github.com/alfieprojectsdev/washboard)** | Car wash queue system — contactless QR bookings, real-time receptionist dashboard, magic-link check-ins | Active Dev |

### 🧮 Algorithms, Architecture & Utility

| Project | Description | Status |
|---|---|---|
| **[UGT (Chaotic Circuits)](https://github.com/alfieprojectsdev/ugt)** | Python/LaTeX reconstruction of 2004 physics thesis — numerical solvers for Lyapunov Exponents in chaotic Sprott circuits | Active Dev |
| **[Window Cards Generator](https://github.com/alfieprojectsdev/windowcards)** | Zero-dependency Vanilla JS constraint-solving engine for printable math worksheets; designed for classrooms with limited device access | In Production |
| **[ArtPortfolio](https://github.com/alfieprojectsdev/artportfolio)** | High-performance statically generated Astro CMS for digital art commissions — minimal cognitive load, fast asset delivery | In Production |
| **NightCoder Orchestrator** | ADR-to-patch automation engine using local LLMs (Ollama) — multi-agent planner/coder loop with safety-gated apply | Active Dev |
| **SciWriter Orchestrator** | Research note to manuscript pipeline — draft/refine/terminology passes, LaTeX/Beamer export | Active Dev |

---

## Tech Stack

**Frontend:** Next.js, React, Astro, TypeScript, Vanilla JS, Tailwind CSS
**Backend:** Python/FastAPI, Node.js/Express, Celery, Redis, Docker, LangGraph/Ollama
**Database:** PostgreSQL, Neon, Supabase, Prisma
**Domain:** GNSS Processing, Spatial Geohazards, Heuristic Engines, Constraint Solving, Fortran

---

## Site

Static single-page site. No build tools, no frameworks.

```
index.html    # ~44KB — all content + inline JS
styles.css    # ~14KB — CSS custom properties
assets/       # screenshots
cv/           # LaTeX CV pipeline (make build → docs/AlfiePelicano_CV_2026.pdf)
```

Deployed automatically to GitHub Pages on push to `main`.

---

## Author

Alfie Pelicano · [ithinkandicode.space](https://ithinkandicode.space) · alfieprojects.dev@gmail.com
