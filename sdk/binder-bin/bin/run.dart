import 'dart:async';
import 'dart:convert' show Utf8Decoder;
import 'dart:io' show Directory, File, Process, exit, stdin, stdout;

import 'package:browser_launcher/browser_launcher.dart';

void executeRun() async {
  print('Running the project...');
  print('Serving the web generated file .....');
  var port = '8888';
  var web = 'web:$port';

  var process = await Process.start('dart',
      ['run', 'build_runner', 'serve', web, '--delete-conflicting-outputs'],
      runInShell: true, workingDirectory: Directory.current.path);
  process.stdout.transform(Utf8Decoder()).listen((element) async {
    var temp1 = element.trim().contains('[INFO] Succeeded after');
    var temp2 = element.trim().contains('Serving `web`');

    if (temp1 == true) {
      print(element.trim());
      print('Your website is running on http://localhost:$port');
      await Chrome.startWithDebugPort(['http://localhost:$port'], debugPort: 0);
      print('Launched Chrome with a debug port');
    } else if (temp2 == true) {
      //-------------I don't know yet. Actually i think it'sfor smth skip
      //Nothing just skipped
    }  else if (element.trim().isEmpty) {
      //-------------I don't know yet. Actually i think it'sfor smth skip
      //Nothing just skipped
    } else {
      print(element.trim());
    }
  });
} //end of executeRun()   




// String runHelpMessage() => '''
// 'Usage: bouchra <command> [<args>]';
// 'Commands:');
// '  <project-name>';
// '  test';
// '  run';
// '  help';
//  ''';