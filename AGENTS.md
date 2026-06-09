# AGENTS.md

## Purpose

This repository is an evolving AI-powered software factory training system.

The project evolves incrementally week by week instead of creating disconnected tutorial apps.

The goal is not merely learning Flutter syntax. The goal is learning:

- system thinking
- reusable architecture
- AI-assisted development
- operational software workflows
- participation-driven application design

## Project Evolution

### Week 1

Builder Profile App.

Focus:

- Flutter setup
- understanding existing systems
- modifying a working app safely
- reusable architecture
- centralized design systems
- AI-assisted customization

The Week 1 app is a static local profile system. It is preserved as the frozen baseline tag `v0.1-week1-first-challenge`.

### Week 2

Talkware Member App evolution.

Focus:

- Android Google Sign-In as the first real Week 2 integration
- fixed Google Classroom integration
- Talkware member activation
- operational app thinking
- participation economy foundations

Week 2 evolves the Week 1 architecture. Do not rewrite the app from scratch.

Important: Week 2 runtime implementation exists. Real Google Sign-In works on Android through `google_sign_in`, and fixed-course Google Classroom integration is implemented. Client secrets, backend auth, all-course browsing, and persistent authenticated Google state are not implemented unless explicitly requested.

### Week 3

Member App with Wallet evolution.

Focus:

- on-device Talkware Points wallet activation
- customer access ZIP import
- passcode-encrypted customer secret storage
- direct Horizon/NowNodes balance reads
- QR-based recipient validation
- local transaction signing and submission
- local transaction history

Week 3 evolves the Week 2 member app. Do not rewrite the app from scratch.

Important: Week 3 wallet runtime is implemented for the configured Talkware Points asset. Backend wallet credential fetches, backend signing, arbitrary asset transfer, XLM transfer, marketplace transfer, and a full Horizon history explorer are not implemented unless explicitly requested.

## Context Files

Read these files before making architectural or implementation changes.

Recommended reading order:

1. `context/current-state.md`
2. `context/project-overview.md`
3. `context/architecture.md`
4. `context/code-standards.md`
5. `context/ui-context.md`
6. `context/progress-tracker.md`
7. `context/decision-log.md`
8. `context/ai-workflow-rules.md`

`current-state.md` is the source of truth for the current project direction.

## Core Architecture Rules

- Preserve the existing Flutter + GetX architecture.
- Preserve the `BaseController` / `BaseView` pattern.
- Preserve centralized resources:
  - `AppColors`
  - `AppDimens`
  - `AppString`
  - `AppImages`
  - `AppTheme`
- Preserve feature-based folder organization.
- Do not hardcode route strings.
- Do not hardcode colors or dimensions in widgets.
- Prefer reusable widgets over duplicated UI.

## Development Philosophy

The repository should evolve like a real operational software system.

Prefer:

- incremental upgrades
- modular feature additions
- reusable abstractions
- small focused commits
- maintainable architecture

Avoid:

- rewriting working systems
- large uncontrolled refactors
- random demo features
- disconnected tutorial patterns

## AI Collaboration Rules

AI agents should:

- preserve existing architecture unless explicitly instructed otherwise
- update context files after structural changes
- explain major architectural changes
- avoid introducing unnecessary complexity
- keep implementations beginner-readable when possible

When adding new functionality:

- create new feature modules instead of overloading existing files
- keep files single-purpose
- follow the established folder conventions

## Git Workflow

### Main Branch

`main` represents the stable course starter app and Week 1 baseline for new students.

New students should clone the repository and start on `main` unless their course instructions say otherwise.

### Weekly Feature Branches

Weekly feature branches are persistent learning tracks, not throwaway branches.

Example:

- `feature/week2-member-app`
- `feature/week3-member-app-with-wallet`

Week 2 participants should check out `feature/week2-member-app`.

Do not automatically merge weekly evolution work into `main`. `main` should absorb weekly work only if the course owner explicitly changes the branch strategy.

### Tags

Use tags to preserve frozen learning milestones.

Example:

- `v0.1-week1-first-challenge`

## Repository

Canonical repository URL:

```bash
https://github.com/aungkokothet/talkwaremm-member-app-factory.git
```

## Continuity Rules

Week 2 builds on Week 1. Future weeks should evolve the existing system instead of replacing it.

Weekly evolution should happen on weekly feature branches while `main` remains the stable starter baseline.

The project should maintain continuity between:

- architecture
- UI systems
- business meaning
- operational workflows

Preserve previous learning foundations while expanding capabilities.

## Context Maintenance

Human project owners typically update:

- `current-state.md`
- `decision-log.md`

AI agents may help maintain:

- `progress-tracker.md`
- `architecture.md`
- implementation synchronization

Do not assume old context is still current unless confirmed by `current-state.md`.

## Final Principle

This repository is not just a Flutter app.

It is:

- a software factory training system
- a participation-driven application experiment
- an evolving operational product architecture
