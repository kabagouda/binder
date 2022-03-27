import 'dart:html';
import 'key.dart';
import 'widget.dart';


class Divider extends Widget {
  final Key? key;
  const Divider({
    this.key,
  });
  @override
  Element toElement() {
    Element element = Element.hr();
    return element;
  }
}
