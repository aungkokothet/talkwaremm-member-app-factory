# Progress Tracker

## Current Phase

Week 2 mock-first profile evolution implemented.

## Stable Baseline

Week 1 is complete and preserved as the stable Builder Profile App baseline.

Week 1 includes:

- Flutter + GetX project scaffold
- centralized `AppColors`, `AppDimens`, `AppString`, `AppImages`, and `AppTheme`
- `BaseController` and `BaseView`
- `InitialBinding` and `ProfileBinding`
- GetX route constants and page registration
- immutable `ProfileInfo` model with `copyWith`
- reactive `ProfileController`
- Profile screen with header, About, Contact, and Skills sections
- reusable `SectionCard` and `ProfileInfoTile`
- SVG logo support through `flutter_svg`
- widget smoke test coverage

## Completed

- Repository references synchronized to `https://github.com/aungkokothet/talkwaremm-member-app-factory.git`
- AI workflow and context system established
- Week 1 frozen baseline preparation completed
- Documentation and workflow alignment completed
- Branch/tag workflow defined for students and contributors
- Week 2 runtime implementation started
- Minimum `auth`, `member`, and `classroom` feature modules added
- Mock Google identity model and sign-in/sign-out behavior added
- Member learning profile implemented on the existing profile route
- Talkware member status badge added
- Classroom context card with sample course and assignment data added
- Future Talkware Points placeholder card added
- Widget coverage updated for the evolved member profile, mock sign-out, and mock sign-in
- Separate member dashboard approach corrected
- Existing ProfileScreen evolved into the Talkware Member learning profile
- Mock identity, member status, Classroom context, and future points now appear on the profile screen
- Separate dashboard route and screen removed from active routing
- Flutter analyze passed after correction
- Widget tests passed after correction
- Dedicated Sign In screen added as the initial route
- Profile app bar title removed so the screen does not show "Talkware Member Profile" at the top
- Hamburger menu added with Profile and Sign Out actions
- Sign Out moved out of the profile header and into the hamburger menu

## Current Goal

Continue Week 2 from the implementation branch while preserving Week 1 as the frozen learning milestone.

The current implementation is mock-first and evolves the existing profile screen directly. It does not include real Google OAuth, real Classroom API calls, secrets, or credentials.

## In Progress

- Ready for review before merge

## Next Up

- Replace mock Google identity with real OAuth once project/client configuration is ready
- Replace mock Classroom data with Google Classroom API integration
- Add profile UI polish after product flow is confirmed
- Expand tests around member status, Classroom context, and drawer navigation states

## Not Started

- Real Google Sign-In implementation
- Real authenticated member persistence
- Real Google Classroom integration
- participation economy features

## Open Questions

- Exact Week 2 implementation order for auth, member profile, and Classroom context
- Google project/client configuration details
- Whether mock auth state should persist locally before real OAuth is introduced
- Whether mock profile initials are sufficient until a real Google profile photo URL is available

## Session Notes

- Minimum Week 2 runtime foundation is now implemented on `feature/week2-member-app`.
- Week 2 now evolves the original profile route directly instead of using a disconnected member dashboard.
- The app lands on the Sign In screen, then navigates to the evolved Profile screen.
- The `context/` folder is living documentation and should be updated whenever architecture or workflow changes.
