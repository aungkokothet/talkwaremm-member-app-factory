# Profile Challenge App

Week 1 training starter project for practicing Flutter UI customization.

The architecture mirrors the CommerceManagerAppDD style in a smaller shape:

- `lib/main.dart` starts the app.
- `lib/main_app.dart` configures `GetMaterialApp`.
- `lib/app/constant/resources/` holds colors, text, images, dimensions, and theme.
- `lib/app/constant/routing/` holds route names and `GetPage` setup.
- `lib/app/core/` holds base controller/view and initial binding.
- `lib/app/features/profile/` holds the profile binding, controller, and screen.
- `lib/app/widget/` holds reusable UI widgets.

## Student Challenge

Keep the architecture, then redesign the single profile page:

- Change the color theme in `app_colors.dart`.
- Replace or redesign the logo in `assets/images/profile_challenge_logo.svg`.
- Update the profile structure and data in `profile_controller.dart`.
- Decorate or reorganize the UI in `profile_screen.dart`.

Run with:

```bash
flutter run
```
