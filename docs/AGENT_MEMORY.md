# Agent Memory

This file serves as a persistent memory for any AI agents working on this project.

## Instructions for Agents

- **Update Required**: Every agent or AI reading this must update this document **as often as possible** with significant highlights, code changes, architectural decisions, and important milestones in our coding journey.
- **Goal**: Maintain a clear context and history for future iterations and handovers. Ensure the log is a living document of the project's evolution.

---

## Project Context

- **Project**: Monster Hunter Weakness Viewer
- **Technology Stack**: Expo (React Native), NativeWind (Tailwind), TanStack Query, Axios
- **Architecture**: Bulletproof React (Feature-based structure)
- **Status**: Sprint Planning Completed; Core Learning Phase Completed; Ready for Sprint 1 Implementation
- **Entry Point**: `app/_layout.tsx` (root layout with Stack navigator)

## Coding Journey Highlights

- **[2026-03-16]**: Project initialization. User confirmed using Expo for development to avoid Android Studio dependencies. Established documentation structure (`docs/sprint/` and `AGENT_MEMORY.md`).
- **[2026-03-16]**: Created 6-sprint user-story roadmap with acceptance criteria.
- **[2026-03-16]**: Added supporting docs:
  - `docs/html-to-react-native.md` — mapping HTML/web dev concepts to RN equivalents
  - `docs/README.md` — index linking all sprint files
- **[2026-03-16]**: Extensive learning session on Expo/React Native fundamentals:
  - expo-router filesystem routing; `(groupName)` route groups; dynamic segments `[id]`
  - Navigation: `<Link href="/path">` (declarative) vs `useRouter()` (imperative)
  - Two \_layout.tsx levels: root Stack (app/\_layout.tsx) + feature-level (app/(tabs)/\_layout.tsx for bottom tabs)
  - Header customization via `options` or custom View with `headerShown: false`
  - Layout: Flexbox default; `position: absolute` + `zIndex` for overlap
  - StatusBar from expo-status-bar; `style="auto"` for theme-aware icons
- **[2026-03-16]**: APK build process:
  - Local: `npx expo prebuild --clean --platform android` → `cd android && .\gradlew.bat assembleDebug`
  - gradlew included in prebuild; no Scoop install needed
  - Output: `android/app/build/outputs/apk/debug/app-debug.apk`
- **Key Decisions**:
  - NativeWind for styling (Tailwind CSS for React Native)
  - TanStack Query for API caching and data management
  - Bulletproof React folder structure for scalability
  - Local APK build for testing (no EAS login required)
