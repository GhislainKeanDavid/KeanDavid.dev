<div align="center">

# Ghislain Kean David — Portfolio

Personal portfolio website showcasing my work as a **Web & Automation Specialist** — building intelligent workflows, AI agent pipelines, and responsive web applications.

### 🌐 Live site → **[keandavid.cloud](https://keandavid.cloud)**

[![Live](https://img.shields.io/badge/Live-keandavid.cloud-d95a38?style=for-the-badge)](https://keandavid.cloud)
[![Svelte](https://img.shields.io/badge/SvelteKit-FF3E00?style=for-the-badge&logo=svelte&logoColor=white)](https://svelte.dev/)
[![TypeScript](https://img.shields.io/badge/TypeScript-3178C6?style=for-the-badge&logo=typescript&logoColor=white)](https://www.typescriptlang.org/)
[![Vite](https://img.shields.io/badge/Vite-646CFF?style=for-the-badge&logo=vite&logoColor=white)](https://vite.dev/)

</div>

---

## ✨ Overview

A fast, fully static single-page portfolio with a fixed sidebar (profile, tech stack, and contact links) and a content area featuring work experience and projects. The design uses a warm, terminal-inspired dark theme, brand-colored technology logos, subtle entrance animations, and fluid typography that scales smoothly across screen sizes.

## 🛠️ Tech Stack

- **Framework:** [SvelteKit](https://svelte.dev/) (Svelte 5, runes mode)
- **Language:** TypeScript
- **Build tool:** [Vite](https://vite.dev/)
- **Rendering:** Fully prerendered static site via [`@sveltejs/adapter-static`](https://svelte.dev/docs/kit/adapter-static)
- **Styling:** Plain CSS with custom properties and fluid `clamp()` scaling
- **Tooling:** ESLint, Prettier, `svelte-check`
- **Deployment:** Docker (multi-stage build → nginx) behind a Traefik reverse proxy with automatic Let's Encrypt SSL

## 🎯 Features

- ⚡ Static, prerendered, and lightning fast — no backend required
- 📱 Responsive layout with fluid typography that scales from mobile to large monitors
- 🎨 Brand-colored technology logos with hover tooltips
- ⌨️ Animated typing effect and smooth on-load transitions
- 🔗 Quick links to GitHub, LinkedIn, email, and more
- 🔒 Served over HTTPS

## 🚀 Getting Started

> Requires [Node.js](https://nodejs.org/) 18+ and npm.

```sh
# Clone the repository
git clone https://github.com/GhislainKeanDavid/KeanDavid.dev.git
cd KeanDavid.dev

# Install dependencies
npm install

# Start the dev server
npm run dev

# ...or open it in a new browser tab automatically
npm run dev -- --open
```

## 📦 Building

```sh
# Create a production build (outputs to ./build)
npm run build

# Preview the production build locally
npm run preview
```

## 🌍 Deployment

The site is deployed as a Docker container behind a Traefik reverse proxy:

```sh
# On the server
docker compose up -d --build
```

The included multi-stage `Dockerfile` builds the static site with Node and serves it with a lightweight nginx image. Traefik labels in `docker-compose.yml` handle routing and automatic TLS certificates.

## 📁 Project Structure

```
src/
├─ app.css                 # Global styles, theme variables, fluid scaling
├─ app.html                # HTML shell
├─ lib/
│  ├─ assets/              # Static assets (favicon, etc.)
│  └─ components/
│     └─ Sidebar.svelte    # Profile, tech stack, and contact links
└─ routes/
   ├─ +layout.svelte       # App shell (sidebar + content)
   ├─ +layout.ts           # Prerender configuration
   └─ +page.svelte         # Work experience & projects
static/                    # Images and other public files
```

## 📫 Connect

- 🌐 Website: [keandavid.cloud](https://keandavid.cloud)
- 💼 LinkedIn: [Kean David](https://www.linkedin.com/in/kean-david-45aa242b6/)
- 🐙 GitHub: [@GhislainKeanDavid](https://github.com/GhislainKeanDavid)
- ✉️ Email: [kean.ghislain27@gmail.com](mailto:kean.ghislain27@gmail.com)

---

<div align="center">

Built with SvelteKit · Designed & developed by Ghislain Kean David

</div>
