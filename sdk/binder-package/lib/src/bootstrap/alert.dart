import 'bootstrap.dart';

class BootstrapAlert extends Widget {
  final Key? key;
  final Widget? child;
  final BootstrapColor? color;
  final bool? dismissible;
  final bool? fade;
  final bool? showFaddingEffect;
  final bool? coloredLinks;

  const BootstrapAlert({
    this.key,
    this.child,
    this.color = BootstrapColors.warning,
    this.dismissible = false,
    this.fade = false,
    this.showFaddingEffect = false,
    this.coloredLinks = true,
  });
  @override
  Element toElement() {
    Element element = Element.div();
    element.classes.add('alert'); // The most important
    if (key != null) {
      element.id = key!.value;
    }
    if (child != null) {
      element.children.add(child!.toElement());
    }
    if (color != null) {
      element.classes.add('alert-${color!.value}');
    }
    if (dismissible != null && dismissible == true) {
      element.classes.add('alert-dismissible');
      // TODO : Gtp-3 suggère qqch ici que j'ai pas compris
      element.children.add(ButtonElement()
        ..classes.add('close')
        ..attributes['type'] = 'button'
        ..attributes['data-dismiss'] = 'alert'
        ..attributes['aria-label'] = 'Close'
        ..children.add(Element.span()
          ..attributes['aria-hidden'] = 'true'
          ..text = '×'));
      //fin du gtp-3
    }
    if (fade != null && fade == true) {
      element.classes.add('fade');
    }
    if (showFaddingEffect != null && showFaddingEffect == true) {
      element.classes.add('show');
    }
    if (coloredLinks != null && coloredLinks == true) {
      // element.querySelectorAll('a').forEach((Element e) {
      //   e.classes.add('text-${color!.value}');
      // });
      //or simply use
      element.classes.add('alert-link');
    }
    return element;
  }
}
