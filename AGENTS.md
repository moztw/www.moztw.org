# Agent Collaboration Notes

When multiple agents are working in parallel, do not let them share the same working directory.

1. Use one `git worktree` per agent (each in a separate directory).
2. Create/use one branch per agent, and keep branch names unique (for example: `codex/<agent-id>/<task>`).
3. Do not run `git checkout` concurrently in the same worktree.
4. Merge changes through a single integrator flow (`rebase` or `cherry-pick`) after each agent provides commit SHA(s).

## Build And Source-Of-Truth Rules

This repo uses `.shtml` as source templates and generates `.html` files via Grunt.

1. Edit source files first:
   - Prefer updating `.shtml` and include files under `inc/`.
   - Do not manually hand-edit generated `.html` files unless the task explicitly requires it.
2. Build and deploy:
   - **Deployment**: Pushing to **main** triggers GitHub Actions to run `grunt dist` in CI and push the built `_site/` to the **gh-pages** branch; GitHub Pages deploys from that branch. Do **not** commit generated `.html` files (see PR #755 / issue #753).
   - **Local build**: For local preview or checking, run `npm run build` (same as `grunt build`) after source changes are approved. `grunt build` runs `copy` (`*.shtml` -> `*.html`) and `ssi` (flatten includes). Do not commit these build results.
   - **CI build**: Workflow runs `npm run dist` (output to `_site/`), syncs `_site/` into the gh-pages worktree (`_ghp`), then commits and pushes. One build command, no extra tasks.
3. Local preview:
   - Run `npm start` to start BrowserSync for local checking.
4. News update rule:
   - For normal news content updates, update `inc/news.html` as source.
   - Let build pipeline regenerate pages such as `index.html` and `news/index.html`; do not maintain those duplicates by hand.
