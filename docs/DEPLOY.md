# 🚀 Deployment Guide — webdevportfolio_ap → ithinkandicode.space

Deploy your static site from GitHub → Porkbun domain via GitHub Pages.

---

## 🧩 Overview
This project uses:
- **GitHub Pages** for static hosting  
- **Porkbun DNS** for the custom domain  
- **HTTPS (Let’s Encrypt)** for security

Deployment flow:
> Push → Publish → Point DNS → Verify

---

## 1️⃣ Enable GitHub Pages

1. Go to **Repo → Settings → Pages**  
2. Under **Build and Deployment**, set:
   - **Source:** `Deploy from a branch`
   - **Branch:** `main`
   - **Folder:** `/ (root)`
3. Click **Save**  
4. Wait for GitHub to deploy → you should see something like:  
```

Your site is live at [https://alfieprojectsdev.github.io/webdevportfolio_ap/](https://alfieprojectsdev.github.io/webdevportfolio_ap/)

```

---

## 2️⃣ Add Custom Domain

1. Still in **Settings → Pages → Custom domain**, enter:
```

ithinkandicode.space

````
2. Click **Save**  
3. GitHub will auto-create a `CNAME` file in the repo root.  
✅ Keep this file committed.

---

## 3️⃣ Configure DNS on Porkbun

Go to [porkbun.com → Account → Domain Management → Edit DNS Records](https://porkbun.com/account/domains)

Delete any conflicting records, then add the following:

### Root Domain
| Type | Host | Answer | Notes |
|------|------|---------|-------|
| A | `@` | `185.199.108.153` | GitHub Pages |
| A | `@` | `185.199.109.153` | GitHub Pages |
| A | `@` | `185.199.110.153` | GitHub Pages |
| A | `@` | `185.199.111.153` | GitHub Pages |

### www Subdomain
| Type | Host | Answer | Notes |
|------|------|---------|-------|
| CNAME | `www` | `alfieprojectsdev.github.io` | your GitHub user page |

Save all changes.

---

## 4️⃣ Enforce HTTPS

Once DNS propagates, go back to **Settings → Pages**, then:
- ✅ Check “Enforce HTTPS”

GitHub will automatically issue a Let’s Encrypt certificate.

---

## 5️⃣ Test & Verify

Wait 10–30 minutes for propagation, then test:

- [https://ithinkandicode.space](https://ithinkandicode.space)
- [https://www.ithinkandicode.space](https://www.ithinkandicode.space)

DNS status check:
👉 [dnschecker.org/#A/ithinkandicode.space](https://dnschecker.org/#A/ithinkandicode.space)

---

## 6️⃣ Optional Redirect (www → root)

If you want **everything** to resolve to the bare domain:

Create a `redirect.html` file with this:

```html
<meta http-equiv="refresh" content="0; url=https://ithinkandicode.space/">
````

Then add a small JavaScript redirect in your `index.html` if needed:

```js
if (location.hostname === "www.ithinkandicode.space") {
  location.replace("https://ithinkandicode.space" + location.pathname);
}
```

---

## ✅ Done

Your portfolio is now live at:

> [https://ithinkandicode.space](https://ithinkandicode.space)

Future updates are automatic — just push to `main`.

---

*Maintained by:* `@alfieprojectsdev`