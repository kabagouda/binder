import 'bootstrap.dart';

class BootstrapText extends Widget {
  // Problem with key
  final Key? key;
  final String data;
  final BootstrapTextStyle? style;
  BootstrapText(
    this.data, {
    this.key,
    this.style,
  });
  @override
  Element toElement() {
    Element element = Element.span();
    if (key != null) {
      element.id = key!.value;
    }
    element.text = data; // the text is the data
    if (style != null) {
      if (style?.color != null) {
        element.classes.add('text-${style!.color!.value}');
      }
      // if (style?.fontsize != null) {
      //   element.classes.add('text-${style!.fontsize!.value}');
      // }
    }

    return element;
  }
}

//---------------Others necessary class ---------------
class BootstrapTextStyle {
  // final String? fontFamily;
  // final double? fontSize;
  final BootstrapColor? color;
  BootstrapTextStyle({
    // this.fontFamily,
    // this.fontSize,
    this.color,
  });
}
