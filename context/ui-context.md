# UI Context

## Theme

Light mode only. The design language is a clean, professional mobile profile card — light backgrounds, teal primary color, warm accent, and subtle borders. No dark mode.

## Colors

All colors are defined in `lib/app/constant/resources/app_colors.dart` and applied via `AppTheme`. Never use hardcoded hex values in widgets.

| Role             | Constant                  | Value       |
| ---------------- | ------------------------- | ----------- |
| Primary          | `AppColors.primary`       | `#1F7A8C`   |
| Secondary        | `AppColors.secondary`     | `#F25F5C`   |
| Accent           | `AppColors.accent`        | `#FFC857`   |
| Page background  | `AppColors.background`    | `#F7F9FB`   |
| Surface (cards)  | `AppColors.surface`       | `#FFFFFF`   |
| Primary text     | `AppColors.textPrimary`   | `#102A43`   |
| Muted/label text | `AppColors.textSecondary` | `#627D98`   |
| Border           | `AppColors.border`        | `#D9E2EC`   |

## Typography

Defined in `AppTheme.lightTheme` via `ThemeData.textTheme`. Always use `Theme.of(context).textTheme` — do not define inline `TextStyle`.

| Role            | Style key        | Size | Weight |
| --------------- | ---------------- | ---- | ------ |
| Name / headline | `headlineMedium` | 28   | w800   |
| Section title   | `titleMedium`    | 16   | w700   |
| Body text       | `bodyLarge`      | 16   | w400   |
| Label / muted   | `bodyMedium`     | 14   | w400   |

## Border Radius

Defined in `AppDimens` and `AppTheme`.

| Context         | Value                    |
| --------------- | ------------------------ |
| Cards           | `AppDimens.cardRadius` (8px) |
| Avatar circle   | `AppDimens.avatarSize / 2` (54px) |
| Info tile icon  | 8px (inline)             |

## Dimensions

Defined in `lib/app/constant/resources/app_dimens.dart`.

| Constant                | Value  | Usage                          |
| ----------------------- | ------ | ------------------------------ |
| `AppDimens.screenPadding` | 20px | ListView outer padding         |
| `AppDimens.cardRadius`    | 8px  | Card and container border radius |
| `AppDimens.avatarSize`    | 108px | Avatar circle diameter         |
| `AppDimens.itemGap`       | 12px | Vertical gap between sections  |

## Component Library

No third-party component library. Uses Flutter's built-in Material 3 components (`Card`, `Chip`, `AppBar`, `Scaffold`, `ListView`) styled via `AppTheme`.

Custom shared widgets live in `lib/app/widget/`:
- `SectionCard` — titled card container used for About, Contact, and Skills sections
- `ProfileInfoTile` — icon + label + value row used in the Contact section

## Layout Patterns

- Single-screen app with a `Scaffold` + `AppBar` + `SafeArea` + `ListView`
- Profile header is a full-width colored container with avatar initials, name, and role
- Sections (About, Contact, Skills) are `SectionCard` widgets stacked vertically in the list
- Contact items use `ProfileInfoTile` with a colored icon box, label, and value
- Skills use `Wrap` with `Chip` widgets

## Icons

Material Icons (built-in Flutter). Used in `ProfileInfoTile`:
- `Icons.email_outlined` — email
- `Icons.phone_outlined` — phone
- `Icons.place_outlined` — location

AppBar logo: SVG asset via `flutter_svg`, rendered at 36×36px.
