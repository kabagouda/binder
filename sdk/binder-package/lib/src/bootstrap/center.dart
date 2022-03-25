import 'bootstrap.dart';

class BootstrapCenter extends Widget {
  final Key? key;
  final Widget? child;
  const BootstrapCenter({
    this.key,
    this.child,
  });
  @override
  Element toElement() {
    Element element = Element.div();
    if (key != null) {
      element.id = key!.value;
    }
    if (child != null) {
      element.children.add(child!.toElement());
    }
    element.classes.add('text-center');
    return element;
  }
}
