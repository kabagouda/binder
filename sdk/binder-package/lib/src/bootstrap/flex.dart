import 'bootstrap.dart';

class BootstrapFlex extends Widget {
  final Key? key;
  final List<Widget>? children;
  final bool isInline;
  final BootstrapFlexHorizontalDirention? horizontalDirention;
  final BootstrapFlexVerticalDirention? verticalDirention;
  // final bool isVertical;
  // final bool isFluid;

  const BootstrapFlex({
    this.key,
    this.children,
    this.isInline = false,
    this.horizontalDirention,
    this.verticalDirention,
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
    if (isInline) {
      element.classes..remove('d-flex')..add('d-inline-flex');
    }
    return element;
  }
}

class BootstrapFlexVerticalDirention {
}

class BootstrapFlexHorizontalDirention {
}
