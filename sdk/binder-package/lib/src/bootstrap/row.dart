import 'bootstrap.dart';

class BootstrapRow extends Widget {
  final Key? key;
  final List<Widget>? children;
  final BootstrapMainAxisAlignment? mainAxisAlignment;

  const BootstrapRow({
    this.key,
    required this.children,
    this.mainAxisAlignment,
  });
  @override
  Element toElement() {
    Element element = Element.div();
    element.classes.add('d-flex');
    if (key != null) {
      element.id = key!.value;
    }
    if (children != null) {
      for (Widget child in children!) {
        element.children.add(child.toElement());
      }
    }
    if (mainAxisAlignment != null) {
      element.classes.add('justify-content-${mainAxisAlignment!.value}');
    }
    return element;
  }
}

class BootstrapMainAxisAlignment {
  final String value;
  const BootstrapMainAxisAlignment._(this.value);

  static const BootstrapMainAxisAlignment start =
      BootstrapMainAxisAlignment._('start');
  static const BootstrapMainAxisAlignment end =
      BootstrapMainAxisAlignment._('end');
  static const BootstrapMainAxisAlignment center =
      BootstrapMainAxisAlignment._('center');
  static const BootstrapMainAxisAlignment spaceBetween =
      BootstrapMainAxisAlignment._('between');
  static const BootstrapMainAxisAlignment spaceAround =
      BootstrapMainAxisAlignment._('around');
}


