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

## Week 2: Current Evolution

Week 2 reframes the app as a Talkware Member App. The app is expected to evolve toward:

- real member identity
- member profile display
- member or builder status
- Google Classroom-connected learning context
- future participation economy foundations

Important: Week 2 currently has a mock-first foundation only. Real Google Sign-In and Classroom API integration are not implemented yet.

## Core User Flow Today

1. App launches through `GetMaterialApp`.
2. The Sign In screen opens as the initial screen.
3. Mock Google sign-in routes the user to the evolved Profile screen.
4. The profile shows mock Google/member identity, Talkware member status, Classroom context, and future points.
5. The hamburger menu provides Profile and Sign Out actions.

## Long-Term Success Criteria

The project succeeds when students can:

- start from a known weekly milestone
- understand the current architecture quickly
- create a feature branch for active development
- extend the app without rewriting the baseline
- keep documentation synchronized with implementation
