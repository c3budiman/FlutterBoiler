# Flutter Boiler

[![CodeFactor](https://www.codefactor.io/repository/github/c3budiman/flutterboiler/badge)](https://www.codefactor.io/repository/github/c3budiman/flutterboiler)
[![Build](https://github.com/c3budiman/FlutterBoiler/actions/workflows/testing.yml/badge.svg)](https://github.com/c3budiman/FlutterBoiler/actions/workflows/testing.yml)

A boiler template for Flutter project.

## Getting Started

A few resources to get you started:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Auto Update Depedencies
- Install Pubspec Assist on Visual Studio Code
- Press Command + Shift + P in pubspec.yaml file
- Search for Add/Update depedencies then click it
- Input the package name you want to add or update

Example: ```awesome_notifications, connectivity, crypto, cupertino_icons, dio, email_validator, flutter_spinkit, get_it, local_auth, path_provider, percent_indicator, photo_view, pin_code_fields, provider, sembast, shimmer, web_socket_channel```

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
- Notification with Firebase and Local Notification
- Local Auth (pin/pattern/face/fingerprint)
- Offline Checker
- Appbar Examples
- Bottom Navbar
- Custom Dialog
- Refresh On Scroll


## Todo
- Add Updater and Maintenance page,
- Add Feature develop mode, when tapped on logo 10 times. so base url, for api can have both development and production.