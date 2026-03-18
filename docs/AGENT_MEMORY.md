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
- **[2026-03-16]**: Prebuild & APK build session:
  - Ran `npx expo prebuild --clean` successfully (generates Android only on Windows; iOS requires macOS/Xcode)
  - Android package name: `com.anonymous.monsterhunterview`
  - Java/JDK requirement: Gradle needs JDK to compile. Installed via `scoop bucket add java && scoop install openjdk`
  - APK build started: `.\gradlew.bat assembleDebug` (compiles RN + native code into debug APK)
  - Build issue: Java 25 (OpenJDK) incompatible with Gradle 8.14.3 (error: "Unsupported class file major version 69")
  - Solution: Installed Java 21 LTS via `scoop install temurin21-jdk` (compatible with Gradle 8.14.3)
  - JAVA_HOME setup: Temporary (session-only) via `$env:JAVA_HOME = "C:\Users\JeroweTan\scoop\apps\temurin21-jdk\current"`
  - Permanent JAVA_HOME: Use `[Environment]::SetEnvironmentVariable()` in PowerShell or Windows Environment Variables GUI
- **[2026-03-16] (Session 2)**: Android SDK and APK build troubleshooting:
  - First gradle run failed: `ANDROID_HOME` not set; no Android SDK installed
  - Attempted: `scoop install android-sdk` → failed (not in Scoop extras bucket)
  - Pivoted to: `scoop install android-studio` → installed successfully (1.3 GB)
  - Android Studio installed but SDK not auto-configured; tried `scoop install android-clt` (command-line tools)
  - `android-clt` installed; contains `sdkmanager` for installing SDK components
  - Gradle build issue: SDK licenses not accepted; ran `sdkmanager --licenses` with `y` inputs to accept all
  - Next build attempt: `ANDROID_HOME=C:\Users\JeroweTan\scoop\apps\android-clt\current`
  - New error: "Could not find target with hash string 'android-36'" — SDK Platform 36 not fully installed in correct location
  - Build interrupted during SDK platform installation; requires restart
  - **Current State**: Java 21 ✓, Android SDK tools ✓, but platform libraries incomplete. Build stopped mid-configuration phase.
  - **Next Step Tomorrow**: Retry `.\gradlew.bat assembleDebug` from scratch with full Android SDK setup. May need to manually download/install platform libs or use EAS Build (Expo cloud service) instead for faster iteration.

- **[2026-03-17]**: Automation and Build Tools:
  - Created `build-android.bat` in the project root to automate setting `JAVA_HOME`, `ANDROID_HOME`, and running the Gradle build.
  - Verified environment paths for Temurin 21 and `android-clt` SDK.
  - **BUILD SUCCESS**: First APK built successfully (166.45 MB debug APK). Took 1h 7m (includes all dependency downloads + Kotlin compilation).
  - Root cause of slow build: First build downloads ~500MB of dependencies and compiles 100+ Java/Kotlin files. Subsequent builds cached.
  - Optimization: Updated `.bat` to use `--parallel` and `--build-cache` flags for 5-10 min future builds.
  - APK location: `android/app/build/outputs/apk/debug/app-debug.apk`
  - Note: Gradle is CPU-bound (not GPU), so CUDA won't help. SSD speed is the bottleneck.
  - Created `build-android-release.bat` for optimized release builds (~90-110 MB, smaller than debug).
  - Release APK uses `assembleRelease` instead of `assembleDebug` and includes auto-signing.

- **Key Decisions**:
  - NativeWind for styling (Tailwind CSS for React Native)
  - TanStack Query for API caching and data management
  - Bulletproof React folder structure for scalability
  - Local APK build for testing (no EAS login required) — exploring; SDK setup complex on Windows
  - Alternative: Use Expo Go (`npm start` + scan QR) for rapid dev iteration without APK builds

- **[2026-03-18]**: EAS build troubleshooting and success
  - Ran `npx eas build --platform android`, initially got `Cannot get Expo config` fingerprint errors; resolved by regenerating native `android/` via `npx expo prebuild --clean` and ensuring `package-lock.json`/`eas.json` were committed.
  - Adjusted `eas.json` to build an **APK** in `preview` config by setting `android.buildType = "apk"`.
  - Successfully completed EAS build and obtained download link for `.aab` artifact (used for testing/Play Store).

- **[2026-03-18]**: Cookie/auth explanation session
  - Explained that React Native `fetch()` does not auto-store cookies; cookies exist only in the HTTP response headers unless explicitly saved.
  - Recommended `@react-native-cookies/cookies` (or token/JWT auth) for persisting auth cookies in RN.
  - Clarified that cookie storage is domain-scoped, so `CookieManager.get(domain)` reads from native cookie jar (iOS `NSHTTPCookieStorage`, Android cookie store).
  - Confirmed that without cookie manager, cookies are effectively “lost” after fetch.
