# Google Classroom API Setup Notes

This document explains the Week 2 fixed-course Classroom setup.

The app does not list all Classroom courses. It loads one Talkware course only.

## Current Runtime Truth

- Google Sign-In works on Android.
- Classroom API calls use OAuth bearer headers from the signed-in Google account.
- No API key is used.
- No Firebase Auth is used.
- No backend is used.
- Member status remains mock-first.
- Talkware Points remains a placeholder.

## Fixed Talkware Course

Human-facing Classroom URL:

```txt
https://classroom.google.com/c/ODY1MDM2NjY0MDA0
```

Classroom URL code:

```txt
ODY1MDM2NjY0MDA0
```

Classroom API course ID:

```txt
865036664004
```

Important: the Classroom URL code and the Classroom API course ID are not the same value. The API calls use the numeric course ID.

## Google Cloud Setup

Use the same Google Cloud project as Google Sign-In:

```txt
Talkware Journey
```

1. Open Google Cloud Console.
2. Select the `Talkware Journey` project.
3. Go to APIs & Services.
4. Open Library.
5. Enable Google Classroom API.

## OAuth Consent Setup

1. Go to APIs & Services > OAuth consent screen.
2. Keep the app in Testing while this is a course/testing app.
3. Add the tester Google accounts that should sign in from Android.
4. Make sure the signed-in tester account is also enrolled in or allowed to access the fixed Talkware Classroom course.

## OAuth Data Access Scopes

Add these Classroom scopes to OAuth Data Access:

```txt
https://www.googleapis.com/auth/classroom.courses.readonly
https://www.googleapis.com/auth/classroom.student-submissions.me.readonly
https://www.googleapis.com/auth/classroom.announcements.readonly
```

The app requests these scopes through `GoogleSignInConfig.classroomScopes`.

## Runtime API Calls

The app calls:

```txt
GET https://classroom.googleapis.com/v1/courses/865036664004
GET https://classroom.googleapis.com/v1/courses/865036664004/courseWork
GET https://classroom.googleapis.com/v1/courses/865036664004/announcements
```

All requests use:

```txt
Authorization: Bearer <access_token>
```

Do not add an API key. Do not add a client secret to Flutter.

## Android Retest Steps

After changing Classroom scopes or test users:

1. Sign out from the app.
2. Fully stop the Flutter app.
3. Rebuild or rerun the app.
4. Sign in again with the tester Google account.
5. Accept the Classroom permissions if Google shows a consent prompt.
6. Open the Profile screen and check the Classroom card.

If permissions do not refresh, remove the app's Google access from the Google Account security page, then sign in again.

## Expected App States

Success:

- Course name appears from Google Classroom.
- Course section or description appears when available.
- Recent coursework appears when available.
- Announcement appears when available.

Permission missing:

```txt
Classroom permission was not granted. Please sign out and sign in again.
```

Course inaccessible:

```txt
You are signed in, but this Google account does not have access to the Talkware Classroom course.
```

Temporary API problem:

```txt
Classroom data is temporarily unavailable.
```

## Common Causes Of Access Errors

- The tester account was added to OAuth consent but is not enrolled in the Classroom course.
- The tester account is enrolled in Classroom but was not added as an OAuth test user.
- The app was not rebuilt after scope changes.
- The user signed in before the Classroom scopes were added and needs to sign out/sign in again.
- The API call used the Classroom URL code instead of the numeric API course ID.
