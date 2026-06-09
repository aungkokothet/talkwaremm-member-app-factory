# Progress Tracker

## Current Phase

Week 3 Member App with Wallet foundation implemented on top of Week 2 Google Sign-In and fixed Talkware Classroom integration. Mock-only profile cards have been removed from the visible profile screen.

## Stable Baseline

Week 1 is complete and preserved as the stable Builder Profile App baseline.

`main` remains the stable course starter / Week 1 baseline for new students. Week 2 work lives on `feature/week2-member-app`. Week 3 wallet work lives on `feature/week3-member-app-with-wallet`.

Week 1 includes:

- Flutter + GetX project scaffold
- centralized `AppColors`, `AppDimens`, `AppString`, `AppImages`, and `AppTheme`
- `BaseController` and `BaseView`
- `InitialBinding` and `ProfileBinding`
- GetX route constants and page registration
- reactive profile state in the original Week 1 baseline
- profile screen with header, About, Contact, and Skills sections in the Week 1 baseline
- reusable `SectionCard` and `ProfileInfoTile`
- SVG logo support through `flutter_svg`
- widget smoke test coverage

## Completed

- Repository references synchronized to `https://github.com/aungkokothet/talkwaremm-member-app-factory.git`
- AI workflow and context system established
- Week 1 frozen baseline preparation completed
- Documentation and workflow alignment completed
- Branch/tag workflow defined for students and contributors
- Branch strategy clarified: `main` remains the stable starter, weekly feature branches are persistent learning tracks, and tags preserve frozen checkpoints
- Week 2 runtime implementation started
- Minimum `auth`, `member`, and `classroom` feature modules added
- Mock Google identity model and sign-in/sign-out behavior added
- Member learning profile implemented on the existing profile route
- Talkware member status badge added
- Classroom context card with sample course and assignment data added
- Future Talkware Points placeholder card added
- Widget coverage updated for the evolved member profile, sign-out, and sign-in flow
- Separate member dashboard approach corrected
- Existing `ProfileScreen` evolved into the Talkware Member learning profile
- Earlier mock identity, member status, Classroom context, and future points appeared on the profile screen before real Google, Classroom, and wallet milestones replaced the visible mock surfaces
- Separate dashboard route and screen removed from active routing
- Flutter analyze passed after correction
- Widget tests passed after correction
- Dedicated Sign In screen added as the initial route
- Profile app bar title removed so the screen does not show `Talkware Member Profile` at the top
- Hamburger drawer added with Profile and Sign Out actions
- Sign Out moved out of the profile header and into the hamburger drawer
- Active routes are now only Sign In and Profile
- `AuthController` is registered permanently by `InitialBinding`
- `ProfileBinding` registers the profile, Classroom, and member controllers for the profile route
- Documentation synchronized with the actual Week 2 mock-first code
- Official `google_sign_in` dependency added
- Mock Google identity model replaced with `AppIdentity`
- `AuthService` boundary and `GoogleAuthService` implementation added
- Google Sign-In config now reads OAuth IDs from `GOOGLE_CLIENT_ID` and `GOOGLE_SERVER_CLIENT_ID` dart defines
- `AuthController` now signs in and signs out through real Google Sign-In
- Profile header and drawer render real Google display name, email, and profile photo when available
- Fallback initials avatar added for accounts without a profile photo
- Google Sign-In setup notes added in `docs/setup/google-sign-in.md`
- Widget tests updated to inject a fake auth service
- Android OAuth client created in Google Cloud for `com.example.profile_challenge_app`
- Docs clarified that the Android OAuth client ID is not the Dart `serverClientId`
- Web OAuth client ID wired as the default Android `serverClientId`
- Android Google Sign-In manually confirmed working
- Confusing `_defaultAndroidServerClientId` config name replaced with `_defaultWebServerClientId`
- Assignment 1 complete: Google Identity Activation
- Google Classroom read scopes added to the Google authorization request
- Fixed Talkware Classroom course API lookup added for API course ID `865036664004`; the Classroom URL code is `ODY1MDM2NjY0MDA0`
- Classroom coursework and announcements API calls added with friendly unavailable states
- Assignment 2 complete: fixed-course real Classroom integration
- `flutter analyze` passes for the Week 2 checkpoint
- `flutter test` passes for the Week 2 checkpoint
- Wallet feature module added under `lib/app/features/wallet/` by reusing the uploaded `home/` module intent and adapting it to the existing Flutter + GetX app structure
- Wallet routes added for `/wallet`, `/wallet/receive`, `/wallet/send`, `/wallet/send/scan`, `/wallet/send/review`, and `/wallet/history`
- Profile drawer now links to the wallet screen
- Local loyalty system config loader added at `lib/app/core/config/loyalty_system_config.dart`
- Public repo now includes only `assets/config/loyalty-system-config.example.json` with placeholder merchant, issuer, distributor, and NowNodes values
- `assets/config/loyalty-system-config.local.json` is gitignored for real runtime config
- Mobile wallet activation now uses a user-selected customer access ZIP file rather than a hardcoded ZIP path
- Customer access ZIP parsing implemented for the current text-file package format
- Wallet activation now persists non-secret wallet metadata locally with `shared_preferences`, so the wallet can restore after app restart or a new login without reselecting the ZIP
- Wallet balance reads use local config values and direct NowNodes/Horizon account balance lookup
- Wallet runtime does not call `/api/v1/wallet/credentials` in this milestone
- Wallet activation now encrypts the imported customer secret locally with a passcode-derived key instead of storing plaintext
- Wallet unlock keeps the decrypted customer secret only in memory for the current app session and clears it on sign out, lifecycle close/background, and 15 minutes of inactivity
- Wallet Send flow added: Send opens QR scan, extracts the recipient Stellar public key, validates account existence and Talkware Points trustline, opens a readonly recipient/asset send form, requires review, signs locally, submits to configured Horizon/NowNodes, refreshes balance on success, and saves local history
- Local transaction history records successful and failed send attempts with sender, recipient, amount, asset, network, status, transaction hash, and error message fields only
- Wallet screen now shows balance, Receive and Send actions, and a small History link at the bottom
- Focused tests added for wallet unlock encryption/decryption and local transaction history persistence
- Talkware Enterprise design system foundation added from the official Talkware logo with deep navy, electric blue, white surfaces, Material 3, FlexColorScheme, Google Fonts Inter, and centralized `TalkwareSpacing`, `TalkwareRadius`, and `TalkwareShadows` tokens
- Official Talkware logo registered at `assets/brand/talkware-logo.png` and applied to visible app identity surfaces
- Platform app launcher icons for Android, iOS, macOS, Windows, and web are generated from the official Talkware logo
- App root now uses `TalkwareTheme.light`, `TalkwareTheme.dark`, and `ThemeMode.system`
- Shared cards, profile/member visible UI, sign-in visible UI, and wallet visible UI were refactored enough to follow the new design standard without changing working feature logic
- Mock Talkware Member Status and placeholder Talkware Points cards removed from the profile screen; the profile now focuses on real Google identity plus Classroom context while wallet remains available through navigation

