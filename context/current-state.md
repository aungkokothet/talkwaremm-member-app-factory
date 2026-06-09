# Current State

## Current Phase

Week 3 - Talkware Member App with on-device Talkware Points wallet activation and QR-based send foundation.

This work lives on the Week 3 learning track branch, `feature/week3-member-app-with-wallet`. `main` remains the stable course starter and Week 1 baseline for new students.

## Current Goal

Evolve the Week 1 Builder Profile App into a real operational Talkware Member App.

The app is expected to evolve toward:

- Google Sign-In
- real authenticated member identity
- Google Classroom-connected learning context
- Talkware member activation
- future participation economy foundations

This is no longer just a static profile customization exercise. The app is becoming a real operational member surface for Talkware participants.

Important: Week 2 runtime implementation exists. Real Google Sign-In works on Android through the official `google_sign_in` package. Android OAuth is registered in Google Cloud with package name and SHA-1, and the Web OAuth client ID is wired as Android's `serverClientId`. Google Classroom API integration loads one fixed Talkware course by course ID; it does not show all courses or implement a course browser.

Week 3 Talkware Points wallet runtime implementation has started. The wallet feature reuses the uploaded `home/` module direction as the new `wallet` feature module while adapting it to this repo's existing Flutter + GetX architecture. The public repo includes only `assets/config/loyalty-system-config.example.json`; real `assets/config/loyalty-system-config.local.json` values are local-only and gitignored. Mobile wallet activation uses a user-selected customer access ZIP file, persists non-secret wallet activation metadata locally, encrypts the imported customer secret locally with a passcode-derived key, and performs direct NowNodes/Horizon balance reads. Wallet Send now scans a recipient public-key QR, validates recipient account existence and Talkware Points trustline, requires review confirmation, signs locally with the passcode-unlocked customer secret, submits to configured Horizon/NowNodes, refreshes balance on success, and stores local success/failure history without secrets. It does not fetch wallet credentials from the headless API in this milestone.

The app has the Talkware Enterprise design system foundation derived from the official Talkware logo. It uses a deep navy and electric blue brand palette, Material 3, FlexColorScheme, Google Fonts Inter, centralized design tokens under `lib/app/design/`, and the official logo asset at `assets/brand/talkware-logo.png`. The design system remains separate from Google Sign-In, Classroom, and wallet business logic.

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

Week 2 and Week 3 must preserve this foundation while extending it.

New students should start from `main`. Week 2 participants should check out `feature/week2-member-app`. Week 3 participants should check out `feature/week3-member-app-with-wallet`.

## Current Product Direction

The application is evolving into the Talkware Member App.

A Talkware member should eventually be able to:

- sign in with Google
- view real Google profile information
- view Talkware member or builder status
- view learning participation context from Google Classroom
- prepare for future participation economy systems
- activate a local Talkware Points wallet from a customer access ZIP
- view local wallet public key and loyalty asset balance
- keep wallet activation restored between app sessions without reselecting the ZIP
- send the configured Talkware Points asset after scanning another wallet public-key QR

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
- premium neutral-first Material 3 design standard
- light and dark theme support through `TalkwareTheme`
- Inter font through Google Fonts
- official Talkware logo usage on app identity surfaces

## Week 2 Foundation

### Implemented Foundation

- real Google Sign-In auth service boundary
- real Google account identity model
- sign-in and sign-out controller behavior
- dedicated sign-in route and screen as the initial route
- existing profile route evolved into the Talkware member learning profile
- real Google display name, email, and profile photo rendering when available
- clean fallback avatar when Google profile photo is unavailable
- Classroom context card with real Google Classroom data for one fixed Talkware course
- fixed Talkware Classroom course lookup by course ID
- Classroom coursework and announcement requests with friendly unavailable states
- profile screen no longer shows mock Talkware Member Status or placeholder Talkware Points cards
- scrubbed example loyalty system config committed under `assets/config/`
- local loyalty system config pattern with the real config gitignored
- profile drawer with Profile and Sign Out actions

## Week 3 Foundation

### Implemented Foundation

- wallet routes for local Talkware Points activation, receive, QR-based send, review, and local history
- local wallet activation persistence for public wallet metadata
- passcode-encrypted customer secret storage
- session-only in-memory wallet unlock state
- direct Horizon/NowNodes balance reads
- recipient public-key QR scan and trustline validation
- local Stellar payment signing and configured Horizon/NowNodes submission
- local success/failure transaction history

### Remaining Planned Features

- authenticated member persistence
- production member status source
- operational member profile polish

### Current Feature Modules

```txt
lib/app/features/auth/
lib/app/features/member/
lib/app/features/classroom/
lib/app/features/profile/
lib/app/features/wallet/
```

These modules now exist on `feature/week3-member-app-with-wallet`. The auth module has a real Android Google Sign-In boundary. The Classroom module calls the real Google Classroom API for one fixed Talkware course. Member status remains mock-first in its module but is no longer shown as a profile mock card. Talkware Points has moved from a profile placeholder toward an on-device wallet milestone using local config, a user-selected access ZIP, encrypted local secret storage, QR-based recipient validation, local signing, direct Horizon/NowNodes transaction submission, and local transaction history.

## Branch Strategy

- `main` = stable course starter / Week 1 baseline
- `feature/week2-member-app` = Week 2 Talkware Member App identity and Classroom evolution
- `feature/week3-member-app-with-wallet` = current Week 3 Member App with Wallet evolution
- tags = incremental learning checkpoints

Weekly feature branches are persistent course tracks. Do not assume `main` should automatically absorb weekly work unless the course owner explicitly changes the strategy.
