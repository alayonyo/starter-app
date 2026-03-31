# starter-app

A one-command scaffold for React + TypeScript + Tailwind CSS projects. No boilerplate, no opinions — just a blank canvas that runs immediately.

## Requirements

| Tool | Install |
|------|---------|
| [Node.js](https://nodejs.org) v18+ | `brew install node` |
| [pnpm](https://pnpm.io) | `npm install -g pnpm` |
| [GitHub CLI](https://cli.github.com) _(optional, for pushing)_ | `brew install gh` |

## Setup

Clone the repo once:

```bash
git clone https://github.com/alayonyo/starter-app.git
cd starter-app
```

## Usage

```bash
pnpm new -- <app-name>
```

**Example:**

```bash
pnpm new -- issue-dashboard
```

This will:
1. Scaffold a Vite + React + TypeScript project into `./<app-name>/`
2. Inject Tailwind CSS via CDN into `index.html` (no config file needed)
3. Replace `App.tsx` with a clean, minimal component using the project name
4. Install dependencies
5. Start the dev server at `http://localhost:5173`

## What you get

```
<app-name>/
├── index.html          ← Tailwind CDN included
├── src/
│   ├── main.tsx
│   └── App.tsx         ← Clean starter component
├── package.json
├── vite.config.ts
└── tsconfig.json
```

## Stack

- [Vite](https://vitejs.dev) — build tool & dev server
- [React](https://react.dev) — UI library
- [TypeScript](https://www.typescriptlang.org) — type safety
- [Tailwind CSS](https://tailwindcss.com) — utility-first styling (CDN, zero config)
