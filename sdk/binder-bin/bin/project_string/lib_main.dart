String getLibMain() => '''
// Coming soon
import 'binder/bootstrap.dart';

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
''';	


