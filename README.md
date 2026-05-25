# Talkware Member App Factory

This repository is an evolving Flutter software-factory training project. It is not a set of disconnected weekly demos. Each week preserves the stable foundation from previous weeks, then evolves the same application toward a more operational Talkware member app.

## Software-Factory Philosophy

The goal is to learn how real software grows:

- keep a stable working baseline
- evolve features through focused branches
- preserve architecture instead of rewriting from scratch
- document decisions as the system changes
- use AI assistance with clear context and workflow rules

Week 1 established the stable Builder Profile App baseline. Week 2 is the current evolution toward a Talkware Member App, but authentication and Google Sign-In are not implemented yet.

## Week-by-Week Evolution

### Week 1: Stable Baseline

Week 1 is the frozen starter milestone. It includes:

- Flutter + GetX
- `BaseController` / `BaseView`
- centralized resources for colors, dimensions, strings, images, and theme
- feature-based folder structure
- a local profile screen with reactive GetX state

Students should use Week 1 to understand and customize a working app safely.

### Week 2: Current Evolution

Week 2 evolves the same codebase toward an operational Talkware Member App. The direction includes member identity, member status, and future Google Classroom context, but implementation should happen on feature branches only.

Do not rewrite the Week 1 app. Extend it.

## Git Workflow

- `main` = latest stable operational version
- tags = frozen learning milestones
- feature branches = active development work

Use tags when teaching or revisiting a completed week. Use feature branches for new implementation work. Merge back to `main` only when the app is stable.

## Common Commands

Clone:

```bash
git clone https://github.com/aungkokothet/talkwaremm-member-app-factory.git
```

Start Week 1:

```bash
git checkout v0.1-week1-first-challenge
```

Return to latest stable:

```bash
git checkout main
git pull
```

Create a Week 2 feature branch:

```bash
git checkout -b feature/week2-member-app
```

## Architecture Baseline

The current architecture must remain intact as the app evolves:

- `lib/main.dart` starts the app
- `lib/main_app.dart` configures `GetMaterialApp`
- `lib/app/constant/resources/` holds centralized resources
- `lib/app/constant/routing/` holds route names and GetX page setup
- `lib/app/core/` holds base controller/view and initial binding
- `lib/app/features/` holds feature modules
- `lib/app/widget/` holds reusable UI widgets

Run the app with:

```bash
flutter run
```
