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

### Sign In Screen Spec:

Act as an expert Flutter developer. Build a clean, production-ready, and responsive Login Screen widget based on the following specifications.

The screen must be strictly minimalist, featuring ONLY a single "Sign in with Google" button as the authentication method.

### Layout & Structure (Vertical Stack)
1. App Logo / Branding: A placeholder area at the top containing a centered asset Image or Icon (e.g., Icons.explore), an App Name Text widget ("Talkware Journey"), and a small gap.
2. Header Text: An alignment-centered Text widget reading "Log In" using Theme.of(context).textTheme.headlineMedium, followed by a subtle subtitle: "Please log in to continue."
3. Primary Action: A single, centered "Sign in with Google" button. It must follow official Google Identity branding guidelines:
   - Elevated or Outlined Button with a white/light-gray background.
   - Standard Google 'G' logo icon on the left (use a placeholder icon or asset image slot).
   - Text reading "Sign in with Google" or "Continue with Google" on the right.
4. Footer: Small, muted text links at the very bottom for "Terms of Service" and "Privacy Policy" using a Row of TextButtons.

### Technical & UX Constraints

- Responsiveness: Wrap the layout in a LayoutBuilder and SingleChildScrollView to ensure it never overflows on small screens. Maximize card width to 400dp on web/desktop viewports, and make it full-width with 24dp horizontal padding on mobile.
- Safe Area: Wrap everything in a SafeArea widget to respect notches and system bars.
- Architecture: Keep the code modular, stateless (unless handling basic local loading states), and use clean Material 3 design practices. Use standard spacing with SizedBox.

Please output the complete, clean Flutter widget code ready to drop into a file named 'sign_in_screen.dart'.
