# UI Context

## UI Direction

The current UI is the Week 2 Talkware Member App evolution of the Week 1 Builder Profile App baseline. It remains clean, professional, beginner-readable, and easy to evolve.

Week 2 preserves the Week 1 architecture while using the logo-derived Talkware Enterprise design system for visible app surfaces.

## Theme

Light and dark themes are provided through `TalkwareTheme`.

The visual language uses:

- neutral-first surfaces
- deep navy brand grounding
- electric blue primary actions
- subtle borders
- low elevation

The app root uses `TalkwareTheme.light`, `TalkwareTheme.dark`, and `ThemeMode.system`.

## Colors

Brand and theme colors are centralized under `lib/app/design/` and applied through `TalkwareTheme`. Do not hardcode hex values in widgets when theme values or design tokens can be used.

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

Typography uses Inter through Google Fonts in `TalkwareTheme`. Use `Theme.of(context).textTheme` in widgets.

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

- `SectionCard` - titled card container used for profile, Classroom, wallet, send, receive, review, and history surfaces
- `ProfileInfoTile` - Week 1 reusable icon, label, and value row retained for future reuse

The app uses Flutter Material components styled through `TalkwareTheme`.

## Layout Patterns

Current profile layout:

- `Scaffold`
- `AppBar`
- `Drawer`
- `SafeArea`
- `ListView`
- real Google identity header
- Classroom context card
- drawer navigation with Profile, Wallet, and Sign Out actions

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
- fixed Talkware Classroom course summary
- wallet navigation, local wallet activation, receive QR, QR-based send, review, and local history screens

The app starts on Sign In, then routes to the evolved profile screen after Google Sign-In succeeds. The Classroom card now loads one fixed Talkware course from the real Google Classroom API. Mock Talkware Member Status and placeholder Talkware Points cards are no longer shown on the profile screen. Wallet remains available from the drawer and uses a compact operational layout: balance, Receive, Send, and a small bottom History link.

### Wallet Screen Reality

`WalletScreen` extends `BaseView<WalletController>` and uses:

- a top balance card with refresh
- `Receive` and `Send` action buttons after activation
- a small `History` text link at the bottom
- Receive QR showing only the wallet public key
- Send QR scan, readonly recipient, readonly configured asset, amount input, review, passcode unlock, and confirmation
- transaction history list with truncated public keys and full details on tap

### Sign In Screen Reality

`SignInScreen` extends `BaseView<AuthController>` and uses:

- Talkware logo asset from `TalkwareAssets.logo`
- app name `Talkware Journey`
- title `Log In`
- subtitle `Please log in to continue.`
- one full-width primary `Sign in with Google` action
- footer `TextButton`s for Terms of Service and Privacy Policy

The current Google icon is a simple circular `G` placeholder, not an official Google asset.
