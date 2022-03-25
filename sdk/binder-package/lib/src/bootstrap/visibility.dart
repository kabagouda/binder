import 'bootstrap.dart';

class BootstrapVisibility extends Widget {
  final Key? key;
  final Widget? child;
  final bool visible;
  const BootstrapVisibility({
    this.key,
    this.child,
    this.visible = true,
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
    element.classes.add('visibility-${visible ? 'show' : 'hidden'}');
    return element;
  }
}
