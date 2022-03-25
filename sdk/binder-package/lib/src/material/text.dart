import 'material.dart';

class Text extends Widget {
  // Problem with key
  final Key? key;
  final String data;
  final TextStyle? style;
  Text(
    this.data, {
    this.key,
    this.style,
  })
  ;
  @override
  Element toElement() {
    Element element = Element.span();
    if (key != null) {
      element.id = key!.value;
    }
    element.text = data;

    style?.build(element); // To build the style
    return element;
  }
}

//---------------Others necessary class ---------------
class TextStyle {
  final String? fontFamily;
  final double? fontSize;
  final Color? color;
  final Color? backgroundColor;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final TextDecoration? textDecoration;
  final TextDecorationStyle? textDecorationStyle;
  final double? height;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? lineHeight;
  final List<Shadow>? shadow;
  final TextOverflow? overflow;
  const TextStyle(
      {this.fontFamily,
      this.fontSize,
      this.color,
      this.backgroundColor,
      this.fontWeight,
      this.fontStyle,
      this.textDecoration,
      this.textDecorationStyle,
      this.height,
      this.letterSpacing,
      this.wordSpacing,
      this.lineHeight,
      this.shadow,
      this.overflow});
  void build(Element element) {
    if (fontFamily != null) {
      element.style.fontFamily = fontFamily;
    }
    if (fontSize != null) {
      element.style.fontSize = '${fontSize}px';
    }
    if (color != null) {
      element.style.color = '#${color?.getHex()}';
    }
    if (backgroundColor != null) {
      element.style.backgroundColor = '#${backgroundColor?.getHex()}';
    }
    if (fontWeight != null) {
      element.style.fontWeight = fontWeight?.value;
    }
    if (fontStyle != null) {
      element.style.fontStyle = fontStyle?.value;
    }
    if (textDecoration != null) {
      element.style.textDecoration = textDecoration?.value;
    }
    if (textDecorationStyle != null) {
      element.style.textDecorationStyle = textDecorationStyle!.value!;
    }
    if (height != null) {
      element.style.height = '$height%';
    }
    if (letterSpacing != null) {
      element.style.letterSpacing = '$letterSpacing';
    }
    if (wordSpacing != null) {
      element.style.wordSpacing = '$wordSpacing';
    }
    if (lineHeight != null) {
      element.style.lineHeight = '$lineHeight';
    }
    if (shadow != null) {
      String _shadowString = '';
      for (var i = 0; i < shadow!.length; i++) {
        _shadowString +=
            '${shadow![i].offset?.dx}px ${shadow![i].offset?.dy}px ${shadow![i].blurRadius}px #${shadow![i].color?.getHex()},';
      }
      element.style.textShadow =
          _shadowString.substring(0, _shadowString.length - 1);
    }
    if (overflow != null) {
      element.style.overflow = overflow?.value;
    }
  }
}

class TextOverflow {
  //TODO : Incomplete because i can't see the useful i can test it . Do it later
  final String value;
  const TextOverflow(this.value);
  static const TextOverflow ellipsis = TextOverflow('ellipsis');
  static const TextOverflow clip = TextOverflow('clip');
  static const TextOverflow fade = TextOverflow('fade');
}

/// A shadow cast by a box.
/// A box shadow is defined by a [blurRadius], a [spreadRadius], a [color] and a
/// [offset].
/// The [color] is a required property.
/// The [offset] is a required property.
/// The [blurRadius] is a required property.
class Shadow {
  /// The shadow's offset.
  /// A null value for [offset] means no offset.
  /// The [offset] is relative to the casting element.
  /// A negative [offset] will place the shadow outside the casting element.
  /// A positive [offset] will place the shadow inside the casting element.
  /// The [offset] must be a positive distance from the casting element.
  /// The [offset] defaults to [Offset.zero].
  Offset? offset;

  /// The shadow's blur radius.
  /// Must be non-negative.
  /// The standard deviation of the Gaussian to convolve with the shadow's shape.
  /// The default value is 0.
  double? blurRadius;

  /// The shadow's color.
  /// The default value is fully opaque black.
  /// If [color] is transparent, the shadow has no effect.
  /// This value is required.
  Color? color;

  /// Construct a shadow.
  Shadow(
      {this.offset = Offset.zero,
      this.blurRadius = 0.0,
      this.color = Colors.black});
}

class Offset {
  final double? dx;
  final double? dy;
  const Offset(this.dx, this.dy);
  static const Offset zero = Offset(0.0, 0.0);
}

class TextDecorationStyle {
  final String? value;
  //TODO : textunderlineColor , etc ...
  const TextDecorationStyle(this.value);
  static const TextDecorationStyle solid = TextDecorationStyle('solid');
  static const TextDecorationStyle double = TextDecorationStyle('double');
  static const TextDecorationStyle dashed = TextDecorationStyle('dashed');
  static const TextDecorationStyle dotted = TextDecorationStyle('dotted');
  static const TextDecorationStyle wavy = TextDecorationStyle('wavy');
}

class TextDecoration {
  final String? value;
  const TextDecoration(this.value);
  static const TextDecoration none = TextDecoration('none');
  static const TextDecoration underline = TextDecoration('underline');
  static const TextDecoration overline = TextDecoration('overline');
  static const TextDecoration lineThrough = TextDecoration('line-through');
}

class FontStyle {
  final String value;
  const FontStyle(this.value);
  static const FontStyle normal = FontStyle('normal');
  static const FontStyle italic = FontStyle('italic');
}

class FontWeight {
  final String value;
  const FontWeight(this.value);
  static const FontWeight normal = FontWeight('normal');
  static const FontWeight bold = FontWeight('bold');
  static const FontWeight bolder = FontWeight('bolder');
  static const FontWeight lighter = FontWeight('lighter');
  static const FontWeight w100 = FontWeight('100');
  static const FontWeight w200 = FontWeight('200');
  static const FontWeight w300 = FontWeight('300');
  static const FontWeight w400 = FontWeight('400');
  static const FontWeight w500 = FontWeight('500');
  static const FontWeight w600 = FontWeight('600');
  static const FontWeight w700 = FontWeight('700');
  static const FontWeight w800 = FontWeight('800');
  static const FontWeight w900 = FontWeight('900');
}

class TextTheme {
  // final String? value;
  // const TextTheme(this.value);

  // static const  TextStyle? display1 = TextTheme('display1');
  // static const TextStyle? display2 = TextTheme('display2');

  static const headline1 = TextStyle(
    fontSize: 96.0,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
  );
  static const headline2 = TextStyle(
    fontSize: 60.0,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
  );
  static const headline3 = TextStyle(
    fontSize: 48.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.0,
  );
  static const headline4 = TextStyle(
    fontSize: 34.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );
  static const headline5 = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.0,
  );
  static const headline6 = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  );
  static const subtitle1 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  );
  static const subtitle2 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  );
  static const body1 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  );
  static const body2 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );
  static const button = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
  );
  static const caption = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  );
  static const overline = TextStyle(
    fontSize: 10.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
  );
}
