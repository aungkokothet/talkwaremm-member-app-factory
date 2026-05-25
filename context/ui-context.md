# UI Context

## UI Direction

The current UI is the Week 1 Builder Profile App baseline. It should remain clean, professional, beginner-readable, and easy to evolve.

Week 2 may evolve the experience toward a Talkware Member App, but the UI system should continue to use the same centralized resources, theme, and reusable section-based layout patterns.

## Theme

Light mode only for the current baseline.

The Week 1 visual language uses:

- light backgrounds
- teal primary color
- warm accent color
- subtle borders
- card-based information sections

No dark mode is currently implemented.

## Colors

All colors are defined in `lib/app/constant/resources/app_colors.dart` and applied through `AppTheme`. Do not hardcode hex values in widgets.

| Role | Constant | Value |
| --- | --- | --- |
| Primary | `AppColors.primary` | `#1F7A8C` |
| Secondary | `AppColors.secondary` | `#F25F5C` |
| Accent | `AppColors.accent` | `#FFC857` |
| Page background | `AppColors.background` | `#F7F9FB` |
| Surface | `AppColors.surface` | `#FFFFFF` |
| Primary text | `AppColors.textPrimary` | `#102A43` |
| Muted text | `AppColors.textSecondary` | `#627D98` |
| Border | `AppColors.border` | `#D9E2EC` |

## Typography

Typography is defined in `AppTheme.lightTheme` through `ThemeData.textTheme`. Use `Theme.of(context).textTheme` in widgets.

| Role | Style key | Size | Weight |
| --- | --- | --- | --- |
| Name / headline | `headlineMedium` | 28 | w800 |
| Section title | `titleMedium` | 16 | w700 |
| Body text | `bodyLarge` | 16 | w400 |
| Label / muted | `bodyMedium` | 14 | w400 |

## Dimensions

Dimensions are defined in `lib/app/constant/resources/app_dimens.dart`.

| Constant | Value | Usage |
| --- | --- | --- |
| `AppDimens.screenPadding` | 20px | ListView outer padding |
| `AppDimens.cardRadius` | 8px | Card and container border radius |
| `AppDimens.avatarSize` | 108px | Avatar circle diameter |
| `AppDimens.itemGap` | 12px | Vertical gap between sections |

## Current Components

Shared widgets live in `lib/app/widget/`:

- `SectionCard` - titled card container used for profile, status, Classroom, and future points sections
- `ProfileInfoTile` - Week 1 reusable icon, label, and value row retained for future reuse

The app uses Flutter Material components styled through `AppTheme`.

## Layout Patterns

Current layout:

- `Scaffold`
- `AppBar`
- `SafeArea`
- `ListView`
- profile header
- stacked reusable sections
- `Wrap` for skill chips

Week 2 screens should preserve this sense of clarity. New member, auth, or classroom UI should use centralized resources and reusable widgets instead of inline styling.

## Week 2 UI Evolution

Current Week 2 UI additions:

- dedicated mock sign-in screen
- member identity header on the profile screen
- hamburger menu with Profile and Sign Out
- member status section
- classroom participation summary
- future points placeholder card

These are mock-first UI surfaces. The app starts on Sign In, then routes to the evolved profile screen. Real Google identity, Classroom data, and points systems are not implemented yet.
