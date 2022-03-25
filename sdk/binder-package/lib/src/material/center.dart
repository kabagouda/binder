import 'material.dart';

class Center extends Widget {
  final Key? key;
  final Widget? child;
  const Center({
    this.key,
    this.child,
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
    // element.style.position= 'relative';
    // element.style.margin = 'auto';
    element.style..display = 'flex'
   ..alignItems = 'center'
    ..justifyContent = 'center'
   ..alignContent='center'
   ..textAlign = 'center'
   ..flexDirection = 'row';
    return element;
  }
}
