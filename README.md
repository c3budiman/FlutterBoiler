# flutterboiler

A boiler for Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Project Structure

Folder Structure :

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

Modules :

- Login
- Register
- Profile include Logout
- Home
- Multiple Account

Unit testing : Test render screen only
