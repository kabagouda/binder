import 'bootstrap.dart';

// TODO : Imcmoplete
class BootstrapCard extends Widget {
  final Key? key;
  final Widget? header;
  final Widget? content;
  final Widget? footer;
  final BootstrapColor? color;
  final double? height;
  final double? width;
  const BootstrapCard({
    this.key,
    this.header,
    this.content,
    this.footer,
    this.color, // basic card
    this.height,
    this.width,
  });
  @override
  Element toElement() {
    // --Parent Element
    DivElement parentElement =
        DivElement(); // Parent progress to controll the width and the progress bar
    parentElement.classes.add('card');
    // --Child Element
    DivElement childElement = DivElement();

    childElement.classes.add('card-body');
    if (key != null) {
      parentElement.id = key!.value; // Key is for parent element
    }
    if (header != null) {
      Element _header = header!.toElement()..classes.add('card-header');
      childElement.children.add(_header);
    }
    if (content != null) {
      Element _content = content!.toElement()..classes.add('card-body');
      childElement.children.add(_content);
    }
    if (footer != null) {
      Element _footer = footer!.toElement()..classes.add('card-footer');
      childElement.children.add(_footer);
    }
    if (color != null) {
      parentElement.classes.add('bg-${color!.value}');
    }
    if (height != null) {
      parentElement.style.height = '${height}px';
    }
    if (width != null) {
      parentElement.style.width = '${width}px';
    }

    parentElement.children.add(childElement);
    return parentElement;
  }
}


// Other class 