import 'bootstrap.dart';

class BootstrapNavBar extends Widget {
  final Key? key;
  final Widget? child;
  const BootstrapNavBar({
    this.key,
    this.child,
  });
  @override
  Element toElement() {
    Element element = Element.div();
    element.classes.add('text-center');
    if (key != null) {
      element.id = key!.value;
    }
    if (child != null) {
      element.children.add(child!.toElement());
    }
    return element;
  }
}
