# Architecture Context

## Architecture Principle

The app evolves week by week, but the Week 1 architecture remains the foundation. Future work should extend the existing Flutter + GetX structure instead of replacing it.

## Stack

| Layer | Technology | Role |
| --- | --- | --- |
| Framework | Flutter (Dart SDK ^3.9.2) | Cross-platform UI framework |
| State Management | GetX ^4.7.2 | Reactive state, dependency injection, routing |
| Authentication | google_sign_in ^7.2.0 | Direct Google account sign-in |
| Google Classroom API | OAuth bearer token over HTTPS | Fixed Talkware course lookup |
| SVG Rendering | flutter_svg ^2.0.17 | Renders SVG assets |
| Icons | Material Icons | Built-in Flutter UI icons |
| Stellar wallet signing | stellar_flutter_sdk ^2.2.2 | Builds and signs local Talkware Points payment transactions |
| Local encryption | cryptography ^2.9.0 | Passcode-derived AES-GCM encryption for imported customer wallet secrets |

## Current System Boundaries

- `lib/app/constant/` - app-wide constants for config, resources, and routing
- `lib/app/constant/config/` - isolated Google Sign-In configuration values read from dart defines
- `lib/app/constant/resources/` - colors, dimensions, strings, images, and theme
- `lib/app/constant/routing/` - route constants and GetX page registration
- `lib/app/core/` - shared base abstractions and app-level binding
- `lib/app/features/auth/` - sign-in screen, app identity model, auth service boundary, and sign-in/sign-out state
- `lib/app/features/profile/` - evolved profile screen and lightweight profile controller
- `lib/app/features/member/` - mock member status state for the evolved profile screen
- `lib/app/features/classroom/` - fixed Talkware Classroom course API state and service
- `lib/app/features/wallet/` - local Talkware Points activation, receive, QR-based send, local signing, and transaction history
- `lib/app/widget/` - shared reusable widgets
- `assets/images/` - static image and SVG assets
- `test/` - widget tests

## Preserved Foundation

The following patterns are stable and should be preserved:

1. Screens extend `BaseView<T>` and implement `buildView()`.
2. Controllers extend `BaseController`.
3. Routes are defined through centralized route constants.
4. Colors, dimensions, strings, images, and theme live in centralized resource files.
5. Features are organized under `lib/app/features/{feature}/`.
6. Shared UI belongs in `lib/app/widget/` when it is reusable across features.

## Routing

Routing is handled by GetX through `GetMaterialApp`.

- Route names live in `lib/app/constant/routing/app_route.dart`.
- Pages and bindings live in `lib/app/constant/routing/app_pages.dart`.
- The current app starts at `Routes.signIn`.
- Google sign-in sets `AuthController.identity` and routes to `Routes.profileScreen`.
- Sign out clears `AuthController.identity` and routes back to `Routes.signIn`.
- `InitialBinding` is registered at app startup for shared dependencies.
- Feature bindings register feature controllers with GetX.
- Active routes include `Routes.signIn`, `Routes.profileScreen`, wallet, receive, send scan, send form, send review, and wallet history routes.
- There is no active member dashboard route.

## State Model

The current Week 2 code keeps `ProfileController` as a lightweight `BaseController` with no profile model. The profile screen composes Google identity, mock member status, and fixed Talkware Classroom state from feature controllers:

- `AuthController.identity` is `Rxn<AppIdentity>`.
- `MemberController.status` is `Rx<MemberStatus>`.
- `ClassroomController.context` is `Rxn<ClassroomContext>`.

The same style should guide future features:

- immutable data objects where practical
- explicit state changes
- `Obx()` for reactive UI updates
- shared loading and message state through `BaseController`

## Week 2 Evolution Boundary

Week 2 has added these feature modules:

```txt
lib/app/features/auth/
lib/app/features/member/
lib/app/features/classroom/
```

Those modules integrate through the sign-in and profile routes. The separate dashboard approach was corrected so Week 2 evolves the existing profile screen directly.

`ClassroomBinding` and `MemberBinding` exist as feature bindings, but the active profile route registers `ClassroomController` and `MemberController` through `ProfileBinding`.

## Auth and Access Status

Current runtime code uses direct Google Sign-In through `google_sign_in`, and Android sign-in is confirmed working. It requests Classroom read scopes and calls the Google Classroom API for one fixed Talkware course ID. Wallet runtime uses local config, customer access ZIP import, encrypted local customer secret storage, direct Horizon/NowNodes balance reads, local signing, direct payment submission, and local history for the configured Talkware Points asset. It does not include Firebase Auth, backend calls, client secrets, a course browser, backend wallet credential fetches, backend signing, arbitrary asset transfer, XLM transfer, or a full Horizon history explorer.

The Android OAuth client ID is registered in Google Cloud with package name and SHA-1, and is not used as Dart `serverClientId`. Android uses the Web OAuth client ID as the default `serverClientId`, with `GOOGLE_SERVER_CLIENT_ID` still available as an override. Setup notes live in `docs/setup/google-sign-in.md`.

Classroom access uses `Authorization: Bearer <access_token>` headers from `GoogleSignInAccount.authorizationClient`. The current implementation loads:

- `GET /v1/courses/865036664004`
- `GET /v1/courses/865036664004/courseWork`
- `GET /v1/courses/865036664004/announcements`

The human-facing Classroom URL uses `/c/ODY1MDM2NjY0MDA0`; the API calls use the decoded numeric course ID.
