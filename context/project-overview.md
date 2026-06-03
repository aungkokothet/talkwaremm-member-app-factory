# Project Overview

## Product Direction

This repository is the Talkware Member App Factory: an evolving Flutter training application that grows week by week like real operational software.

Week 1 remains the stable Builder Profile App baseline. Week 2 is the current evolution toward a Talkware Member App. The repository should preserve earlier working milestones while teaching students how to extend architecture safely.

## Software-Factory Purpose

The project teaches:

- Flutter application structure
- GetX state management, routing, and dependency injection
- reusable architecture patterns
- centralized UI resources
- AI-assisted development workflows
- Git-based product evolution with branches and tags

The repository should not become isolated weekly tutorial apps. Each week should build on the same operational codebase.

## Week 1: Stable Baseline

Week 1 established a Builder Profile App. It displays local profile information with a clean mobile UI and reactive GetX state.

Week 1 includes:

- Flutter + GetX app scaffold
- `BaseController` and `BaseView`
- centralized `AppColors`, `AppDimens`, `AppString`, `AppImages`, and `AppTheme`
- GetX routing through route constants and page registration
- feature-based `profile` module
- reusable shared widgets
- widget smoke test coverage

Week 1 is preserved as the starting point for new students and as the stable architectural baseline.

New students should clone `main` for the stable starter app. Weekly app evolution lives in persistent weekly feature branches instead of automatically replacing `main`.

## Week 2: Current Evolution

Week 2 reframes the app as a Talkware Member App. The app is expected to evolve toward:

- real member identity
- member profile display
- member or builder status
- Google Classroom-connected learning context
- future participation economy foundations

Important: Week 2 now has Android Google Sign-In working through the official `google_sign_in` package. Web browser sign-in and iOS sign-in are not configured. Classroom API integration now loads one fixed Talkware course by course ID.

## Core User Flow Today

1. App launches through `GetMaterialApp`.
2. The Sign In screen opens as the initial screen.
3. Google Sign-In authenticates the user and stores an in-memory app identity.
4. The Profile screen composes auth, member, and Classroom controller state.
5. The profile shows real Google name/email/photo when available, mock Talkware member status, real fixed-course Classroom context, and future points.
6. The hamburger drawer provides Profile and Sign Out actions.

## Runtime Reality Today

- The official `google_sign_in` package is installed.
- Android Google Sign-In is implemented in `GoogleAuthService`.
- Google identity is held in memory only and is not persisted locally.
- The Android OAuth client is registered by package name and SHA-1.
- The Web OAuth client ID is used as Android's `serverClientId`.
- Google Classroom API calls are implemented with OAuth bearer headers for one fixed Talkware course.
- Classroom coursework and announcement calls are optional and have friendly unavailable states.
- No backend, credentials, secrets, or persistent session storage are implemented.
- Mock member data comes from `AppString` constants through a simple GetX controller.

## Long-Term Success Criteria

The project succeeds when students can:

- start from a known weekly milestone
- understand the current architecture quickly
- create a feature branch for active development
- extend the app without rewriting the baseline
- keep documentation synchronized with implementation

## Branch Strategy

- `main` = stable course starter / Week 1 baseline
- `feature/week2-member-app` = Week 2 Talkware Member App evolution
- `feature/week3-loyalty-structure` = future Week 3 evolution
- tags = frozen learning checkpoints such as `v0.1-week1-first-challenge`

Weekly feature branches are course learning tracks, not throwaway branches. `main` should not automatically absorb weekly work unless the course owner explicitly changes the branch strategy.
