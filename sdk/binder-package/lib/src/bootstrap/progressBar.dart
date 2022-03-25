// ignore_for_file: file_names

import 'bootstrap.dart';

class BoostrapProgressBar extends Widget {
  final Key? key;
  final Widget? child;
  final BootstrapColor? color;
  final double? value;
  final double? progressBarHeight;
  final bool? isStriped;
  final bool? isAnimated;
  const BoostrapProgressBar({
    this.key,
    this.child,
    this.color = BootstrapColors.primary,
    this.value,
    this.progressBarHeight = 50,
    this.isStriped = false,
    this.isAnimated = false,
  });
  @override
  Element toElement() {
    // --Parent Element
    DivElement parentElement =
        DivElement(); // Parent progress to controll the width and the progress bar
    parentElement.classes.add('progress');
    // --Child Element
    DivElement childElement = DivElement();

    childElement.classes.add('progress-bar');
    if (key != null) {
      parentElement.id = key!.value; // Key is for parent element
    }
    if (child != null) {
      childElement.children.add(child!.toElement());
    }
    if (color != null) {
      childElement.classes.add('bg-${color!.value}');
    }
    if (value != null) {
      childElement.style.width = '$value%';
    }
    if (progressBarHeight != null) {
      parentElement.style.height = '${progressBarHeight}px';
      childElement.style.height = '${progressBarHeight}px';
    }
    if (isStriped != null && isStriped == true) {
      childElement.classes.add('progress-bar-striped');
    }
    if (isAnimated != null && isAnimated == true) {
      childElement.classes.add('progress-bar-animated');
    }
    parentElement.children.add(childElement);
    return parentElement;
  }
}
