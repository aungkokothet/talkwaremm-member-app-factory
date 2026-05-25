# Current State

## Current Phase

Week 2 - Talkware Member App mock-first implementation foundation.

## Current Goal

Evolve the Week 1 Builder Profile App into a real operational Talkware Member App.

The app is expected to evolve toward:

- Google Sign-In
- real authenticated member identity
- Google Classroom-connected learning context
- Talkware member activation
- future participation economy foundations

This is no longer just a static profile customization exercise. The app is becoming a real operational member surface for Talkware participants.

Important: Week 2 runtime implementation has started with a mock-first foundation. Real Google OAuth and Classroom API integration are not implemented yet.

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
- responsive ListView-based screen structure

## Week 2 Foundation

### Implemented Mock Foundation

- mock Google identity model
- mock sign-in and sign-out controller behavior
- member dashboard route and screen
- Talkware member status badge
- Classroom context card with sample course and assignment data
- future Talkware Points placeholder card

### Remaining Planned Features

- real Google authentication
- real authenticated member state and persistence
- real Google Classroom integration
- production member status source
- operational member dashboard polish

### Planned Feature Modules

Recommended additions:

```txt
lib/app/features/auth/
lib/app/features/member/
lib/app/features/classroom/
```

These modules now exist in mock-first form on `feature/week2-member-app`. They should remain local-only until real Google configuration is ready.
