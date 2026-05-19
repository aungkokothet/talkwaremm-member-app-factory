# Profile Challenge App

## Overview

A Flutter mobile/web application built as a Week 1 training challenge. It displays a personal developer profile with name, role, contact info, skills, and an about section. The app is designed as a starting point for students to practice Flutter UI development, theming, and state management using GetX.

## Goals

1. Demonstrate a clean, structured Flutter project using GetX for state management and routing
2. Provide a customizable profile UI that students can redesign with their own color theme and personal brand
3. Establish a scalable folder structure and base classes that can grow with the project

## Core User Flow

1. App launches and navigates directly to the Profile screen
2. User sees a profile header with avatar initials, name, and role
3. User scrolls through About, Contact, and Skills sections
4. Profile data is reactive via GetX — updates to the controller reflect immediately in the UI

## Features

### Profile Display

- Avatar with initials derived from the profile name
- Name, role, and location display
- About section with a short bio
- Contact section with email, phone, and location tiles
- Skills section with chip tags

### Architecture & DX

- GetX-based routing, state management, and dependency injection
- Base controller and base view abstractions for consistent screen structure
- Centralized constants for colors, dimensions, strings, images, and theme
- SVG logo support via `flutter_svg`

## Scope

### In Scope

- Static profile display with reactive state via GetX
- Light theme only
- Single screen (Profile screen)
- SVG asset support

### Out of Scope

- Authentication or user login
- Backend/API integration
- Profile editing UI (data is hardcoded in the controller)
- Dark mode
- Multiple screens or navigation flows

## Success Criteria

1. App launches and displays the Profile screen with Maya Chen's data
2. All sections (About, Contact, Skills) render correctly
3. Avatar initials are correctly derived from the profile name
4. Widget test passes confirming the profile screen renders key content
