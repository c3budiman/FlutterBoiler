# flutterboiler

A boiler for Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Project Structure

- config => Any Url, API Key, Color, and Configurable data.
- model => Any data model.
- pages =>
  - middleware.dart
  - login_account
    - logic.dart (include api and error handling)
    - components
    - index.dart
- widgets
  - dialogue
  - appbar
  - bottomnavbar
- utils => package and provider
  - api_handler (package dio)
  - provider (storage management sembast)
    - auth
    - dashboard
    - logging
- routes

## List Of Modules

- Login & Register & Logout
- Profile
- Multiple Account / Home
- Notification with websocket and local notification
- Local Auth (pin/pattern/face/fingerprint)
- Offline Checker
- Appbar Examples
- Bottom Navbar
- Custom Dialog
- Refresh On Scroll
