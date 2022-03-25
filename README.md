# Binder Framework

[**Binder**](https://binder.kabagouda.com) is a web framework that can be used to create web apps and APIs .

<p align="center" >
  <img  width ="600" src="https://user-images.githubusercontent.com/64534846/158489733-67af3a32-5584-44c6-9ffe-043cb1c5ca8f.png" alt="Binder logo">
</p>

## Get started

<!-- ![binger logo](https://user-images.githubusercontent.com/64534846/158489733-67af3a32-5584-44c6-9ffe-043cb1c5ca8f.png) -->

  First of all, we need to download Binder SDK framework.

  Or download Dart SDK and binder-sdk folder in the Dart SDK . Then, active it by doing `dart pub global activate --source path binder-bin`.

After the installation , you can use it  

To create , you need to create a new project.
Use : `binder create <project_name>`

To run , you need to run the project.
Use : `binder run`

An example of project :

```dart
import 'package:binder/bootstrap.dart';

void main() {
  runApp(MyApp());
 
}

class MyApp extends Widget {
  @override
  Element toElement() {
    return BootstrapContainer(
      child: BootstrapCenter(
        child: BootstrapText('Hello World'),
      ),
    ).toElement();
  }
}
```


