// ignore_for_file: file_names

import 'bootstrap.dart';

// BootstrapAlignCenter adds margin left and right auto to the widget
class BootstrapAlignCenter extends Widget {
  final Key? key;
  final Widget? child;
  const BootstrapAlignCenter({
    this.key,
    this.child,
  });
  @override
  Element toElement() {
    Element element = Element.span();
    if (key != null) {
      element.id = key!.value;
    }
    if (child != null) {
      element.children.add(child!.toElement());
    }
    element.classes.add('mx-auto');
    return element;
  }
}
