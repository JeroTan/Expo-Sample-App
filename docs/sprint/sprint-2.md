# Sprint 2: Bulletproof Architecture

## Goal

Refactor the project structure to follow the "Bulletproof React" pattern, adapted for Expo.

## User Stories

- **As a Developer**, I want a scalable folder structure so that the codebase remains maintainable as the project grows.
- **As a Developer**, I want to separate features like "Monsters" and "Settings" into their own modules.

## Proposed Structure (`src/`)

- `src/features/`: Modules for specific functionality (e.g., `monsters/`).
- `src/components/`: Shared, low-level components (Buttons, Inputs).
- `src/hooks/`: Global reusable hooks.
- `src/providers/`: Context providers (Theme, Auth, API).
- `src/utils/`: Helper functions.

## Tasks

- [ ] Create `src/` directory at the project root.
- [ ] Set up `features/`, `components/`, and `hooks/` subfolders.
- [ ] Move any existing boilerplate logic into the new structure.
- [ ] Update `app/` (Expo Router) to import from `src/features/`.

## Definition of Done

- All source code resides in `src/`.
- The app still runs correctly after refactoring.
