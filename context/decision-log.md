# Decision Log

This file records important architectural, workflow, and product-direction decisions made throughout the evolution of the project.

The purpose is to preserve continuity between:

- project phases
- architecture evolution
- AI-assisted implementation sessions
- future contributors

---

# 2026-05-25 - Adopted Context-Driven AI Workflow

## Decision

The project adopts a context-driven AI collaboration workflow using standardized context files.

## Reason

The repository is expected to evolve continuously across multiple training weeks and product phases.

AI agents require:

- continuity
- architectural awareness
- implementation history
- current project direction

The context system provides structured operational memory for AI-assisted development.

## Result

The repository now maintains:

- `project-overview.md`
- `architecture.md`
- `code-standards.md`
- `ui-context.md`
- `progress-tracker.md`
- `ai-workflow-rules.md`
- `current-state.md`
- `decision-log.md`
- `AGENTS.md`

---

# 2026-05-25 - Week 1 Architecture Preserved

## Decision

The Week 1 Flutter + GetX architecture will remain the long-term foundation of the project.

## Reason

Week 1 established:

- reusable architecture
- centralized resources
- feature-based modules
- reactive state management
- beginner-readable structure

The goal of the software factory is incremental evolution, not repeated rewrites.

## Result

The following systems are treated as foundational:

- GetX routing
- BaseController / BaseView
- centralized AppColors/AppDimens/AppTheme
- feature module structure
- reusable widgets

Future weeks should extend this foundation rather than replace it.

---

# 2026-05-25 - Week 2 Positioned as Operational Member App

## Decision

Week 2 is defined as a Talkware Member App instead of a generic Flutter tutorial app.

## Reason

The project philosophy emphasizes:

- operational software
- real users
- participation systems
- ecosystem thinking

The app should become the first real operational member activation surface for Talkware participants.

## Result

Week 2 introduces the product direction for:

- Google Sign-In
- real member identity
- Google Classroom integration
- member participation context
- future participation economy preparation

The app evolves from a static local profile app into an authenticated operational member system over time.

---

# 2026-05-25 - Google Identity Chosen as Member Identity Layer

## Decision

Google Sign-In becomes the primary identity system for Week 2.

## Reason

Google identity:

- simplifies onboarding
- provides real authenticated user identity
- integrates naturally with Google Classroom
- reduces custom account-management complexity during early phases

## Result

The project direction includes:

- Google authentication flow
- authenticated member session state
- Google profile rendering
- Classroom-connected learning context

The current runtime now uses the official `google_sign_in` package for the sign-in boundary. Platform OAuth setup may still be required before sign-in succeeds on target devices.

---

# 2026-05-25 - Classroom Integration Prioritized Before Wallet Systems

## Decision

Google Classroom integration is prioritized before implementing Talkware Points or wallet systems.

## Reason

The immediate goal of Week 2 is operational learning participation, not financial or loyalty mechanics.

The app should first become a real educational participation surface before introducing economy layers.

## Result

Week 2 focuses on:

- course visibility
- assignment visibility
- learning participation context
- member activation

Wallets and participation economy systems remain future-phase concerns.

---

# 2026-05-25 - Git Workflow Standardized

## Decision

The repository adopts a real software-factory Git workflow.

## Reason

The project should teach:

- incremental software evolution
- release continuity
- feature isolation
- operational development workflows

## Result

Git conventions:

- `main` = stable course starter / Week 1 baseline
- weekly feature branches = persistent course learning tracks
- tags = weekly milestone preservation
- weekly work should not automatically merge into `main` unless the course owner explicitly changes the branch strategy

Example tag:

- `v0.1-week1-first-challenge`

---

# 2026-05-25 - AGENTS.md Adopted as AI Entry Point

## Decision

`AGENTS.md` becomes the primary AI-agent entry point for repository operations.

## Reason

AI coding agents require:

- predictable operating instructions
- reading order
- continuity rules
- architecture-preservation guidance

## Result

AI agents should:

1. read `AGENTS.md`
2. follow context reading order
3. preserve architecture continuity
4. update context files when structural changes occur

---

# 2026-05-25 - Context Separation Strategy Adopted

## Decision

The repository separates:

- current operational truth
- historical reasoning
- implementation progress
- architecture documentation

## Reason

Mixing all project information into a single evolving document creates:

- drift
- confusion
- duplication
- poor AI continuity

## Result

Responsibilities are separated:

