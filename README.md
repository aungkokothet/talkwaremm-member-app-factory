# Talkware Member App Factory

This repository is an evolving Flutter software-factory training project. It is not a set of disconnected weekly demos. Each week preserves the stable foundation from previous weeks, then evolves the same application toward a more operational Talkware member app.

## Software-Factory Philosophy

The goal is to learn how real software grows:

- keep a stable working baseline
- evolve features through focused branches
- preserve architecture instead of rewriting from scratch
- document decisions as the system changes
- use AI assistance with clear context and workflow rules

Week 1 established the stable Builder Profile App baseline. Week 2 is the current evolution toward a Talkware Member App. Real Google Sign-In now works on Android as the first Week 2 integration, while member status, Classroom context, and points remain mock-first.

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

Week 2 evolves the same codebase toward an operational Talkware Member App. The current branch includes Android Google Sign-In through the official `google_sign_in` package, mock member status, and mock Classroom context. Real Classroom API work should happen only when configuration is ready.

Do not rewrite the Week 1 app. Extend it.

## Git Workflow

- `main` = stable course starter / Week 1 baseline for new students
- tags = frozen learning milestones
- weekly feature branches = persistent course learning tracks

Use tags when teaching or revisiting a completed week. Weekly feature branches are not throwaway branches; they hold each week of app evolution. `main` should not automatically absorb weekly work unless the course owner explicitly changes the branch strategy.

## Common Commands

Clone:

```bash
git clone https://github.com/aungkokothet/talkwaremm-member-app-factory.git
```

Start Week 1:

```bash
git checkout v0.1-week1-first-challenge
```

Return to starter baseline:

```bash
git checkout main
git pull
```

Start Week 2:

```bash
git checkout feature/week2-member-app
```

Future Week 3 track:

```bash
git checkout feature/week3-loyalty-structure
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
