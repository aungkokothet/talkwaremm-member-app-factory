# Progress Tracker

## Current Phase

Complete (Week 1 baseline)

## Current Goal

Baseline profile display app is fully implemented. Ready for student customization (color theme, layout, personal branding).

## Completed

- Project scaffolded with Flutter + GetX
- `AppColors`, `AppDimens`, `AppString`, `AppImages`, `AppTheme` constants defined
- `BaseController` and `BaseView` abstractions implemented
- `InitialBinding` and `ProfileBinding` set up
- GetX routing configured (`AppRoute`, `AppPages`)
- `ProfileInfo` immutable model with `copyWith` implemented
- `ProfileController` with reactive `Rx<ProfileInfo>` implemented
- `ProfileScreen` with header, About, Contact, and Skills sections implemented
- `SectionCard` and `ProfileInfoTile` shared widgets implemented
- SVG logo in AppBar via `flutter_svg`
- Widget smoke test passing (`widget_test.dart`)

## In Progress

- Nothing currently in progress

## Next Up

- Student task: Replace `AppColors` values with a personal color palette
- Student task: Update `ProfileInfo` data in `ProfileController` with real personal info
- Student task: Optionally add new sections or redesign the profile header layout

## Open Questions

- None at this time

## Architecture Decisions

- GetX chosen for state management and routing to keep the project lightweight and beginner-friendly
- `BaseController` / `BaseView` pattern adopted to enforce consistent screen structure and make loading state handling reusable
- `ProfileInfo` is an immutable value object (not a mutable model) to make state changes explicit via `copyWith` and `Rx`
- `fenix: true` used in `ProfileBinding` so the controller is recreated if disposed and the route is revisited

## Session Notes

- All source files are in `lib/`. The app has a single feature (`profile`) and two shared widgets.
- Students should start customization in `app_colors.dart` and `profile_controller.dart`.
- The `context/` folder contains living documentation — update it when making structural changes.
