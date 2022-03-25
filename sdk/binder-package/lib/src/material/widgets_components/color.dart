class Color{
  final int value;
  /// Returns the color in ARGB format .
  /// The format is AARRGGBB.
  /// The most significant byte is alpha.
  /// The next significant byte is red.
  /// The next significant byte is green.
  /// The next significant byte is blue.
  /// Examples:
  /// ```dart	
  /// Color(0xFF00FF00) is opaque green.
  /// Color(0x7F00FF00) is 50% transparent green.
  /// Color(0x00FF00FF) is fully transparent green.
  /// ```
  const Color(this.value);

  /// Returns the color from RGBA.
  /// 
  /// [r] for red, [g] for green, [b] for blue and [a] for alpha.
  /// 
  /// The alpha, red, green and blue components should be in the range 0 to 255.
  /// 
  /// Examples:
  /// ```dart
  /// Color.fromRGBA(255, 0, 0, 255) // opaque red.
  /// Color.fromRGBA(127, 0, 0, 255) // 50% transparent red.
  /// Color.fromRGBA(0, 255, 0, 255) // opaque green.
  /// ``
  factory Color.fromRGBA(int r, int g, int b, int a) {
    var value = (((a & 0xff) << 24) |
            ((r & 0xff) << 16) |
            ((g & 0xff) << 8) |
            ((b & 0xff) << 0)) &
        0xFFFFFFFF;
    return Color(value);
  }

  /// Returns the color from RGBO .
  /// 
  /// [r] for red, [g] for green, [b] for blue and [o] for opacity.
  /// 
  /// The red, green and blue components should be in the range 0 to 255 but opacity should be between 0 and 1.
  /// 
  /// Example`s:
  /// ```dart 
  /// Color.fromRGBO(255, 255, 255, 1) // white color
  /// Color.fromRGBO(255, 255, 255, 0.5) // 50% opacity white color
  /// Color.fromRGBO(255, 255, 255, 0) // transparent color 
  /// ```	
  factory Color.fromRGBO(int r, int g, int b, double opacity) {
    var value = ((((opacity * 0xff ~/ 1) & 0xff) << 24) |
            ((r & 0xff) << 16) |
            ((g & 0xff) << 8) |
            ((b & 0xff) << 0)) &
        0xFFFFFFFF;
    return Color(value);
  }

  String getHex() {
    var a = value.toRadixString(16).substring(0, 2);
    var r = value.toRadixString(16).substring(2, 4);
    var g = value.toRadixString(16).substring(4, 6);
    var b = value.toRadixString(16).substring(6, 8);
    return '$r$g$b$a';
  }
}

//Theme color for the app
// class ThemeColor{
//   static const Color primary = Color(0xFF1266F1);
//   static const Color dark = Color(0xFF262626);
//   static const Color light = Color(0xFFFBFBFB);
//   static const Color secondary = Color(0xFFB23CFD);
//   static const Color success = Color(0xFF00B74A);
//   static const Color warning = Color(0xFFFFA900);
//   static const Color danger = Color(0xFFF93154);
//   static const Color info = Color(0xFF39C0ED);

// }
class ThemeColor extends Color{
    ThemeColor(int value) : super(value);
  static const Color primary = Color(0xFF1266F1);
  static const Color dark = Color(0xFF262626);
  static const Color light = Color(0xFFFBFBFB);
  static const Color secondary = Color(0xFFB23CFD);
  static const Color success = Color(0xFF00B74A);
  static const Color warning = Color(0xFFFFA900);
  static const Color danger = Color(0xFFF93154);
  static const Color info = Color(0xFF39C0ED);



}

//-----------------------------------Colors

