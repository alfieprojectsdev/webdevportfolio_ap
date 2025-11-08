# Web Claude Instructions - Landing Page

**Created:** 2025-11-08
**For Instance:** landingpage Web Claude or CLI Claude
**Priority:** MEDIUM (Analytics)
**Source:** Cross-project lessons from Washboard

---

## 🎯 Mission

Add privacy-friendly analytics to track visitor behavior and project engagement.

---

## 📊 GoatCounter Analytics

### Level 1: Pageviews (2 minutes - DO THIS)

**Add to your HTML `<head>` or before `</body>`:**
```html
<script data-goatcounter="https://ithinkandicode.goatcounter.com/count"
        async src="//gc.zgo.at/count.js"></script>
```

**If using a framework (Next.js, React):**
```typescript
import Script from 'next/script'

export default function Layout({ children }) {
  return (
    <>
      {children}
      {process.env.NODE_ENV === 'production' && (
        <Script
          data-goatcounter="https://ithinkandicode.goatcounter.com/count"
          src="https://gc.zgo.at/count.js"
          strategy="afterInteractive"
        />
      )}
    </>
  )
}
```

---

### Level 2: Event Tracking (15 minutes - RECOMMENDED)

Track visitor engagement with your portfolio:

```javascript
// analytics.js
function trackEvent(eventName) {
  if (typeof window !== 'undefined' && window.goatcounter) {
    window.goatcounter.count({
      path: `/event/${eventName}`,
      title: eventName,
      event: true
    });
  }
}

// Track project clicks
document.querySelectorAll('.project-link').forEach(link => {
  link.addEventListener('click', (e) => {
    const projectName = e.target.dataset.project;
    trackEvent(`project-clicked-${projectName}`);
  });
});

// Track contact form
document.getElementById('contact-form').addEventListener('submit', () => {
  trackEvent('contact-form-submitted');
});

// Track resume download
document.getElementById('resume-link').addEventListener('click', () => {
  trackEvent('resume-downloaded');
});

// Track social media clicks
document.querySelectorAll('.social-link').forEach(link => {
  link.addEventListener('click', (e) => {
    const platform = e.target.dataset.platform;  // github, linkedin, etc.
    trackEvent(`social-${platform}-clicked`);
  });
});

// Track scroll depth (engagement metric)
let scrollDepth = 0;
window.addEventListener('scroll', () => {
  const depth = Math.round((window.scrollY / (document.body.scrollHeight - window.innerHeight)) * 100);
  if (depth > scrollDepth && depth % 25 === 0) {  // Track at 25%, 50%, 75%, 100%
    scrollDepth = depth;
    trackEvent(`scroll-depth-${depth}`);
  }
});
```

**Events to track:**
- `project-clicked-{projectName}` - Which projects get clicks
- `contact-form-submitted` - Contact intent
- `resume-downloaded` - Job interest signal
- `social-{platform}-clicked` - Which socials get traffic
- `scroll-depth-{percentage}` - Engagement depth

**Privacy:** ✅ No personal data (no names, emails, IP tracking)

---

## ✅ Acceptance Criteria

**Level 1 (Required):**
- [ ] GoatCounter script added
- [ ] Production-only loading
- [ ] Pageviews tracking in dashboard

**Level 2 (Recommended):**
- [ ] Project click tracking
- [ ] Contact form tracking
- [ ] Resume download tracking
- [ ] Social media click tracking
- [ ] Events visible in GoatCounter

---

## 🚀 Quick Start

**Quick (2 minutes):**
1. Add Level 1 GoatCounter script
2. Test in production
3. Verify pageviews in dashboard

**Thorough (17 minutes):**
1. Add Level 1 script (2 min)
2. Add Level 2 event tracking (15 min)
3. Test all tracked actions
4. Verify in dashboard

---

## 📈 Why Analytics for Portfolio?

**Insights you'll gain:**
- Which projects attract most interest
- How many visitors download your resume
- Which social platforms drive traffic
- How engaged visitors are (scroll depth)
- When to update content (low engagement signals)

**For job search:**
- Track resume downloads (interest signal)
- See which projects resonate with employers
- Optimize portfolio based on data

---

## 📚 Reference

**Full patterns:** `/home/ltpt420/repos/claude-config/coordination/CROSS_PROJECT_LESSONS_LEARNED.md`

**Note:** Landing page is likely static - no auth, no database. Analytics is primary applicable pattern.

---

*Auto-synced from `/home/ltpt420/repos/claude-config/coordination/handoffs/landingpage.md`*
*Last synced: 2025-11-08*
