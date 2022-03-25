import 'bootstrap.dart';
// TODO : Imcomplete
class BootstrapNav extends Widget {
  final Key? key;
  final List<BootstrapNavItem>? children;
  final BootstrapNavAlignment? alignment;
  final bool isTabs;
  final bool isVertical;
  final bool isFluid;
  final bool isPills;

  const BootstrapNav({
    this.key,
    this.children,
    this.alignment ,
    this.isTabs = false,
    this.isVertical = false,
    this.isFluid = false,
    this.isPills = false,

  });
  @override
  Element toElement() {
    Element element = Element.ul();
    element.classes.add('nav');
    if (key != null) {
      element.id = key!.value;
    }
    if (children != null) {
      for (BootstrapNavItem child in children!) {
        element.children.add(child.toElement());
      }
    }
    if (alignment != null) {
      element.classes.add(alignment!.value); // justify-content-center etc,...
    }
    if (isTabs) {
      element.classes.add('nav-tabs');
    }
    if (isVertical) {
      element.classes.add('flex-column');
    }
    // if (isFluid) {
    //   element.classes.add('nav-fill');
    // }
    // if (isPills) {
    //   element.classes.add('nav-pills');
    // }
    return element;
  }
}

class BootstrapNavAlignment {
  final String value;
  const BootstrapNavAlignment._(this.value);
  static const BootstrapNavAlignment justify =
      BootstrapNavAlignment._('justify-content-center');
  static const BootstrapNavAlignment right =
      BootstrapNavAlignment._('justify-content-end');
  // TODO : I don't thik we can use this one
  // static const BootstrapNavAlignment left =
  //     BootstrapNavAlignment._('justify-content-start');
}

//-------------------------Others classes--------------------------------------

//-------------------------BootstrapNavItem-------------------------------------
class BootstrapNavItem extends Widget {
  final Key? key;
  final Widget? child;
  const BootstrapNavItem({
    this.key,
    this.child,
  });
  @override
  Element toElement() {
    Element element = Element.li();
    element.classes.add('nav-item');
    if (key != null) {
      element.id = key!.value;
    }
    if (child != null) {
      element.children.add(child!.toElement());
    }
    return element;
  }
}

//-------------------------BootstrapNavLink--------------------------------------
class BootstrapNavLink extends Widget {
  final Key? key;
  final Widget? child;
  final bool isActive;
  final bool? disabled;
  const BootstrapNavLink({
    this.key,
    this.child,
    this.isActive = false,
    this.disabled = false,
  });
  @override
  Element toElement() {
    Element element = Element.li();
    element.classes.add('nav-item');
    if (key != null) {
      element.id = key!.value;
    }
    if (child != null) {
      element.children.add(child!.toElement());
    }
    if (isActive) {
      element.classes.add('active');
    }
    if (disabled != null && disabled == true) {
      element.classes.add('disabled');
    }
    return element;
  }
}
