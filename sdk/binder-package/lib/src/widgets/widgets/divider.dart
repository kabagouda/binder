import 'dart:html';
import 'key.dart';
import 'widget.dart';


class BootstrapDivider extends Widget {
  final Key? key;
  const BootstrapDivider({
    this.key,
  });
  @override
  Element toElement() {
    Element element = Element.hr();
    return element;
  }
}
