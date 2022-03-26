import 'bootstrap.dart';

class BootstrapElevatedButton extends Widget {
  final Key? key;
  final Widget child;
  final VoidCallback onPressed;
  final BootstrapButtonStyle? style;
  final bool? disabled;
  const BootstrapElevatedButton({
    this.key,
    required this.child,
    required this.onPressed,
    this.style,
    this.disabled = false,
  });

  @override
  Element toElement() {
    Element element = AnchorElement();
    element.classes.add('btn'); // Most important
    if (key != null) {
      element.id = key!.value;
    }
    element.children.add(child
        .toElement()); // because with buttons child and onPressed are required
    element.onClick.listen((event) {
      if (disabled == false) { // if disabled is true, then the button is disabled
        onPressed(); // because with buttons child and onPressed are required
      }
    });
    if (style != null) {
      if (style?.color != null) {
        // to avoid light color text when background is also light
        if (style?.color?.value == 'light') {
          element.classes.add('text-dark');
        } else {
          element.classes.add('text-white');
        }
        element.classes.add('btn-${style!.color!.value}');
      }
      if (style?.size != null) {
        element.classes.add('btn-${style!.size!.value}');
      }
    }
    if (disabled != null) {
      if (disabled == true) {
        element.classes.add('disabled');
      }
    }
    return element;
  }
}

class BootstrapButtonStyle {
  final BootstrapColor? color;
  final BootstrapButtonSizeOption? size;
  const BootstrapButtonStyle({
    this.color = BootstrapColors.primary,
    this.size,
  });
}

class BootstrapButtonSizeOption {
  final String value;
  const BootstrapButtonSizeOption(this.value);
}

class BootstrapButtonSizeOptions {
  static const small = BootstrapButtonSizeOption('sm');
  static const medium = BootstrapButtonSizeOption('md');
  static const large = BootstrapButtonSizeOption('lg');
}

//---------------------------------Others buttons

class OutlinedButton extends Widget {
  final Key? key;
  final Widget child;
  final VoidCallback onPressed;
  final BootstrapButtonStyle? style;
  const OutlinedButton({
    this.key,
    required this.child,
    required this.onPressed,
    this.style,
  });

  @override
  Element toElement() {
    Element element = AnchorElement();
    element.classes.add('btn'); // Most important
    element.children.add(child
        .toElement()); // because with buttons child and onPressed are required
    if (key != null) {
      element.id = key!.value;
    }
    if (style != null) {
      if (style?.color != null) {
        // to avoid light color text when background is also light
        if (style?.color?.value == 'light') {
          element.classes.add('text-dark');
        } else {
          element.classes.add('text-white');
        }
        element.classes.add('btn-outline-${style!.color!.value}');
      }
    }
    if (style?.size != null) {
      element.classes.add('btn-${style!.size!.value}');
    }
    return element;
  }
}
