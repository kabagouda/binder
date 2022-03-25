import 'bootstrap.dart';

class BootstrapFluidContainer extends Widget {
  final Key? key;
  final Widget? child;
  final double? height;
  final BootstrapColor? color;
  final BootstrapBorder? border;
  // final BootstrapBoxShadow? boxShadow;

  BootstrapFluidContainer({
    this.key,
    this.child,
    this.color,
    this.height,
    this.border,
  });

  @override
  Element toElement() {
    Element element = Element.div();
    element.classes.add('container-fluid'); // Most important
    // key
    if (key != null) {
      element.id = key!.value;
    }
    // child
    if (child != null) {
      element.children.add(child!.toElement());
    }
    // height
    if (height != null) {
      element.style.height = '${height}px';
    }
    // color
    if (color != null) {
      // to avoid light color text when background is also light
      if (color?.value == 'light') {
        element.classes.add('text-dark');
      } else {
        element.classes.add('text-white');
      }
      element.classes.add('bg-${color?.value}');
    }
    // border
    if (border != null) {
      border?.addToElement(element); // Special method
    }

    return element;
  }
}
