import 'bootstrap.dart';

class BootstrapBorderSpinner extends Widget {
  final Key? key;
  final String? label;
  final BootstrapColor? color;
  final bool? smallSize;
  const BootstrapBorderSpinner({
    this.key,
    this.label,
    this.color,
    this.smallSize = false,
  });
  @override
  Element toElement() {
    Element element = Element.span();
    element.classes.add('spinner-border'); // The most important
    if (key != null) {
      element.id = key!.value;
    }
    if (label != null) {
      element.text = label;
    }
    if (color != null) {
      element.classes.add('text-${color!.value}');
    }
    if (smallSize != null && smallSize == true) {
      element.classes.add('spinner-border-sm');
    }
    return element;
  }
}

class BootstrapGrowingSpinner extends Widget {
  final Key? key;
  final String? label;
  final BootstrapColor? color;
  final bool? smallSize;
  const BootstrapGrowingSpinner({
    this.key,
    this.label,
    this.color= BootstrapColors.primary,
    this.smallSize = false,
  });
  @override
  Element toElement() {
    Element element = Element.span();
    element.classes.add('spinner-grow'); // The most important
    if (key != null) {
      element.id = key!.value;
    }
    if (label != null) {
      element.text = label;
    }
    if (color != null) {
      element.classes.add('text-${color!.value}');
    }
    if (smallSize != null && smallSize == true) {
      element.classes.add('spinner-grow-sm');
    }
    return element;
  }
}
