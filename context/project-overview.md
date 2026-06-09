# Project Overview

## Product Direction

This repository is the Talkware Member App Factory: an evolving Flutter training application that grows week by week like real operational software.

Week 1 remains the stable Builder Profile App baseline. Week 2 evolves the app toward Google identity and fixed Classroom integration. Week 3 is the current Member App with Wallet evolution. The repository should preserve earlier working milestones while teaching students how to extend architecture safely.

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

## Week 2 And Week 3: Current Evolution

Week 2 reframes the app as a Talkware Member App. Week 3 adds an on-device Talkware Points wallet track. The app is expected to evolve toward:

- real member identity
- member profile display
- member or builder status
- Google Classroom-connected learning context
- future participation economy foundations

Important: Week 2 has Android Google Sign-In working through the official `google_sign_in` package. Web browser sign-in and iOS sign-in are not configured. Classroom API integration loads one fixed Talkware course by course ID.
Week 3 Talkware Points wallet runtime now exists for the on-device mobile milestone: activation imports a customer access ZIP, stores public wallet metadata, encrypts the imported customer secret locally with a passcode-derived key, reads balances directly from configured Horizon/NowNodes, and sends only the configured Talkware Points asset after QR scan, recipient trustline validation, review, local signing, and direct submission.

## Core User Flow Today

1. App launches through `GetMaterialApp`.
2. The Sign In screen opens as the initial screen.
3. Google Sign-In authenticates the user and stores an in-memory app identity.
4. The Profile screen composes Google identity and fixed-course Classroom state.
5. The profile shows real Google name/email/photo when available and real fixed-course Classroom context.
6. The hamburger drawer provides Profile, Wallet, and Sign Out actions.
7. The Wallet screen shows local Talkware Points balance, Receive, Send, and a small History link after activation.

## Runtime Reality Today

- The official `google_sign_in` package is installed.
- Android Google Sign-In is implemented in `GoogleAuthService`.
- Google identity is held in memory only and is not persisted locally.
- The Android OAuth client is registered by package name and SHA-1.
- The Web OAuth client ID is used as Android's `serverClientId`.
- Google Classroom API calls are implemented with OAuth bearer headers for one fixed Talkware course.
- Classroom coursework and announcement calls are optional and have friendly unavailable states.
- Wallet activation uses local config plus a user-selected customer access ZIP.
- Wallet Send validates recipient public key/account/trustline, signs locally with a passcode-unlocked customer secret, submits directly to configured Horizon/NowNodes, and records local success/failure history.
- No backend, backend wallet credentials, backend signing, client secrets, or persistent Google session storage are implemented.
- Mock member data still exists in its feature module but is no longer shown as a visible profile card.

## Long-Term Success Criteria

The project succeeds when students can:

- start from a known weekly milestone
- understand the current architecture quickly
- create a feature branch for active development
- extend the app without rewriting the baseline
- keep documentation synchronized with implementation

## Branch Strategy

- `main` = stable course starter / Week 1 baseline
- `feature/week2-member-app` = Week 2 Talkware Member App identity and Classroom evolution
- `feature/week3-member-app-with-wallet` = Week 3 Member App with Wallet evolution
- tags = incremental learning checkpoints

Weekly feature branches are course learning tracks, not throwaway branches. `main` should not automatically absorb weekly work unless the course owner explicitly changes the branch strategy.
