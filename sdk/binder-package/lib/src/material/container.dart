import 'material.dart';

class Container extends Widget {
  final Key? key;
  final Widget? child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Border? border;
  final Color? color;

  const Container({
    this.key,
    this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.border,
    this.color,
  });
  @override
  Element toElement() {
    Element element = Element.div();
    if (key != null) {
      element.id = key!.value;
    }
    if (child != null) {
      // because here we have a child that is not required
      element.children.add(child!.toElement());
    }
    // element.style.display = 'flex';
    element.style.overflow = 'auto';
    if (width != null) {
      element.style.width = '${width}px';
    }
    if (height != null) {
      element.style.height = '${height}px';
    }
    if (padding != null) {
      element.style.paddingTop = '${padding?.top}px';
      element.style.paddingRight = '${padding?.right}px';
      element.style.paddingBottom = '${padding?.bottom}px';
      element.style.paddingLeft = '${padding?.left}px';
    }
    if (margin != null) {
      element.style.marginTop = '${margin?.top}px';
      element.style.marginRight = '${margin?.right}px';
      element.style.marginBottom = '${margin?.bottom}px';
      element.style.marginLeft = '${margin?.left}px';
    }
    // TODO: border
    // if (border != null) {
    //   element.style.border = '${border}px solid black';
    // }
    if (color != null) {
      element.style.backgroundColor = '#${color?.getHex()}';
    }
    return element;
  }
}

// TODO:
class Border {
  final int? top;
  final int? right;
  final int? bottom;
  final int? left;
  const Border({
    this.top,
    this.right,
    this.bottom,
    this.left,
  });
  factory Border.all({
    int? width,
  }) {
    return Border(
      top: width,
      right: width,
      bottom: width,
      left: width,
    );
  }
}
