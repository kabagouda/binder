import 'dart:convert' show Utf8Decoder;
import 'dart:io' show Directory, Process;

import 'package:ansicolor/ansicolor.dart';
import 'package:browser_launcher/browser_launcher.dart';

void executeRun() async {
  print('Running the project...');
  print('Serving the web generated file...');
  var port = '8888';
  var web = 'web:$port';
  var alreadyLaunched = false;
  var process = await Process.start('dart',
      ['run', 'build_runner', 'serve', web, '--delete-conflicting-outputs'],
      runInShell: true, workingDirectory: Directory.current.path);
  process.stdout.transform(Utf8Decoder()).listen((element) async {
    var temp1 = element.trim().contains('[INFO] Succeeded after');
    var temp2 = element.trim().contains('Serving `web`');

    if (temp1 == true) {
      print(colorString(element.trim()));
      if (alreadyLaunched == false) {
        print('Your website is running on http://localhost:$port .');
        await Chrome.startWithDebugPort(['http://localhost:$port'],
            debugPort: 0);
        print('Launched Chrome with a debug port on http://localhost:$port .');
        alreadyLaunched = true;
      }
      alreadyLaunched = true;
    } else if (temp2 == true) {
      //-------------I don't know yet. Actually i think it'sfor smth skip
      //Nothing just skipped
    } else if (element.trim().isEmpty) {
      //-------------I don't know yet. Actually i think it'sfor smth skip
      //Nothing just skipped
    } else {
      print(colorString(element.trim()));
    }
  });
} //end of executeRun()

String colorString(String element) {
  if (element.contains('[INFO]')) {
     AnsiPen pen = AnsiPen()..blue();
    element = element.replaceAll('[INFO]', '');
    return pen('[INFO]') + element;	
  }
  else if (element.contains('[WARNING]')) {
    AnsiPen pen = AnsiPen()..yellow();
    element = element.replaceAll('[WARNING]', '');
    return pen('[WARNING]') + element;
  } else if (element.contains('[ERROR]')) {
    AnsiPen pen = AnsiPen()..red();
    element = element.replaceAll('[ERROR]', '');
    return pen('[ERROR]') + element;
  } else if (element.contains('[DEBUG]')) {
    AnsiPen pen = AnsiPen()..cyan();
    element = element.replaceAll('[DEBUG]', '');
    return pen('[DEBUG]') + element;
  } else {
    return element;
  }
  
}

// String runHelpMessage() => '''
// 'Usage: bouchra <command> [<args>]';
// 'Commands:');
// '  <project-name>';
// '  test';
// '  run';
// '  help';
//  ''';
