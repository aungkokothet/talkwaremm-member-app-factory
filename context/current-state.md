# Current State

## Current Phase

Week 2 - Talkware Member App planning and implementation preparation.

## Current Goal

Evolve the Week 1 Builder Profile App into a real operational Talkware Member App.

The app is expected to evolve toward:

- Google Sign-In
- real authenticated member identity
- Google Classroom-connected learning context
- Talkware member activation
- future participation economy foundations

This is no longer just a static profile customization exercise. The app is becoming a real operational member surface for Talkware participants.

Important: Week 2 runtime implementation has not started yet.

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

## Planned For Week 2

### Planned Features

- Google authentication
- authenticated member state
- Google Classroom integration
- Talkware member status layer
- operational member dashboard thinking

### Planned Feature Modules

Recommended additions:

```txt
lib/app/features/auth/
lib/app/features/member/
lib/app/features/classroom/
```

These modules are not implemented yet. They should be added on `feature/week2-member-app` when implementation begins.
