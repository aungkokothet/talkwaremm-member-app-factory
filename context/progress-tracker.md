# Progress Tracker

## Current Phase

Week 2 mock-first foundation implemented.

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
- Member dashboard route and screen added
- Talkware member status badge added
- Classroom context card with sample course and assignment data added
- Future Talkware Points placeholder card added
- Widget coverage added for profile-to-dashboard navigation and mock sign-in

## Current Goal

Continue Week 2 from the implementation branch while preserving Week 1 as the frozen learning milestone.

The current implementation is mock-first. It does not include real Google OAuth, real Classroom API calls, secrets, or credentials.

## In Progress

- Week 2 member app foundation review

## Next Up

- Decide whether the profile screen remains the default entry or the member dashboard becomes the default entry
- Replace mock Google identity with real OAuth once project/client configuration is ready
- Replace mock Classroom data with Google Classroom API integration
- Add member dashboard polish after product flow is confirmed
- Expand tests around sign-out and direct dashboard routing

## Not Started

- Real Google Sign-In implementation
- Real authenticated member persistence
- Real Google Classroom integration
- participation economy features

## Open Questions

- Exact Week 2 implementation order for auth, member profile, and Classroom context
- Google project/client configuration details
- Whether Week 2 should keep the profile screen as the default initial route or evolve it into the member dashboard
- Whether mock auth state should persist locally before real OAuth is introduced

## Session Notes

- Minimum Week 2 runtime foundation is now implemented on `feature/week2-member-app`.
- Week 1 profile functionality remains available as the initial route.
- The `context/` folder is living documentation and should be updated whenever architecture or workflow changes.
