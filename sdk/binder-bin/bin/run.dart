import 'dart:convert' show Utf8Decoder;
import 'dart:io' show Directory, File, Process;

import 'package:ansicolor/ansicolor.dart';
import 'package:browser_launcher/browser_launcher.dart';
import 'package:path/path.dart';

import 'project_string/build.yaml.dart';
import 'project_string/web_js_live.js.dart';

void executeRun() async {
  print('Running the project...');
  // Move web content to build folder.
  print(' Copying web content to build folder...');	
  moveAllFilesAndFolderFromWebToBuild();
  print('Serving the web generated file...');
  var port = '8884';
  var web = 'build:$port';
  var alreadyLaunched = false;
  var process = await Process.start('dart',
      ['run', 'build_runner', 'serve', web, '--delete-conflicting-outputs'],
      runInShell: true, workingDirectory: Directory.current.path);
  process.stdout.transform(Utf8Decoder()).listen((element) async {
    var temp1 = element.trim().contains('[INFO] Succeeded after');
    var temp2 = element.trim().contains('Serving `web`');

    if (temp1 == true) {
      print(colorString(element.trim()));
      // Update the hot reloader notifier
      if (alreadyLaunched == false) {
        print('Your website is running on http://localhost:$port .');
        await Chrome.startWithDebugPort(['http://localhost:$port'],
            debugPort: 0);
        print('Launched Chrome with a debug port');
        alreadyLaunched = true;
        // Hot reloader and notifier
        addWebJsHotReloader();
        File(join(Directory.current.path, 'web/js/.hotreloader_notifier.js'))
          ..createSync(recursive: true)
          ..writeAsStringSync('//' + DateTime.now().toString());
      }
      updateHotNotifier();
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
  } else if (element.contains('[WARNING]')) {
    AnsiPen pen = AnsiPen()..yellow();
    element = element.replaceAll('[WARNING]', '');
    return pen('[WARNING]') + element;
  } else if (element.contains('[SEVERE]')) {
    AnsiPen pen = AnsiPen()..red();
    element = element.replaceAll('[SEVERE]', '');
    return pen('[SEVERE]') + element;
  } else if (element.contains('[DEBUG]')) {
    AnsiPen pen = AnsiPen()..cyan();
    element = element.replaceAll('[DEBUG]', '');
    return pen('[DEBUG]') + element;
  } else {
    return element;
  }
}

void addWebJsHotReloader() {
  String _string = getWebJsLiveJS();
  File(join(Directory.current.path, 'build/js/.hotreloader.js'))
    ..createSync(recursive: true)
    ..writeAsStringSync(_string);
}
// void addBuildYaml() {
//   String _string = getBuildYaml();
//   File(join(Directory.current.path, 'build.yaml'))
//     ..createSync(recursive: true)
//     ..writeAsStringSync(_string);
// }


Future<void> updateHotNotifier() async {
  String notifierContent =
      File(join(Directory.current.path, 'build/js/.hotreloader_notifier.js'))
          .readAsStringSync();
  var diff = DateTime.now()
      .difference(DateTime.tryParse(notifierContent.replaceAll('//', ''))!)
      .inMilliseconds;
  if (diff > 5000) {
    File(join(Directory.current.path, 'build/js/.hotreloader_notifier.js'))
        .writeAsStringSync('//' + DateTime.now().toString());
  }
}

void moveAllFilesAndFolderFromWebToBuild() {
  Directory(join(Directory.current.path, 'web')).listSync().forEach((element) {
    if (element is File) {
      File(join(Directory.current.path, 'build', basename(element.path)))
          .writeAsBytesSync(element.readAsBytesSync());
    } else if (element is Directory) {
      Directory(join(Directory.current.path, 'build', basename(element.path)))
          .createSync(recursive: true);
      element.listSync().forEach((element2) {
        if (element2 is File) {
          File(join(Directory.current.path, 'build', basename(element.path),
                  basename(element2.path)))
              .writeAsBytesSync(element2.readAsBytesSync());
        }
      });
    }
  });
}


// String runHelpMessage() => '''
// 'Usage: bouchra <command> [<args>]';
// 'Commands:');
// '  <project-name>';
// '  test';
// '  run';
// '  help';
//  ''';
