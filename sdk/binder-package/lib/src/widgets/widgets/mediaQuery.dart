// ignore_for_file: file_names
// TODO: Add for FromWidgetkey . 


import 'dart:html';

class MediaQuery {
  static Size size = Size(double.parse(window.innerWidth.toString()), double.parse(window.innerHeight.toString()));
}

class Size {
  final double width;
  final double height;
  Size(this.width, this.height);
}

//MediaQuery.of(document.body!).size.height,