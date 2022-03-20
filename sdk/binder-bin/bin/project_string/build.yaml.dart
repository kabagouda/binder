String getBuildYaml() => '''
targets:
  \$default:
    sources:
      - lib/**
      - build/**
      # Note that it is important to include these in the default target.
      - pubspec.*
      - \$package\$
    builders:
      build_web_compilers:entrypoint:
        generate_for:
        - test/web/**_test.dart
        - build/**.dart
''';
