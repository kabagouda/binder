import 'bootstrap.dart';

class BootstrapColumn extends Widget {
  final Key? key;
  final List<Widget>? children;
  // final BootstrapMainAxisAlignment? mainAxisAlignment;
  const BootstrapColumn({
    this.key,
    required this.children,
    // this.mainAxisAlignment,
  });
  @override
  Element toElement() {
    Element element = Element.div();
    element.classes.addAll([
      'd-flex',
      'flex-column',
    ]);
    if (key != null) {
      element.id = key!.value;
    }
    if (children != null) {
      for (Widget child in children!) {
        element.children.add(child.toElement());
      }
    }
    // if (mainAxisAlignment != null) {
    //   element.classes.add('align-items-${mainAxisAlignment!.value}');
    // }
    return element;
  }
}

