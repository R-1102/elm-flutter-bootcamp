# Reminder Notification App

An Android-focused Flutter exercise that schedules a local reminder and displays its details.

Developed as part of Elm's Flutter Development Bootcamp.

- **Project Date:** May 14, 2025
- **Technologies:** Dart, Flutter, Flutter Local Notifications, Timezone

## Features

- Enter a reminder title and select a time.
- Schedule a local notification and open its details when tapped.

## Getting Started

Open this folder using Android Studio or VS Code with the Flutter extension. Use a Flutter SDK compatible with the original Dart SDK constraint (`^3.7.2`).

```bash
flutter pub get
flutter run
```

Run on Android and grant notification permission. This exercise schedules one reminder at a time; choosing a past time schedules it for the next day. Android may delay inexact notifications. iOS notification initialization and reboot rescheduling are not implemented.

Run the included basic tests with `flutter test`.