| File | Responsibility |
| --- | --- |
| `current-state.md` | current operational direction |
| `decision-log.md` | historical reasoning |
| `progress-tracker.md` | implementation status |
| `architecture.md` | system structure |
| `project-overview.md` | product meaning |
| `AGENTS.md` | AI operating instructions |

---

# 2026-05-25 - Mock-First Week 2 Foundation Added

## Decision

Week 2 begins with a mock-first foundation before real Google OAuth or Classroom API integration.

## Reason

The repository needs an operational member-app shape without requiring secrets, credentials, or external API setup during the first implementation step.

## Result

The app now includes:

- `auth` feature module, originally added with mock Google identity state
- `member` feature module with mock member status
- `classroom` feature module with sample course and assignment context
- dedicated sign-in route as the initial route
- sign-in navigation to the evolved profile screen
- a future Talkware Points placeholder

Real Google Sign-In has since been selected as the first real Week 2 integration. Classroom integration remains future work.

---

# 2026-05-26 - Week 2 Profile Route Chosen Over Separate Dashboard

## Decision

The Week 2 member experience evolves the existing profile route instead of using a separate member dashboard route.

## Reason

The project continuity rule says Week 2 should build on the Week 1 app instead of creating a disconnected tutorial-style surface.

## Result

The active runtime flow is:

- `Routes.signIn` opens `SignInScreen`.
- sign-in sets `AuthController.identity`.
- the app navigates to `Routes.profileScreen`.
- `ProfileScreen` composes auth identity, mock member status, mock Classroom context, and future points sections.
- the drawer provides Profile and Sign Out actions.

There is no active member dashboard route or screen in the current code.

---

# 2026-06-01 - Real Google Sign-In Selected as First Week 2 Real Integration

## Decision

Real Google Sign-In is the first production-style Week 2 integration.

## Reason

The app needs a real member identity boundary before Classroom participation or future economy systems can be meaningful. Direct `google_sign_in` keeps the implementation focused and avoids adding Firebase Auth or backend complexity before the training system needs it.

## Result

The app now includes:

- official `google_sign_in` dependency
- isolated Google Sign-In config holder
- `AppIdentity` model populated from `GoogleSignInAccount`
- `AuthService` abstraction
- `GoogleAuthService` implementation
- real Google sign-in/sign-out calls from `AuthController`
- real Google name, email, and profile photo rendering where available
- fallback initials avatar when no profile photo is available
- setup notes in `docs/setup/google-sign-in.md`

The app still does not include:

- Google Classroom API integration
- Talkware Points wallet behavior
- backend authentication
- committed secrets
- persistent authenticated session storage

---

# 2026-06-01 - Android OAuth Client Kept Out of Dart Server Client Config

## Decision

The Android OAuth client ID is treated as Google Cloud registration data, not as a Dart `serverClientId`.

## Reason

Android Google Sign-In validates the app through package name and SHA fingerprint registration. The `google_sign_in_android` package documents that if the app is not using `google-services.json`, Android requires the Web OAuth client ID as `serverClientId`. The Android OAuth client ID must not be used as a fake server client ID.

## Result

The Android client created for `com.example.profile_challenge_app` remains documented in setup notes. This was later completed with a Web OAuth client used as Android's `serverClientId`. Classroom, member status, and Talkware Points remain mock-first.

---

# 2026-06-01 - Web OAuth Client Wired as Android serverClientId

## Decision

The Web OAuth client ID from the Talkware Journey Google Cloud project is wired as the default Android `serverClientId`.

## Reason

The Android OAuth client validates package name and SHA-1 in Google Cloud, but `google_sign_in_android` requires a Web OAuth client ID as `serverClientId` when the app is not using `google-services.json`.

## Result

The app uses:

- Android OAuth client for package/SHA registration
- Web OAuth client ID as `serverClientId`
- no Web client secret in Flutter

Classroom, member status, and Talkware Points remain mock-first.

---

# 2026-06-01 - Android Google Sign-In Confirmed Working

## Decision

The Week 2 Google Sign-In boundary is stabilized for Android.

## Reason

The Android OAuth client is registered by package name and SHA-1 in Google Cloud, and the Web OAuth client ID is used as `serverClientId` as required by `google_sign_in_android` when not using `google-services.json`.

## Result

Android Google Sign-In works. The confusing default config name was clarified from Android server client wording to Web server client wording. No client secret is stored in Flutter. Classroom, member status, and Talkware Points remain mock-first.

---

# 2026-06-03 - Fixed Talkware Classroom Course Selected for First Classroom Integration

