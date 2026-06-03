# UI Context

## UI Direction

The current UI is the Week 2 Talkware Member App evolution of the Week 1 Builder Profile App baseline. It remains clean, professional, beginner-readable, and easy to evolve.

Week 2 uses the same centralized resources, theme, and reusable section-based layout patterns from Week 1.

## Theme

Light mode only for the current baseline.

The visual language uses:

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
| Large title | `titleLarge` | 20 | w700 |
| Section title | `titleMedium` | 16 | w700 |
| Body text | `bodyLarge` | 16 | w400 |
| Label / muted | `bodyMedium` | 14 | w400 |

## Dimensions

Dimensions are defined in `lib/app/constant/resources/app_dimens.dart`.

| Constant | Value | Usage |
| --- | --- | --- |
| `AppDimens.screenPadding` | 20px | Main profile padding and member header padding |
| `AppDimens.cardRadius` | 8px | Card and container border radius |
| `AppDimens.avatarSize` | 108px | Original avatar size reference; current header uses half size |
| `AppDimens.itemGap` | 12px | Vertical gap between sections |
| `AppDimens.sectionGap` | 32px | Larger vertical section spacing |
| `AppDimens.signInMaxWidth` | 400px | Sign-in content max width |
| `AppDimens.signInHorizontalPadding` | 24px | Sign-in horizontal padding |
| `AppDimens.signInLogoSize` | 64px | Sign-in logo size |
| `AppDimens.signInButtonHeight` | 54px | Sign-in button height |
| `AppDimens.signInProviderIconSize` | 24px | Sign-in provider icon size |
| `AppDimens.profileHeaderAvatarSize` | 54px | Profile header Google avatar size |
| `AppDimens.drawerAvatarSize` | 44px | Drawer Google avatar size |

## Current Components

Shared widgets live in `lib/app/widget/`:

- `SectionCard` - titled card container used for profile, status, Classroom, and future points sections
- `ProfileInfoTile` - Week 1 reusable icon, label, and value row retained for future reuse

The app uses Flutter Material components styled through `AppTheme`.

## Layout Patterns

Current profile layout:

- `Scaffold`
- `AppBar`
- `Drawer`
- `SafeArea`
- `ListView`
- mock member identity header
- stacked reusable sections
- drawer navigation with Profile and Sign Out actions

Current sign-in layout:

- `Scaffold`
- `SafeArea`
- `LayoutBuilder`
- `SingleChildScrollView`
- max-width constrained centered content
- footer row with Terms of Service and Privacy Policy actions

Week 2 screens should preserve this sense of clarity. New member, auth, or classroom UI should use centralized resources and reusable widgets instead of inline styling.

## Week 2 UI Evolution

Current Week 2 UI additions:

- dedicated sign-in screen
- real Google identity header on the profile screen
- hamburger drawer with Profile and Sign Out
- member status section
- fixed Talkware Classroom course summary
- future points placeholder card

The app starts on Sign In, then routes to the evolved profile screen after Google Sign-In succeeds. The Classroom card now loads one fixed Talkware course from the real Google Classroom API. Member status remains mock-first, and points remains a placeholder.

### Sign In Screen Reality

`SignInScreen` extends `BaseView<AuthController>` and uses:

- SVG app logo from `AppImages.logo`
- app name `Talkware Journey`
- title `Log In`
- subtitle `Please log in to continue.`
- one full-width outlined `Sign in with Google` action
- footer `TextButton`s for Terms of Service and Privacy Policy

The current Google icon is a simple circular `G` placeholder, not an official Google asset.
