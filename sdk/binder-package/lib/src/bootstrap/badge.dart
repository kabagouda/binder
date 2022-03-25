import 'bootstrap.dart';

class BootstrapBadge extends Widget {
  final Key? key;
  final Widget? child;
  final BootstrapColor? color;
  final bool? pillBadge;
  const BootstrapBadge({
    this.key,
    this.child,
    this.color,
    this.pillBadge = false,
  });
  @override
  Element toElement() {
    Element element = Element.span();
    element.classes.add('badge');
    if (key != null) {
      element.id = key!.value;
    }
    if (child != null) {
      element.children.add(child!.toElement());
    }
    if (color != null) {
      element.classes.add('bg-${color!.value}');
    }
    if (pillBadge != null && pillBadge == true) {
      element.classes.add('rounded-pill');
    }
    return element;
  }
}
