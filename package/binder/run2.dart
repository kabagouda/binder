import 'dart:io';

import 'package:yaml/yaml.dart';
main() {
  var yamlString = File('C:/Users/Kab/Desktop/Binder/package/binder/pubspec.yaml')
      .readAsStringSync();
  var yamlMap = loadYaml(yamlString);
  print(yamlMap['executables']);
}
