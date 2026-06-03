# Current State

## Current Phase

Week 2 - Talkware Member App real Google Sign-In integration foundation.

This work lives on the Week 2 learning track branch, `feature/week2-member-app`. `main` remains the stable course starter and Week 1 baseline for new students.

## Current Goal

Evolve the Week 1 Builder Profile App into a real operational Talkware Member App.

The app is expected to evolve toward:

- Google Sign-In
- real authenticated member identity
- Google Classroom-connected learning context
- Talkware member activation
- future participation economy foundations

This is no longer just a static profile customization exercise. The app is becoming a real operational member surface for Talkware participants.

Important: Week 2 runtime implementation has started. Real Google Sign-In works on Android through the official `google_sign_in` package. Android OAuth is registered in Google Cloud with package name and SHA-1, and the Web OAuth client ID is wired as Android's `serverClientId`. Classroom API integration is not implemented yet.

## Previous Stable Baseline

### Week 1 - Builder Profile App

Week 1 established:

- Flutter + GetX architecture
- centralized design system
- BaseController / BaseView patterns
- reusable widgets
- feature-based folder organization
- reactive profile state management

The Week 1 app:

- displayed static local profile information
- had no authentication
- had no API integration
- functioned as a safe architecture-learning baseline

Week 2 must preserve this foundation while extending it.

New students should start from `main`. Week 2 participants should check out `feature/week2-member-app`.

## Current Product Direction

The application is evolving into the Talkware Member App.

A Talkware member should eventually be able to:

- sign in with Google
- view real Google profile information
- view Talkware member or builder status
- view learning participation context from Google Classroom
- prepare for future participation economy systems

## Preserve From Week 1

The following systems and patterns must remain intact unless explicitly changed.

### Architecture

- Flutter + GetX
- feature-based module structure
- centralized routing
- reactive state management

### Base Abstractions

- `BaseController`
- `BaseView`
- `InitialBinding`

### Centralized Resources

- `AppColors`
- `AppDimens`
- `AppString`
- `AppImages`
- `AppTheme`

### UI Direction

- clean professional mobile layout
- reusable section-based UI
- centralized styling
- responsive screen structure

## Week 2 Foundation

### Implemented Foundation

- real Google Sign-In auth service boundary
- real Google account identity model
- sign-in and sign-out controller behavior
- dedicated sign-in route and screen as the initial route
- existing profile route evolved into the Talkware member learning profile
- real Google display name, email, and profile photo rendering when available
- clean fallback avatar when Google profile photo is unavailable
- Talkware member status badge
- Classroom context card with sample course and assignment data
- future Talkware Points placeholder card
- profile drawer with Profile and Sign Out actions

### Remaining Planned Features

- authenticated member persistence
- real Google Classroom integration
- production member status source
- operational member profile polish

### Current Feature Modules

```txt
lib/app/features/auth/
lib/app/features/member/
lib/app/features/classroom/
lib/app/features/profile/
```

These modules now exist on `feature/week2-member-app`. The auth module now has a real Android Google Sign-In boundary; member status, Classroom, and points remain mock-first.

## Branch Strategy

- `main` = stable course starter / Week 1 baseline
- `feature/week2-member-app` = current Week 2 Talkware Member App evolution
- `feature/week3-loyalty-structure` = future Week 3 evolution
- tags = frozen learning checkpoints such as `v0.1-week1-first-challenge`

Weekly feature branches are persistent course tracks. Do not assume `main` should automatically absorb weekly work unless the course owner explicitly changes the strategy.
