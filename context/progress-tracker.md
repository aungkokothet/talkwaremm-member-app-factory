# Progress Tracker

## Current Phase

Week 2 real Google Sign-In integration implemented, with mock-first member/Classroom/points surfaces preserved.

## Stable Baseline

Week 1 is complete and preserved as the stable Builder Profile App baseline.

`main` remains the stable course starter / Week 1 baseline for new students. Week 2 work lives on `feature/week2-member-app`.

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
- Mock identity, member status, Classroom context, and future points now appear on the profile screen
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

## Current Goal

Continue Week 2 from the implementation branch while preserving Week 1 as the frozen learning milestone.

The current implementation uses real Google Sign-In code and evolves the existing profile screen directly. It does not include real Classroom API calls, secrets, credentials committed to source, persistent auth, or backend integration.

Week 2 participants should work from `feature/week2-member-app`. New students starting the Week 1 starter app should use `main`.

## In Progress

- Android Google Sign-In boundary stabilized

## Next Up

- Replace mock Classroom data with Google Classroom API integration
- Add profile UI polish after product flow is confirmed
- Expand tests around member status, Classroom context, and drawer navigation states
- Centralize remaining small inline dimensions in widgets

## Not Started

- Real authenticated member persistence
- Real Google Classroom integration
- participation economy features

## Open Questions

- Exact Week 2 implementation order for auth, member profile, and Classroom context
- Whether to move OAuth IDs out of source and fully into platform config before production
- Whether auth state should persist locally before a backend exists
- Whether the placeholder `G` should be replaced with an official Google brand asset

## Session Notes

- Minimum Week 2 runtime foundation is now implemented on `feature/week2-member-app`.
- Week 2 now evolves the original profile route directly instead of using a disconnected member dashboard.
- Weekly feature branches are not throwaway branches; they are course learning tracks.
- `main` should not automatically absorb weekly work unless the course owner explicitly changes the branch strategy.
- The app lands on the Sign In screen, then navigates to the evolved Profile screen.
- Sign In now uses the real `google_sign_in` package through `GoogleAuthService`.
- Classroom remains mock-first.
- Member status remains mock-first.
- Talkware Points remains a placeholder.
- The `context/` folder is living documentation and should be updated whenever architecture or workflow changes.
