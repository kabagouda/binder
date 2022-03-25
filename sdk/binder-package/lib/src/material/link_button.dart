import 'material.dart';

class LinkButton extends Widget {
  final Key? key;
  Widget child;
  Uri? url;
  LinkButton({
    this.key,
    required this.url,
    required this.child,

  });
  @override
  Element toElement() {
    Element element = AnchorElement(href: url?.path)..children.add(child.toElement());
    if (key != null) {
      element.id = key!.value;
    }
    return element;
  }
}
