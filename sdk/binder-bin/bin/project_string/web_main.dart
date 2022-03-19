String getWebMain() => '''
import 'dart:html' ;

void main() {
  document.body?.children.addAll([
    DivElement()..text = 'Hello World, from Dart!',
  ]);

''';	