## Decision

The first real Classroom integration loads one fixed Talkware Classroom course. The Classroom URL code is `ODY1MDM2NjY0MDA0`; the API course ID used in `courses.get` calls is `865036664004`.

## Reason

Week 2 needs a controlled Classroom boundary that proves OAuth and real course data without adding a course browser, name filtering, API key, backend, Firebase Auth, wallet, or points logic.

## Result

The app requests the approved Classroom read scopes through Google Sign-In authorization, obtains OAuth bearer headers from the signed-in Google account, and calls:

- `GET https://classroom.googleapis.com/v1/courses/865036664004`
- `GET https://classroom.googleapis.com/v1/courses/865036664004/courseWork`
- `GET https://classroom.googleapis.com/v1/courses/865036664004/announcements`

At this first Classroom checkpoint, the Profile Classroom card showed real fixed-course data when available, with friendly loading, permission, access, and temporary-unavailable states. Member status remained mock-first, and Talkware Points had not yet moved into the later wallet milestones.

Superseded for Talkware Points by the later wallet activation and 2026-06-09 wallet send decisions. This entry remains historical for the first Classroom checkpoint.

---

# 2026-06-03 - Classroom Uses OAuth Bearer Token Only

## Decision

Classroom API requests use `Authorization: Bearer <access_token>` from Google Sign-In authorization. The app does not use an API key.

## Reason

The Classroom data is user-specific and must respect whether the signed-in Google account has access to the fixed Talkware course.

## Result

At this Classroom OAuth checkpoint, the app stayed mobile-only and OAuth-only for Week 2. It did not add Firebase Auth, backend, API key, client secret, wallet logic, or real points logic. Member status remained mock-first, and Talkware Points had not yet moved into the later wallet milestones.

Superseded for wallet logic and points by the later wallet activation and 2026-06-09 wallet send decisions. The no-Firebase, no-backend-auth, no-API-key-for-Classroom, and no-client-secret boundaries still hold.

---

# 2026-06-03 - Wallet Uses Local Config and Customer Access ZIP

## Decision

The first Talkware Points wallet milestone reuses the uploaded `home/` module direction as a new `wallet` feature module, but adapts it to the current Flutter + GetX architecture.

The public repository commits only a placeholder example config:

- `assets/config/loyalty-system-config.example.json`

The real runtime config is local-only and gitignored:

- `assets/config/loyalty-system-config.local.json`

Mobile wallet activation uses a customer-selected access ZIP file from the phone. The wallet runtime reads balances directly from NowNodes/Horizon using local config values and does not call `/api/v1/wallet/credentials` in this milestone.

## Reason

The wallet milestone needs to teach local mobile activation without exposing real NowNodes API keys, issuer/distributor setup, merchant loyalty config, encrypted seeds, or customer wallet packages in the public course repo.

Using a user-selected ZIP preserves the operational package format while avoiding hardcoded reference filenames. Avoiding the headless credentials API keeps this milestone focused on local config plus customer access import.

## Result

The app now includes:

- `lib/app/features/wallet/`
- `/wallet`, `/wallet/receive`, and `/wallet/send` routes
- a profile drawer wallet navigation entry
- `LoyaltySystemConfig` local asset loader with a clear missing-config message
- customer access ZIP import and parsing service
- direct Horizon balance lookup using `network.horizonUrl`, `network.nownodeApiKey`, `loyaltyProgram.assetCode`, and `systemAccounts.issuer.publicKey`

The app still does not commit real loyalty config, encrypted issuer/distributor seeds, customer access ZIPs, or backend wallet credentials.

---

# 2026-06-04 - Talkware Enterprise Design System Established From Official Logo

## Decision

The app adopts the logo-derived Talkware Enterprise design system under `lib/app/design/` using:

- official Talkware logo asset at `assets/brand/talkware-logo.png`
- platform app launcher icons generated from the official Talkware logo
- deep navy and electric blue brand palette
- Material 3
- FlexColorScheme
- Google Fonts Inter
- `TalkwareBrandColors`
- `TalkwareAssets`
- `TalkwareSpacing`
- `TalkwareRadius`
- `TalkwareShadows`
- `TalkwareTheme.light`
- `TalkwareTheme.dark`

The app root now uses `TalkwareTheme.light`, `TalkwareTheme.dark`, and `ThemeMode.system`.

## Reason

The wallet feature, Google Sign-In flow, and fixed Classroom integration were already working. The app needed a consistent Talkware Factory visual standard derived from the real brand mark: deep navy base, electric blue highlight, white surfaces, low elevation, and a professional SaaS/enterprise feel.

