# Architecture Context

## Stack

| Layer            | Technology              | Role                                          |
| ---------------- | ----------------------- | --------------------------------------------- |
| Framework        | Flutter (Dart SDK ^3.9) | Cross-platform UI framework                   |
| State Management | GetX ^4.7.2             | Reactive state, dependency injection, routing |
| SVG Rendering    | flutter_svg ^2.0.17     | Renders SVG assets (logo)                     |
| Icons            | Material Icons (built-in) | UI icons throughout the app                 |

## System Boundaries

- `lib/app/constant/` — App-wide constants: colors, dimensions, strings, images, theme, and routing config
- `lib/app/core/` — Base abstractions: `BaseController` (GetX), `BaseView` (GetView wrapper), `InitialBinding`
- `lib/app/features/profile/` — Profile feature: controller, screen, and binding (self-contained feature module)
- `lib/app/widget/` — Shared reusable widgets: `ProfileInfoTile`, `SectionCard`
- `assets/images/` — Static image assets (SVG logo)
- `test/` — Widget tests

## Routing

- Routing is handled by GetX via `GetMaterialApp`
- Routes are defined in `lib/app/constant/routing/app_route.dart` (route name constants)
- Pages and bindings are registered in `lib/app/constant/routing/app_pages.dart`
- The app starts at `Routes.profileScreen` (`/profile-screen`)
- `InitialBinding` is registered at app startup for shared services (currently empty)
- `ProfileBinding` lazily puts `ProfileController` with `fenix: true`

## State Model

- `ProfileController` holds a single `Rx<ProfileInfo>` observable
- `ProfileInfo` is an immutable value object with a `copyWith` method
- The profile screen uses `Obx()` to reactively rebuild when profile data changes
- `BaseController` provides shared `isLoading` and `message` observables used by `BaseView`

## Auth and Access Model

- No authentication. The app is a single-user, local-only profile display.
- No access control or ownership model.

## Invariants

1. All screens extend `BaseView<T>` and implement `buildView()` — never override `build()` directly
2. All controllers extend `BaseController` — never use raw `GetxController` in features
3. Route names are defined only in `app_route.dart` — never hardcode route strings elsewhere
4. Color values are defined only in `AppColors` — never use hardcoded hex values in widgets
5. Dimension values are defined only in `AppDimens` — never use hardcoded numeric sizes in widgets
