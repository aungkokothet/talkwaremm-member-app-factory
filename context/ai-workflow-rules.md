# AI Workflow Rules

## Purpose

This file defines how AI agents should work in the Talkware Member App Factory repository.

The repository evolves like a software factory. Agents must preserve stable milestones, follow existing architecture, and keep documentation synchronized with meaningful changes.

## Required Reading Order

Before architectural or implementation work, read:

1. `AGENTS.md`
2. `context/current-state.md`
3. `context/project-overview.md`
4. `context/architecture.md`
5. `context/code-standards.md`
6. `context/ui-context.md`
7. `context/progress-tracker.md`
8. `context/decision-log.md`
9. `context/ai-workflow-rules.md`

Use `current-state.md` as the current project direction and `decision-log.md` as historical reasoning.

## Operating Rules

- Preserve Flutter + GetX.
- Preserve `BaseController` and `BaseView`.
- Preserve centralized resources.
- Preserve feature-based structure.
- Do not hardcode routes, colors, dimensions, strings, or asset paths in new work.
- Prefer small, focused changes.
- Do not rewrite working systems unless explicitly instructed.
- Keep implementation beginner-readable.

## Week Continuity

Week 1 is the stable baseline. It should remain accessible through its frozen tag.

`main` remains the stable course starter app and Week 1 baseline for new students.

Week 2 is the current evolution and lives on `feature/week2-member-app`.

Future weekly branches, such as `feature/week3-loyalty-structure`, are persistent learning tracks, not throwaway branches.

Future weeks should extend the same app rather than creating unrelated projects.

## Git Workflow

- `main` represents the stable course starter / Week 1 baseline.
- `feature/week2-member-app` represents the Week 2 Talkware Member App evolution.
- `feature/week3-loyalty-structure` is the planned Week 3 evolution branch.
- tags preserve frozen weekly milestones.
- weekly feature branches hold course evolution tracks.
- `main` should not automatically absorb weekly work unless the course owner explicitly changes the branch strategy.

New student starter:

```bash
git checkout main
git pull
```

Week 2 participant:

```bash
git checkout feature/week2-member-app
```

Do not commit unrelated runtime changes during documentation-only tasks.

## Documentation Maintenance

Update documentation when changing:

- product direction
- architecture
- workflow
- feature boundaries
- implementation status
- UI system rules

For documentation-only synchronization, do not modify runtime code.

## Week 2 Implementation Guardrail

Google Sign-In is now implemented through the official `google_sign_in` package and works on Android. Do not describe Google Classroom, member status, Talkware Points, wallet behavior, backend auth, client secrets, or persistent auth as real yet.

The current Week 2 code already has `auth`, `member`, and `classroom` feature modules. Future implementation should extend those modules and keep the existing profile route composition unless a product decision explicitly changes the flow.
