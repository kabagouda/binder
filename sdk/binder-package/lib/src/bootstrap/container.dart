import 'bootstrap.dart';

class BootstrapContainer extends Widget {
  final Key? key;
  final Widget? child;
  final double? width;
  final double? height;
  final BootstrapColor? color;
  final BootstrapPadding? padding;
  final BootstrapMargin? margin;
  final BootstrapBorder? border;
  // final BootstrapBoxShadow? boxShadow;

  BootstrapContainer(
      {this.key,
      this.child,
      this.width,
      this.height,
      this.color,
      this.padding,
      this.border,
      this.margin});

  @override
  Element toElement() {
    Element element = Element.div();
    element.classes.add('container'); // Most important
    // key
    if (key != null) {
      element.id = key!.value;
    }
    // child
    if (child != null) {
      element.children.add(child!.toElement());
    }
    // width
    if (width != null) {
      element.style.width = '${width}px';
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
    // padding
    if (padding != null) {
      padding?.addToElement(element); // Special method
    }
    // margin
    if (margin != null) {
      margin?.addToElement(element); // Special method
    }
    // border
    if (border != null) {
      border?.addToElement(element); // Special method
    }

    return element;
  }
}

//----------------------------------- 1- BootstrapColor class-----------------------------------
class BootstrapColor {
  final String value;
  // private constructor
  const BootstrapColor._(this.value);
}

class BootstrapColors {
  static const BootstrapColor primary = BootstrapColor._('primary');
  static const BootstrapColor secondary = BootstrapColor._('secondary');
  static const BootstrapColor success = BootstrapColor._('success');
  static const BootstrapColor danger = BootstrapColor._('danger');
  static const BootstrapColor warning = BootstrapColor._('warning');
  static const BootstrapColor info = BootstrapColor._('info');
  static const BootstrapColor light = BootstrapColor._('light');
  static const BootstrapColor dark = BootstrapColor._('dark');
  static const BootstrapColor white = BootstrapColor._('white');
  static const BootstrapColor black = BootstrapColor._('black');
  static const BootstrapColor link = BootstrapColor._('link');
  static const BootstrapColor transparent = BootstrapColor._('transparent');
}

//-----------------------------------2- BootstrapPadding class-----------------------------------
// BootsrapPadding class for padding-top, padding-right, padding-bottom, padding-left
class BootstrapPadding {
  final BootstrapPaddingOption? top;
  final BootstrapPaddingOption? right;
  final BootstrapPaddingOption? bottom;
  final BootstrapPaddingOption? left;
  const BootstrapPadding({
    this.top,
    this.right,
    this.bottom,
    this.left,
  });
  factory BootstrapPadding.all(BootstrapPaddingOption padding) {
    return BootstrapPadding(
      top: padding,
      right: padding,
      bottom: padding,
      left: padding,
    );
  }
  factory BootstrapPadding.only(
      BootstrapPaddingOption? top,
      BootstrapPaddingOption? right,
      BootstrapPaddingOption? bottom,
      BootstrapPaddingOption? left) {
    return BootstrapPadding(
      top: top,
      right: right,
      bottom: bottom,
      left: left,
    );
  }
  void addToElement(Element element) {
    if (top != null) {
      element.classes.add('pt-${top?.value}');
    }
    if (right != null) {
      element.classes.add('pe-${right?.value}');
    }
    if (bottom != null) {
      element.classes.add('pb-${bottom?.value}');
    }
    if (left != null) {
      element.classes.add('ps-${left?.value}');
    }
  }
}

class BootstrapPaddingOption {
  final String value;
  const BootstrapPaddingOption(this.value);
}

class BootstrapPaddingOptions {
  static const BootstrapPaddingOption p0 = BootstrapPaddingOption('0');
  static const BootstrapPaddingOption p1 = BootstrapPaddingOption('1');
  static const BootstrapPaddingOption p2 = BootstrapPaddingOption('2');
  static const BootstrapPaddingOption p3 = BootstrapPaddingOption('3');
  static const BootstrapPaddingOption p4 = BootstrapPaddingOption('4');
  static const BootstrapPaddingOption p5 = BootstrapPaddingOption('5');
  static const BootstrapPaddingOption pAuto = BootstrapPaddingOption('auto');
}

//-----------------------------------3- BootstrapMargin class-----------------------------------
// BootsrapMargin class for margin-top, margin-right, margin-bottom, margin-left
class BootstrapMargin {
  final BootstrapMarginOption? top;
  final BootstrapMarginOption? right;
  final BootstrapMarginOption? bottom;
  final BootstrapMarginOption? left;
  const BootstrapMargin({
    this.top,
    this.right,
    this.bottom,
    this.left,
  });
  factory BootstrapMargin.all(BootstrapMarginOption margin) {
    return BootstrapMargin(
      top: margin,
      right: margin,
      bottom: margin,
      left: margin,
    );
  }
  factory BootstrapMargin.only(
      BootstrapMarginOption? top,
      BootstrapMarginOption? right,
      BootstrapMarginOption? bottom,
      BootstrapMarginOption? left) {
    return BootstrapMargin(
      top: top,
      right: right,
      bottom: bottom,
      left: left,
    );
  }
  void addToElement(Element element) {
    if (top != null) {
      element.classes.add('mt-${top?.value}');
    }
    if (right != null) {
      element.classes.add('me-${right?.value}');
    }
    if (bottom != null) {
      element.classes.add('mb-${bottom?.value}');
    }
    if (left != null) {
      element.classes.add('ms-${left?.value}');
    }
  }
}

class BootstrapMarginOption {
  final String value;
  const BootstrapMarginOption(this.value);
}

class BootstrapMarginOptions {
  static const BootstrapMarginOption m0 = BootstrapMarginOption('0');
  static const BootstrapMarginOption m1 = BootstrapMarginOption('1');
  static const BootstrapMarginOption m2 = BootstrapMarginOption('2');
  static const BootstrapMarginOption m3 = BootstrapMarginOption('3');
  static const BootstrapMarginOption m4 = BootstrapMarginOption('4');
  static const BootstrapMarginOption m5 = BootstrapMarginOption('5');
  static const BootstrapMarginOption mAuto = BootstrapMarginOption('auto');
}

//-----------------------------------4- BootstrapBorder class-----------------------------------
class BootstrapBorder {
  final BootstrapBorderWidth? width;
  final BootstrapColor? color;
  final BootstrapBorderRadiusOption? radius;
  const BootstrapBorder({
    this.width,
    this.color,
    this.radius,
  });

