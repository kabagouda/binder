# Binder Binaries SDK

This package is the entry point for binder commands.
It will be activated globally and then added to the dart SDK.

## Important

To build the final binder-sdk, it will be necessary to compile the bin/binder.dart file for different platforms (exe, etc...) and add it to the different dart-sdk depending on the platform.

Example: `dart compile exe bin/binder.dart -o binder.exe`
