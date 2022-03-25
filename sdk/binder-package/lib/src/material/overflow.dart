import 'material.dart';
//TODO : Incomplete because i can't see the useful i can test it . Do it later
class Overflow extends Widget {
  final Key? key;
  Widget child;
  OverflowType? overflowType;
  Overflow({
    this.key,
    required this.child,
    this.overflowType,
  });
  @override
  Element toElement() {
    Element element = SpanElement()..style.overflow = overflowType?.value
      ..children.add(child.toElement());
    if (key != null) {
      element.id = key!.value;
    }
    return element;
  }
}

class OverflowType {
  final String value;
  const OverflowType(this.value);
  static const none = OverflowType('none');
  static const auto = OverflowType('auto');
  static const scroll = OverflowType('scroll');
  static const hidden = OverflowType('hidden');
  static const visible = OverflowType('visible');
  static const inherit = OverflowType('inherit');
}
