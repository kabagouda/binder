import 'material.dart';

class Padding extends Widget {
  final Key? key;
  final EdgeInsetsGeometry? padding;
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
    element.style.padding = '${padding?.top}px ${padding?.right}px ${padding?.bottom}px ${padding?.left}px';

    return element;
  }
}

class EdgeInsetsGeometry {
  final double top;
  final double right;
  final double bottom;
  final double left;
  const EdgeInsetsGeometry({
    this.top = 0,
    this.right = 0,
    this.bottom = 0,
    this.left = 0,
  });
}
// Note : The fllowing implementation of const EdgeInsets.all const are different.
class EdgeInsets extends EdgeInsetsGeometry {
  const EdgeInsets.all(double value) : super(top: value, right: value, bottom: value, left: value);
  const EdgeInsets.only({
    double top = 0,
    double right = 0,
    double bottom = 0,
    double left = 0,
  }) : super(top: top, right: right, bottom: bottom, left: left);
  const EdgeInsets.symmetric({
    double vertical = 0,
    double horizontal = 0,
  }) : super(top: vertical, right: horizontal, bottom: vertical, left: horizontal);
  const EdgeInsets.fromLTRB(double left, double top, double right, double bottom) : super(top: top, right: right, bottom: bottom, left: left);
}