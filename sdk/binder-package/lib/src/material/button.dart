import 'material.dart';

class ElevatedButton extends Widget {
  final Key? key;
  final Widget child;
  final VoidCallback onPressed;
  final ElevatedButtonStyle? style;
  final ButtonGridOption? gridOption;
  const ElevatedButton({
    this.key,
    required this.child,
    required this.onPressed,
    this.style = const ElevatedButtonStyle(backgroundColor: ThemeColor.primary),
    this.gridOption,
  });

  @override
  Element toElement() {
    Element element = AnchorElement();
    if (key != null) {
      element.id = key!.value;
    }
    element
      ..style.color = 'white' // for default text color
      ..classes.add('btn')
      ..onClick.listen((_) => onPressed())
      ..children.add(child.toElement());
    if (gridOption != null) {
      element.classes.add('btn-${gridOption?.value}');
    }
    if (style?.backgroundColor != null) {
      element.style.backgroundColor = '#${style?.backgroundColor?.getHex()}';
    }
    if (style?.width != null) {
      element.style.width = '${style?.width}px';
    }

    return element;
  }
}

class OutlinedButton extends Widget {
  final Key? key;
  final Widget child;
  final VoidCallback onPressed;
  final OutlinedButtonStyle? style;
  final ButtonGridOption? gridOption;
  const OutlinedButton({
    this.key,
    required this.child,
    required this.onPressed,
    this.style = const OutlinedButtonStyle(color: ThemeColor.primary),
    this.gridOption,
  });

  @override
  Element toElement() {
    Element element = AnchorElement();
    if (key != null) {
      element.id = key!.value;
    }
    element
      ..classes.add('btn')
      ..onClick.listen((_) =>
          onPressed()) // to handled onPressed (event) associated to the button
      ..children.add(child.toElement());
    // gridOption
    if (gridOption != null) {
      element.classes.add('btn-${gridOption?.value}');
    }
    if (style?.color != null) {
      element.style.background = 'white';
      element.style.borderColor = '#${style?.color?.getHex()}';
      element.style.color = '#${style?.color?.getHex()}';
    }
    if (style?.hoverColor != false) {
      element
        ..onMouseOver.listen((event) {
          element.style.background = '#${style?.color?.getHex()}';
          element.style.color = 'white';
        })
        ..onMouseOut.listen((event) {
          element.style.background = 'white';
          element.style.borderColor = '#${style?.color?.getHex()}';
          element.style.color = '#${style?.color?.getHex()}';
        });
    }
    //others
    // if (style?.backgroundColor != null) {
    //   element.style.backgroundColor = '#${style?.backgroundColor?.getHex()}';
    // }
    if (style?.width != null) {
      element.style.width = '${style?.width}px';
    }
    // if (style?.borderColor != null) {
    //   element.style.borderColor = '#${style?.borderColor?.getHex()}';
    // }
    // complex things to handle
    // if (style?.hoverColor != null) {
    //   element
    //     ..onMouseOver.listen((event) {
    //       element.style.background = '#${style?.hoverColor?.getHex()}';
    //       if (style?.hoverTextColor != null) {
    //         element.style.color = '#${style?.hoverTextColor?.getHex()}';
    //       }
    //     })
    //     ..onMouseOut.listen((event) {
    //       element.style.background = '#${style?.backgroundColor?.getHex()}';
    //        if (style?.hoverTextColor != null) {
    //         element.style.color = '#${style?.hoverTextColor?.getHex()}';
    //       }
    //     });
    // }
    return element;
  }
}

class ButtonGridOption extends GridOption {
  const ButtonGridOption(String value) : super(value);
}

class ButtonGridOptions {
  static const ButtonGridOption small = ButtonGridOption('sm');
  static const ButtonGridOption large = ButtonGridOption('lg');
}

class TextButton extends Widget {
  final Key? key;
  final Widget child;
  final VoidCallback onPressed;
  final TextButtonStyle? style;
  const TextButton({
    this.key,
    required this.child,
    required this.onPressed,
    this.style = const TextButtonStyle(color: ThemeColor.primary),
  });

  @override
  Element toElement() {
    Element element = Element.a();
    if (key != null) {
      element.id = key!.value;
    }
    element
      ..classes.add('btn')
      ..onClick.listen((_) => onPressed())
      ..children.add(child.toElement());
    if (style?.color != null) {
      element.style.color = '#${style?.color?.getHex()}';
      element.style.fontWeight = 'bold';
    }
    return element;
  }
}

class ElevatedButtonStyle {
  final Color? backgroundColor;
  final double? width;
  const ElevatedButtonStyle({
    this.backgroundColor,
    this.width,
  });
}

class OutlinedButtonStyle {
  final Color? color;
  final bool? hoverColor;
  // final Color? backgroundColor;
  // final Color? hoverColor;
  // /// hoverTextColor is the text color when the mouse is over the button
  // /// (not the default text color) . It should be set with hoverColor
  // final Color? hoverTextColor;
  final double? width;
  // final Color? borderColor;
  const OutlinedButtonStyle({
    this.color,
    this.hoverColor = true,
    // this.backgroundColor,
    // this.hoverColor,
    // this.hoverTextColor,
    this.width,
    // this.borderColor,
  });
}

class TextButtonStyle {
  final Color? color;
  const TextButtonStyle({
    this.color,
  });
}

//----------------- button groups
class ButtonGroup extends Widget {
  final Key? key;
  final List<Widget> children;
  const ButtonGroup({
    this.key,
    required this.children,
  });

  @override
  Element toElement() {
    Element element = DivElement();
    if (key != null) {
      element.id = key!.value;
    }
    element
      ..classes.add('btn-group')
      ..children.addAll(children.map((child) => child.toElement()));
    return element;
  }
}

//------------------Testing button just for testing------------------
class TestButton extends Widget {
  final Widget child;
  final VoidCallback onPressed;
  final ElevatedButtonStyle? style;
  const TestButton({
    required this.child,
    required this.onPressed,
    this.style,
  });

  @override
  Element toElement() {
    Element element = AnchorElement();
    // ..style.color = 'white' // for default text color
    element
      ..classes.add('btn')
      ..style.borderColor = 'green'
      ..onMouseOver.listen((event) {
        element.style.background = '#0000FF';
      })
      ..onMouseOut.listen((event) {
        element.style.background = 'white';
      })
      ..onClick.listen((event) {
        element.style.background = 'green';
        onPressed();
      })
      // ..style.width= '300px'
      ..onClick.listen((_) => onPressed())
      ..children.add(child.toElement());
    if (style?.backgroundColor != null) {
      element.style.backgroundColor = '#${style?.backgroundColor?.getHex()}';
    }
    if (style?.width != null) {
      element.style.width = '${style?..width}px';
    }

    return element;
  }
}