## Current Goal

Continue Week 3 from the member-app-with-wallet branch while preserving Week 1 as the frozen starter baseline and Week 2 as the identity/Classroom learning track.

The current implementation uses real Google Sign-In code, fixed Talkware Classroom API calls, local-only loyalty runtime config, customer-selected access ZIP import, local persistence for non-secret wallet activation metadata, passcode-encrypted local customer secret storage, direct Horizon balance reads, QR-based Talkware Points send with local signing/submission, local transaction history, and the logo-derived Talkware Enterprise Material 3 design system foundation. It does not include secrets committed to source, persistent Google auth, backend wallet credential fetches, visible mock member status, backend signing, arbitrary asset transfer, XLM transfer, or a full Horizon history explorer.

Week 3 participants should work from `feature/week3-member-app-with-wallet`. Week 2 participants should work from `feature/week2-member-app`. New students starting the Week 1 starter app should use `main`.

## In Progress

- Week 3 reflection and future participation assignments
- Wallet send real-device validation with an activated recipient trustline

## Next Up

- Add profile UI polish after product flow is confirmed
- Expand tests around Classroom context and drawer navigation states
- Centralize remaining small inline dimensions in widgets

## Not Started

- Real authenticated member persistence
- full Horizon history explorer

## Open Questions

- Whether to move OAuth IDs out of source and fully into platform config before production
- Whether auth state should persist locally before a backend exists
- Whether the placeholder `G` should be replaced with an official Google brand asset
- Whether wallet config should eventually move behind a backend or secure provisioning flow
- Whether future wallet signing policy should remain local-only or move behind an operational backend after the training milestone

## Session Notes

- Minimum Week 2 runtime foundation is implemented on `feature/week2-member-app`.
- Week 3 wallet runtime foundation is implemented on `feature/week3-member-app-with-wallet`.
- Week 2 now evolves the original profile route directly instead of using a disconnected member dashboard.
- Weekly feature branches are not throwaway branches; they are course learning tracks.
- `main` should not automatically absorb weekly work unless the course owner explicitly changes the branch strategy.
- The app lands on the Sign In screen, then navigates to the evolved Profile screen.
- Sign In now uses the real `google_sign_in` package through `GoogleAuthService`.
- Classroom now loads one fixed Talkware course through the real Google Classroom API.
- Member status remains mock-first in its module and is no longer shown as a profile mock card.
- Talkware Points wallet activation and send now exist as a local-config, local-ZIP, locally encrypted secret, direct Horizon/NowNodes milestone.
- Wallet activation restores locally from persisted public metadata after the first successful ZIP import.
- The real loyalty system config remains local-only and gitignored.
- Wallet runtime does not fetch credentials from the headless API and does not use backend signing.
- The latest wallet pass added real QR-based Send and fixed the passcode dialog controller lifecycle so the TextField controller is owned by the dialog widget instead of being disposed by an async controller method.
- The `context/` folder is living documentation and should be updated whenever architecture or workflow changes.