class Colors extends Color {
  // TODO : Use flutter color 
  Colors(int value) : super(value);
  // ignore: unnecessary_const
  static const Color yellow = Color(0xFFFFFF00);
  static const Color red = Color(0xFFFF0000);
  static const Color green = Color(0xFF00FF00);
  static const Color blue = Color(0xFF0000FF);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color transparent = Color(0x00000000);
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/material/Colors.blacks.png)
  static const Color black12 = Color(0x12000000);
  static const Color black26 = Color(0x26000000);
  static const Color black38 = Color(0x38000000);
  static const Color black45 = Color(0x45000000);
  static const Color black54 = Color(0x54000000);
  static const Color black87 = Color(0x87000000);

  static const Color pink50 = Color(0xFFFCE4EC);
  static const Color pink100 = Color(0xFFF8BBD0);
  static const Color pink200 = Color(0xFFF48FB1);
  static const Color pink300 = Color(0xFFF06292);
  static const Color pink400 = Color(0xFFEC407A);
  static const Color pink500 = Color(0xFFE91E63);
  static const Color pink600 = Color(0xFFD81B60);
  static const Color pink700 = Color(0xFFC2185B);
  static const Color pink800 = Color(0xFFAD1457);
  static const Color pink900 = Color(0xFF880E4F);
  static const Color pinkAccent100 = Color(0xFFFF80AB);
  static const Color pinkAccent200 = Color(0xFFFF4081);
  static const Color pinkAccent400 = Color(0xFFF50057);
  static const Color pinkAccent700 = Color(0xFFC51162);
  static const Color purple50 = Color(0xFFF3E5F5);
  static const Color purple100 = Color(0xFFE1BEE7);
  static const Color purple200 = Color(0xFFCE93D8);
  static const Color purple300 = Color(0xFFBA68C8);
  static const Color purple400 = Color(0xFFAB47BC);
  static const Color purple500 = Color(0xFF9C27B0);
  static const Color purple600 = Color(0xFF8E24AA);
  static const Color purple700 = Color(0xFF7B1FA2);
  static const Color purple800 = Color(0xFF6A1B9A);
  static const Color purple900 = Color(0xFF4A148C);
  static const Color purpleAccent100 = Color(0xFFEA80FC);
  static const Color purpleAccent200 = Color(0xFFE040FB);
  static const Color purpleAccent400 = Color(0xFFD500F9);
  static const Color purpleAccent700 = Color(0xFFAA00FF);
  static const Color deepPurple50 = Color(0xFFEDE7F6);
  static const Color deepPurple100 = Color(0xFFD1C4E9);
  static const Color deepPurple200 = Color(0xFFB39DDB);
  static const Color deepPurple300 = Color(0xFF9575CD);
  static const Color deepPurple400 = Color(0xFF7E57C2);
  static const Color deepPurple500 = Color(0xFF673AB7);
  static const Color deepPurple600 = Color(0xFF5E35B1);
  static const Color deepPurple700 = Color(0xFF512DA8);
  static const Color deepPurple800 = Color(0xFF4527A0);
  static const Color deepPurple900 = Color(0xFF311B92);
  static const Color deepPurpleAccent100 = Color(0xFFB388FF);
  static const Color deepPurpleAccent200 = Color(0xFF7C4DFF);
  static const Color deepPurpleAccent400 = Color(0xFF651FFF);
  static const Color deepPurpleAccent700 = Color(0xFF6200EA);
  static const Color indigo50 = Color(0xFFE8EAF6);
  static const Color indigo100 = Color(0xFFC5CAE9);
  static const Color indigo200 = Color(0xFF9FA8DA);
  static const Color indigo300 = Color(0xFF7986CB);
  static const Color indigo400 = Color(0xFF5C6BC0);
  static const Color indigo500 = Color(0xFF3F51B5);
  static const Color indigo600 = Color(0xFF3949AB);
  static const Color indigo700 = Color(0xFF303F9F);
  static const Color indigo800 = Color(0xFF283593);
  static const Color indigo900 = Color(0xFF1A237E);
  static const Color indigoAccent100 = Color(0xFF8C9EFF);
  static const Color indigoAccent200 = Color(0xFF536DFE);
  static const Color indigoAccent400 = Color(0xFF3D5AFE);
  static const Color indigoAccent700 = Color(0xFF304FFE);
  static const Color blue50 = Color(0xFFE3F2FD);
  static const Color blue100 = Color(0xFFBBDEFB);
  static const Color blue200 = Color(0xFF90CAF9);
  static const Color blue300 = Color(0xFF64B5F6);
  static const Color blue400 = Color(0xFF42A5F5);
  static const Color blue500 = Color(0xFF2196F3);
  static const Color blue600 = Color(0xFF1E88E5);
  static const Color blue700 = Color(0xFF1976D2);
  static const Color blue800 = Color(0xFF1565C0);
  static const Color blue900 = Color(0xFF0D47A1);
  static const Color blueAccent100 = Color(0xFF82B1FF);
  static const Color blueAccent200 = Color(0xFF448AFF);
  static const Color blueAccent400 = Color(0xFF2979FF);
  static const Color blueAccent700 = Color(0xFF2962FF);
  static const Color lightBlue50 = Color(0xFFE1F5FE);
  static const Color lightBlue100 = Color(0xFFB3E5FC);
  static const Color lightBlue200 = Color(0xFF81D4FA);
  static const Color lightBlue300 = Color(0xFF4FC3F7);
  static const Color lightBlue400 = Color(0xFF29B6F6);
  static const Color lightBlue500 = Color(0xFF03A9F4);
  static const Color lightBlue600 = Color(0xFF039BE5);
  static const Color lightBlue700 = Color(0xFF0288D1);
  static const Color lightBlue800 = Color(0xFF0277BD);
  static const Color lightBlue900 = Color(0xFF01579B);
  static const Color lightBlueAccent100 = Color(0xFF80D8FF);
  static const Color lightBlueAccent200 = Color(0xFF40C4FF);
  static const Color lightBlueAccent400 = Color(0xFF00B0FF);
  static const Color lightBlueAccent700 = Color(0xFF0091EA);
  static const Color cyan50 = Color(0xFFE0F7FA);
  static const Color cyan100 = Color(0xFFB2EBF2);
  static const Color cyan200 = Color(0xFF80DEEA);
  static const Color cyan300 = Color(0xFF4DD0E1);
  static const Color cyan400 = Color(0xFF26C6DA);
  static const Color cyan500 = Color(0xFF00BCD4);
  static const Color cyan600 = Color(0xFF00ACC1);
  static const Color cyan700 = Color(0xFF0097A7);
  static const Color cyan800 = Color(0xFF00838F);
  static const Color cyan900 = Color(0xFF006064);
  static const Color cyanAccent100 = Color(0xFF84FFFF);
  static const Color cyanAccent200 = Color(0xFF18FFFF);
  static const Color cyanAccent400 = Color(0xFF00E5FF);
  static const Color cyanAccent700 = Color(0xFF00B8D4);
  static const Color teal50 = Color(0xFFE0F2F1);
  static const Color teal100 = Color(0xFFB2DFDB);
  static const Color teal200 = Color(0xFF80CBC4);
  static const Color teal300 = Color(0xFF4DB6AC);
  static const Color teal400 = Color(0xFF26A69A);
  static const Color teal500 = Color(0xFF009688);
  static const Color teal600 = Color(0xFF00897B);
  static const Color teal700 = Color(0xFF00796B);
  static const Color teal800 = Color(0xFF00695C);
  static const Color teal900 = Color(0xFF004D40);
  static const Color tealAccent100 = Color(0xFFA7FFEB);
  static const Color tealAccent200 = Color(0xFF64FFDA);
  static const Color tealAccent400 = Color(0xFF1DE9B6);
  static const Color tealAccent700 = Color(0xFF00BFA5);
  static const Color green50 = Color(0xFFE8F5E9);
  static const Color green100 = Color(0xFFC8E6C9);
  static const Color green200 = Color(0xFFA5D6A7);
  static const Color green300 = Color(0xFF81C784);
  static const Color green400 = Color(0xFF66BB6A);
  static const Color green500 = Color(0xFF4CAF50);
  static const Color green600 = Color(0xFF43A047);
  static const Color green700 = Color(0xFF388E3C);
  static const Color green800 = Color(0xFF2E7D32);
  static const Color green900 = Color(0xFF1B5E20);
  static const Color greenAccent100 = Color(0xFFB9F6CA);
  static const Color greenAccent200 = Color(0xFF69F0AE);
  static const Color greenAccent400 = Color(0xFF00E676);
  static const Color greenAccent700 = Color(0xFF00C853);
  static const Color lightGreen50 = Color(0xFFF1F8E9);
  static const Color lightGreen100 = Color(0xFFDCEDC8);
  static const Color lightGreen200 = Color(0xFFC5E1A5);
  static const Color lightGreen300 = Color(0xFFAED581);
  static const Color lightGreen400 = Color(0xFF9CCC65);
  static const Color lightGreen500 = Color(0xFF8BC34A);
  static const Color lightGreen600 = Color(0xFF7CB342);
  static const Color lightGreen700 = Color(0xFF689F38);
  static const Color lightGreen800 = Color(0xFF558B2F);
  static const Color lightGreen900 = Color(0xFF33691E);
  static const Color lightGreenAccent100 = Color(0xFFCCFF90);
  static const Color lightGreenAccent200 = Color(0xFFB2FF59);
  static const Color lightGreenAccent400 = Color(0xFF76FF03);
  static const Color lightGreenAccent700 = Color(0xFF64DD17);
  static const Color lime50 = Color(0xFFF9FBE7);
  static const Color lime100 = Color(0xFFF0F4C3);
  static const Color lime200 = Color(0xFFE6EE9C);
  static const Color lime300 = Color(0xFFDCE775);
  static const Color lime400 = Color(0xFFCDDC39);
  static const Color lime500 = Color(0xFFC0CA33);
  static const Color lime600 = Color(0xFFAFB42B);
  static const Color lime700 = Color(0xFF9E9D24);
  static const Color lime800 = Color(0xFF827717);
  static const Color lime900 = Color(0xFF607D12);
  static const Color limeAccent100 = Color(0xFFF4FF81);
  static const Color limeAccent200 = Color(0xFFEEFF41);
  static const Color limeAccent400 = Color(0xFFC6FF00);
  static const Color limeAccent700 = Color(0xFFAEEA00);
  static const Color yellow50 = Color(0xFFFFFDE7);
  static const Color yellow100 = Color(0xFFFFF9C4);
  static const Color yellow200 = Color(0xFFFFF59D);
  static const Color yellow300 = Color(0xFFFFF176);
  static const Color yellow400 = Color(0xFFFFEE58);
  static const Color yellow500 = Color(0xFFFDD835);
  static const Color yellow600 = Color(0xFFFBC02D);
  static const Color yellow700 = Color(0xFFF9A825);
  static const Color yellow800 = Color(0xFFF57F17);
  static const Color yellow900 = Color(0xFFF4511E);
  static const Color yellowAccent100 = Color(0xFFFFFF8D);
  static const Color yellowAccent200 = Color(0xFFFFFF00);
  static const Color yellowAccent400 = Color(0xFFFFEA00);
  static const Color yellowAccent700 = Color(0xFFFFD600);
  static const Color amber50 = Color(0xFFFFF8E1);
  static const Color amber100 = Color(0xFFFFECB3);
  static const Color amber200 = Color(0xFFFFE082);
  static const Color amber300 = Color(0xFFFFD54F);
  static const Color amber400 = Color(0xFFFFCA28);
  static const Color amber500 = Color(0xFFFFC107);
  static const Color amber600 = Color(0xFFFFB300);
  static const Color amber700 = Color(0xFFFFA000);
  static const Color amber800 = Color(0xFFFF8F00);
  static const Color amber900 = Color(0xFFFF6F00);
  static const Color amberAccent100 = Color(0xFFFFE57F);
  static const Color amberAccent200 = Color(0xFFFFD740);
  static const Color amberAccent400 = Color(0xFFFFAB00);
  static const Color amberAccent700 = Color(0xFFFF9100);
  static const Color orange50 = Color(0xFFFFF3E0);
  static const Color orange100 = Color(0xFFFFE0B2);
  static const Color orange200 = Color(0xFFFFCC80);
  static const Color orange300 = Color(0xFFFFB74D);
  static const Color orange400 = Color(0xFFFFA726);
  static const Color orange500 = Color(0xFFFF9800);
  static const Color orange600 = Color(0xFFFB8C00);
  static const Color orange700 = Color(0xFFF57C00);
  static const Color orange800 = Color(0xFFEF6C00);
  static const Color orange900 = Color(0xFFE65100);
  static const Color orangeAccent100 = Color(0xFFFFD180);
  static const Color orangeAccent200 = Color(0xFFFFAB40);
  static const Color orangeAccent400 = Color(0xFFFF9100);
  static const Color orangeAccent700 = Color(0xFFFF6D00);
  static const Color deepOrange50 = Color(0xFFFFFBE9);
  static const Color deepOrange100 = Color(0xFFFFF3E0);
  static const Color deepOrange200 = Color(0xFFFFE0B2);
  static const Color deepOrange300 = Color(0xFFFFCC80);
  static const Color deepOrange400 = Color(0xFFFFB74D);
  static const Color deepOrange500 = Color(0xFFFFA726);
  static const Color deepOrange600 = Color(0xFFFF9100);
  static const Color deepOrange700 = Color(0xFFFF6D00);
  static const Color deepOrange800 = Color(0xFFF4511E);
  static const Color deepOrange900 = Color(0xFFE64A19);
  static const Color deepOrangeAccent100 = Color(0xFFFFD180);
  static const Color deepOrangeAccent200 = Color(0xFFFFAB40);
  static const Color deepOrangeAccent400 = Color(0xFFFF8F00);
  static const Color deepOrangeAccent700 = Color(0xFFFF5722);
  static const Color brown50 = Color(0xFFEFEBE9);
  static const Color brown100 = Color(0xFFD7CCC8);
  static const Color brown200 = Color(0xFFBCAAA4);
  static const Color brown300 = Color(0xFFA1887F);
  static const Color brown400 = Color(0xFF8D6E63);
  static const Color brown500 = Color(0xFF795548);
  static const Color brown600 = Color(0xFF6D4C41);
  static const Color brown700 = Color(0xFF5D4037);
  static const Color brown800 = Color(0xFF4E342E);
  static const Color brown900 = Color(0xFF3E2723);
  static const Color grey50 = Color(0xFFFAFAFA);
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey500 = Color(0xFF9E9E9E);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey700 = Color(0xFF616161);
  static const Color grey800 = Color(0xFF424242);
  static const Color grey900 = Color(0xFF212121);
  static const Color blueGrey50 = Color(0xFFECEFF1);
  static const Color blueGrey100 = Color(0xFFCFD8DC);
  static const Color blueGrey200 = Color(0xFFB0BEC5);
  static const Color blueGrey300 = Color(0xFF90A4AE);
  static const Color blueGrey400 = Color(0xFF78909C);
  static const Color blueGrey500 = Color(0xFF607D8B);
  static const Color blueGrey600 = Color(0xFF546E7A);
  static const Color blueGrey700 = Color(0xFF455A64);
  static const Color blueGrey800 = Color(0xFF37474F);
  static const Color blueGrey900 = Color(0xFF263238);
  static const Color red50 = Color(0xFFFFEBEE);
  static const Color red100 = Color(0xFFFFCCCD);
  static const Color red200 = Color(0xFFFF9B9B);
  static const Color red300 = Color(0xFFFF6161);
  static const Color red400 = Color(0xFFF44336);
  static const Color red500 = Color(0xFFF44336);
  static const Color red600 = Color(0xFFE53935);
  static const Color red700 = Color(0xFFD32F2F);
  static const Color red800 = Color(0xFFC62828);
  static const Color red900 = Color(0xFFB71C1C);
  static const Color redAccent100 = Color(0xFFFF8A80);
  static const Color redAccent200 = Color(0xFFFF5252);
  static const Color redAccent400 = Color(0xFFFF1744);
  static const Color redAccent700 = Color(0xFFD50000);
}