  void addToElement(Element element) {
    if (width != null) {
      if (width?.top != null) {
        element.classes.add('border-top-${width?.top?.value}');
      }
      if (width?.right != null) {
        element.classes.add('border-end-${width?.right?.value}');
      }
      if (width?.bottom != null) {
        element.classes.add('border-bottom-${width?.bottom?.value}');
      }
      if (width?.left != null) {
        element.classes.add('border-start-${width?.left?.value}');
      }
    }
    if (color != null) {
      element.classes.add('border-${color?.value}');
    }
    if (radius != null) {
      element.classes.add(
          '${radius?.value}'); // here beacause it can also add 'rounded'itself
    }
  }
}

//-----------------------------------4-1- BootstrapBorderWidth class-----------------------------------
class BootstrapBorderWidth {
  final BootstrapBorderWidthOption? top;
  final BootstrapBorderWidthOption? right;
  final BootstrapBorderWidthOption? bottom;
  final BootstrapBorderWidthOption? left;
  const BootstrapBorderWidth({
    this.top,
    this.right,
    this.bottom,
    this.left,
  });
}

class BootstrapBorderWidthOption {
  final String value;
  const BootstrapBorderWidthOption(this.value);
}

class BootstrapBorderWidthOptions {
  static const BootstrapBorderWidthOption width0 =
      BootstrapBorderWidthOption('0');
  static const BootstrapBorderWidthOption width1 =
      BootstrapBorderWidthOption('1');
  static const BootstrapBorderWidthOption width2 =
      BootstrapBorderWidthOption('2');
  static const BootstrapBorderWidthOption width3 =
      BootstrapBorderWidthOption('3');
  static const BootstrapBorderWidthOption width4 =
      BootstrapBorderWidthOption('4');
  static const BootstrapBorderWidthOption width5 =
      BootstrapBorderWidthOption('5');
  static const BootstrapBorderWidthOption widthAuto =
      BootstrapBorderWidthOption('auto');
}

//-----------------------------------4-2- BootstrapBorderRadiusOption class-----------------------------------

class BootstrapBorderRadiusOption {
  final String? value;
  const BootstrapBorderRadiusOption(this.value);
}

class BootstrapBorderRadiusOptions {
  static const BootstrapBorderRadiusOption rounded =
      BootstrapBorderRadiusOption('rounded');
  static const BootstrapBorderRadiusOption roundedTop =
      BootstrapBorderRadiusOption('rounded-top');
  static const BootstrapBorderRadiusOption roundedRight =
      BootstrapBorderRadiusOption('rounded-end');
  static const BootstrapBorderRadiusOption roundedBottom =
      BootstrapBorderRadiusOption('rounded-bottom');
  static const BootstrapBorderRadiusOption roundedLeft =
      BootstrapBorderRadiusOption('rounded-start');
  static const BootstrapBorderRadiusOption roundedCircle =
      BootstrapBorderRadiusOption('rounded-circle');
  static const BootstrapBorderRadiusOption rounded0 =
      BootstrapBorderRadiusOption('rounded-0');
  static const BootstrapBorderRadiusOption rounded1 =
      BootstrapBorderRadiusOption('rounded-1');
  static const BootstrapBorderRadiusOption rounded2 =
      BootstrapBorderRadiusOption('rounded-2');
  static const BootstrapBorderRadiusOption rounded3 =
      BootstrapBorderRadiusOption('rounded-3');
}
