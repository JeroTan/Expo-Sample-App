# Sprint 5: API Integration

## Goal

Connect to the Monster Hunter Wilds API and set up data fetching patterns.

## User Stories

- **As a Developer**, I want a centralized way to fetch data so that API calls are consistent and easy to debug.
- **As a User**, I want the app to load monster data automatically from the official source.

## Tech Stack

- **Axios**: For HTTP requests.
- **TanStack Query (React Query)**: For caching, loading states, and offline support.
- **API**: `https://wilds.mhdb.io/`

## Tasks

- [ ] Install `axios` and `@tanstack/react-query`.
- [ ] Create `src/lib/api-client.ts`.
- [ ] Implement the first API call to fetch the Monster Hunter Wilds list.
- [ ] Set up basic error handling and loading indicators.

## Definition of Done

- App successfully logs or displays raw data from the MH Wilds API.
- Caching is enabled via TanStack Query.
