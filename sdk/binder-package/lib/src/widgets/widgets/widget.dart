import 'dart:html';

abstract class Widget {
  // final Key? key;
  Element toElement();
  const Widget();
  // const Widget({this.key});
}
// class Key {
//   final String value;
//   const Key(this.value);
// }


//-------------------------------

// class Widget extends WidgetElement {
//   @override
//   Element toElement() {
//     // TODO: implement toElement
    
//   }
//   //   Element toElement();
// //   const Widget();

// }

// abstract class WidgetElement {
//   Element toElement();
//   const WidgetElement();
// }

// class Name extends Widget {
//   final String name;
//   const Name(this.name);
//   @override
//   Element toElement() {
//     Element element = Element.div();
//     element.text = name;
//     return element;
//   }
// }
  
// }