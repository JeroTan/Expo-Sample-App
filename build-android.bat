@echo off
:: Set environment variables for this session
set "JAVA_HOME=C:\Users\JeroweTan\scoop\apps\temurin21-jdk\current"
set "ANDROID_HOME=C:\Users\JeroweTan\scoop\apps\android-clt\current"
set "PATH=%JAVA_HOME%\bin;%ANDROID_HOME%\cmdline-tools\latest\bin;%ANDROID_HOME%\platform-tools;%PATH%"

echo ---------------------------------------
echo Building Monster Hunter View (Android)
echo JAVA_HOME: %JAVA_HOME%
echo ANDROID_HOME: %ANDROID_HOME%
echo ---------------------------------------

:: Ensure required SDK platforms are installed
echo Checking/Installing required Android SDK components...
call "%ANDROID_HOME%\cmdline-tools\latest\bin\sdkmanager.bat" --sdk_root="%ANDROID_HOME%" "platforms;android-36" "build-tools;36.0.0"

:: Navigate to the android folder
cd /d "%~dp0monster-hunter-view\android"

:: Run the build with optimizations
call gradlew.bat assembleDebug --parallel --build-cache

echo.
if %ERRORLEVEL% EQU 0 (
    echo [SUCCESS] APK built at: monster-hunter-view\android\app\build\outputs\apk\debug\app-debug.apk
) else (
    echo [ERROR] Build failed.
)

pause
