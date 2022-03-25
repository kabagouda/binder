import 'material.dart';

class Paragraph extends Widget {
  final Key? key;
  Widget child;
  Paragraph({
    this.key,
    required this.child,
  });
  @override
  Element toElement() {
    Element element = Element.html('<p> </p>')
      ..children.add(child.toElement());
    if (key != null) {
      element.id = key!.value;
    }
    return element;
  }
}
