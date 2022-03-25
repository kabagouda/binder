import 'bootstrap.dart';

class Padding extends Widget {
  final Key? key;
  final BootstrapPadding? padding;
  final Widget? child;
  Padding({
    this.key,
    required this.padding,
    this.child,
  });
  @override
  Element toElement() {
    Element element = Element.span();
    if (key != null) {
      element.id = key!.value;
    }
    if (child != null) {
      // because here we have a child that is not required
      element.children.add(child!.toElement());
    }
    if (padding != null) {
      if (padding?.top != null) {
        element.classes.add('pt-${padding!.top?.value}');
      }
      if (padding?.right != null) {
        element.classes.add('pe-${padding!.right?.value}');
      }
      if (padding?.bottom != null) {
        element.classes.add('pb-${padding!.bottom?.value}');
      }
      if (padding?.left != null) {
        element.classes.add('ps-${padding!.left?.value}');
      }
    }

    return element;
  }
}