## Result

Shared cards, sign-in visible UI, profile/member visible UI, Classroom card presentation, and wallet visible UI were refactored enough to use theme values, design tokens, and official logo placement consistently.

This design-system change did not rebuild the wallet feature, alter wallet business logic, change Google Sign-In logic, or change Classroom integration logic.

This statement applies only to the 2026-06-04 design-system pass. Wallet business logic changed later in the 2026-06-09 send milestone.

---

# 2026-06-04 - Profile Screen Mock Cards Removed

## Decision

The visible Profile screen no longer shows the mock Talkware Member Status card or the placeholder Talkware Points card.

## Reason

Those cards were mock/placeholder surfaces and made the profile feel less operational now that real Google identity, fixed Classroom integration, and wallet navigation exist.

## Result

The profile screen now focuses on real signed-in Google identity and the Classroom context card. Wallet remains accessible from the shared drawer, and wallet feature logic is unchanged. The mock member module can remain available for future real member activation work, but it is no longer presented as visible profile data.

This statement applies only to the 2026-06-04 profile cleanup. Wallet feature logic changed later in the 2026-06-09 send milestone.

---

# 2026-06-04 - Wallet Activation Metadata Persists Locally

## Decision

Wallet activation now saves non-secret wallet access metadata locally with `shared_preferences` and restores it when the wallet screen loads.

## Reason

Users should not need to reselect the customer access ZIP every time they restart the app or sign in again. The activation step should behave like a local setup action, not a repeated login ritual.

## Result

After a successful ZIP import, the app persists the wallet owner labels, public key, and asset code. It does not persist wallet secret, recovery phrase, or derivation path. On later wallet loads, the controller restores the activation state and refreshes the balance directly from Horizon/NowNodes.

Superseded for the customer secret by the 2026-06-09 local encryption decision below: plaintext secrets still are not persisted, but an encrypted customer secret record is now stored locally for this mobile send milestone.

---

# 2026-06-09 - Wallet Send Uses Local Encryption, Local Signing, and Direct Horizon Submission

## Decision

The Talkware Points wallet now supports a minimal real Send milestone after QR scan.

The app:

- imports the customer secret from the selected customer access ZIP during activation
- encrypts the customer secret locally with a passcode-derived key
- stores no plaintext secret and does not store the passcode
- keeps the decrypted secret only in memory
- clears the unlocked secret on sign out, app lifecycle close/background, and 15 minutes of inactivity
- scans QR codes that contain only a recipient Stellar public key
- validates recipient account existence and the configured Talkware Points trustline through Horizon/NowNodes
- sends only the configured asset from `loyalty-system-config.local.json`
- requires a review screen before signing
- signs the Stellar payment transaction locally
- submits the signed transaction envelope directly to the configured Horizon/NowNodes endpoint
- stores local success and failure history records without secrets

## Reason

This milestone teaches a real operational wallet send path without adding backend signing, backend credential retrieval, arbitrary asset transfer, XLM transfer, marketplace behavior, or a full Horizon history explorer.

Using local encryption preserves the requirement that the ZIP-provided customer secret must not be stored as plaintext while still allowing the phone to sign real transactions for this controlled training milestone.

## Result

The wallet feature now includes focused services and screens for unlock, signing, recipient validation, transaction history, QR scan, send form, review, and history. The wallet screen shows balance, Receive, Send, and a small History link. `stellar_flutter_sdk` builds/signs the payment transaction, while the app submits through configured Horizon/NowNodes with the existing API-key pattern.

---

# 2026-06-09 - Wallet Passcode Dialog Owns Its Text Controller

## Decision

The passcode prompt is implemented as a private stateful dialog widget that owns and disposes its `TextEditingController`.

## Reason

The earlier inline dialog created the controller inside an async controller method and disposed it after `Get.dialog()` returned. On Android, Flutter could still rebuild the dialog `TextField` for a frame, causing `A TextEditingController was used after being disposed`.

## Result

The controller lifecycle now follows the widget lifecycle. `flutter analyze` and `flutter test` pass after the fix.

---

# Core Long-Term Principle

The project should evolve like a real operational software system.

The repository is not intended to become:

- disconnected weekly demos
- isolated tutorial exercises
- repeatedly rewritten apps

Instead, the project should accumulate:

- architecture
- operational meaning
- reusable systems
- participation-driven functionality

over time.
