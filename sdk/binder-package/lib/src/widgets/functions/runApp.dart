// ignore_for_file: file_names
import 'dart:html';

import '../widgets/widget.dart';

/// Coming soon

void runApp(Widget widget) {
  // Coming soon
  document.body?.children.addAll([
    widget.toElement(),
  ]);
}