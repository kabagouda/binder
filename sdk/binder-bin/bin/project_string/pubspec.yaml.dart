String getPubspecYaml() => '''
name: projectName
description: A new Binder project.
version: 1.0.0
# homepage: https://www.example.com
publish_to: 'none' # Remove this line if you wish to publish to pub.dev

environment:
  sdk: ">=2.16.1 <3.0.0"

# Dependencies specify other packages that your package needs in order to work.
# Important : Don't delete binder dependency because it is required for binder to work.
dependencies:
  binder:
    git:
      url: https://github.com/kabagouda/binder.git
      path: sdk/binder-package


dev_dependencies:
  lints: ^1.0.0

# The following section is specific to Binder.
binder:

  # To add assets to your project , add an assets section, like this:
  assets:
    - assets/
  #   - images/a_dot_ham.jpeg

  # To add a custom build step, add a build section, like this:
  build:
    - dart: bin/server.dart
    

''';	