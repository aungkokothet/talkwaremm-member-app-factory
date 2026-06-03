# Code Standards

## General

- Keep files small and single-purpose; split large widgets when reuse or clarity improves.
- Fix root causes, do not layer workarounds.
- Do not mix unrelated concerns in one widget or controller.
- Use `const` constructors wherever possible to optimize rebuilds.
- Prefer immutable data models with `copyWith` when models need updates over time.

## Dart / Flutter

- Dart SDK constraint: `^3.9.2`.
- Use `flutter_lints` rules; do not suppress lint warnings without justification.
- Use named parameters for all widget constructors with more than one argument.
- Use `required` for all non-nullable named parameters.
- Avoid `dynamic`; use explicit types or generics.
- Use `withValues(alpha: x)` instead of deprecated `withOpacity(x)` for color alpha.

## GetX

- All controllers must extend `BaseController`, which extends `GetxController`.
- All screens must extend `BaseView<T>` and implement `buildView()`; never override `build()` directly.
- Use `Get.lazyPut()` with `fenix: true` in bindings for feature controllers.
- Register shared/global services in `InitialBinding`.
- Register feature-scoped controllers in their own `Binding` class.
- Use `Obx()` for reactive UI rebuilds; prefer it over `GetBuilder` for simplicity.

## Theming & Styling

- All colors must come from `AppColors`; no hardcoded hex values in widgets.
- All dimensions should come from `AppDimens`; current code still has a few small inline layout values that should be centralized during cleanup.
- All user-facing strings should come from `AppString`; the current Google placeholder letter `G` is the only visible inline text exception.
- All image paths must come from `AppImages` or centralized string constants; no hardcoded asset paths in widgets.
- Theme is defined in `AppTheme.lightTheme`; avoid ad hoc page-level themes.
- Use `Theme.of(context).textTheme` for typography. `copyWith` is acceptable when applying centralized colors or weights.

## File Organization

- `lib/app/constant/resources/` - color, dimension, string, image, and theme constants
- `lib/app/constant/routing/` - route name constants and page registration
- `lib/app/core/base/` - `BaseController` and `BaseView` abstractions
- `lib/app/core/binding/` - `InitialBinding` for app-level dependency registration
- `lib/app/features/{feature}/` - feature modules. Current feature folders may include only the subfolders they need, such as `binding/`, `controller/`, `model/`, and `screen/`.
- `lib/app/widget/` - shared reusable widgets used across multiple features
- `assets/images/` - static image and SVG assets
- `test/` - widget tests

## Testing

- Widget tests live in `test/` and use `flutter_test`.
- Test file names mirror the file they test when practical.
- Tests should reference centralized constants such as `AppString` where possible.
