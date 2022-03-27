import 'dart:html';
import 'key.dart';
import 'widget.dart';

class WebApp extends Widget {
  final Key? key;
  final Widget? header;
  final Widget? body;
  final Widget? footer;
  const WebApp({
    this.key,
    this.header,
    this.body,
    this.footer,
  });

  @override
  Element toElement() {
    Element element = Element.div();
    if (header != null) {
      element.append(header!.toElement());
    }
    if (body != null) {
      element.append(body!.toElement());
    }
    if (footer != null) {
      element.append(footer!.toElement());
    }
    return element;
  }
}
