import 'bootstrap.dart';

class BootstrapImage extends Widget {
  final Key? key;
  final String? src;
  final String? alt;
  final BootstrapImageShape? shape;
  final BootstrapImageAlignment? alignment;
  final bool? isResponsive;
  BootstrapImage({
    this.key,
    required this.src,
    this.alt,
    this.shape,
    this.alignment,
    this.isResponsive = false,
  });
  @override
  Element toElement() {
    ImageElement element = ImageElement();
    if (key != null) {
      element.id = key!.value;
    }
    if (src != null) {
      element.src = src; 
    }
    if (alt != null) {
      element.alt = alt;
    }
    if (shape != null) {
      element.classes.add(shape!.value); // ex : rounded or thumbnail 
    }
    if (alignment != null) {
      // add d-block to class if value ==mx-auto
      if (alignment!.value == 'mx-auto') {
        element.classes.add('d-block');
      } // else , nothing to do
      element.classes.add(alignment!.value);
    }
    if (isResponsive != null && isResponsive == true) {
      element.classes.add('img-fluid');
    }
    return element;
  }

}

class BootstrapImageAlignment {
  final String value;
  const BootstrapImageAlignment._(this.value);
  static const BootstrapImageAlignment left = BootstrapImageAlignment._('float-start');
  static const BootstrapImageAlignment right = BootstrapImageAlignment._('float-end');
  static const BootstrapImageAlignment center = BootstrapImageAlignment._('mx-auto');

}

class BootstrapImageShape {
  final String value;
  const BootstrapImageShape._(this.value);
  static const BootstrapImageShape circle = BootstrapImageShape._('circle');
  static const BootstrapImageShape rounded = BootstrapImageShape._('rounded');
  static const BootstrapImageShape thumbnail = BootstrapImageShape._('thumbnail');

  // TODO : test other values . I don't see it in documentation but gpt-3 has it

  static const BootstrapImageShape roundedCircle = BootstrapImageShape._('rounded-circle');
  static const BootstrapImageShape roundedTop = BootstrapImageShape._('rounded-top');
  static const BootstrapImageShape roundedBottom = BootstrapImageShape._('rounded-bottom');
  static const BootstrapImageShape roundedLeft = BootstrapImageShape._('rounded-left');
  static const BootstrapImageShape roundedRight = BootstrapImageShape._('rounded-right');
  static const BootstrapImageShape roundedTopLeft = BootstrapImageShape._('rounded-top-left');
  static const BootstrapImageShape roundedTopRight = BootstrapImageShape._('rounded-top-right');
  static const BootstrapImageShape roundedBottomLeft = BootstrapImageShape._('rounded-bottom-left');
  static const BootstrapImageShape roundedBottomRight = BootstrapImageShape._('rounded-bottom-right');

}

// abstract class BootstrapImageProvider {
//   String get value;
// }
// class BootstrapAssetImage extends BootstrapImageProvider {
//   final String assetPath;
//   BootstrapAssetImage(this.assetPath);
//   @override
//   String get value => assetPath;
// }

// class BootstrapNetworkImage extends BootstrapImageProvider {
//   final String url;
//   BootstrapNetworkImage(this.url);
//   @override
//   String get value {
//   return Uri.parse(url).path;

// // -----Just to add http
//     // if (url.startsWith('http') || url.startsWith('https')) {
//     //   return url;
//     // } else {
//     //   return 'https://$url';
//     // }
//   }
// }
  
