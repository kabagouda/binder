import 'dart:async';
import 'dart:convert' show Utf8Decoder;
import 'dart:io' show Directory, File, Process, exit, stdin, stdout;

import 'package:browser_launcher/browser_launcher.dart';



void executeRun() async {
//----------------------------------------------First generated html for serving--------------------------------------------------------------------

  print('Running the Html builder ...');
  Process.runSync('dart', ['bin/builder/html_builder.dart'],
      runInShell: true, workingDirectory: Directory.current.path);
  print('Html generated successfully');

  //-----------------------------------------TODO: Dart Builder-----------------------------------------

  print('Running the Dart builder ...');

//---------------------------------------------Serving web generated file --------------------------------------------------
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
      stdout.write(
          'Press "r" or "R" key  and "Enter ↵" Key to make a hot reload✨🔥 --- Or  "q" to quit : ');
      stdin
        ..echoMode = false
        ..lineMode = false;
      stdin.listen((input) {
        var value = String.fromCharCodes(input);
        if (value == 'r' || value == 'R') {
          print('Reloading the web page ...');
          print('Hot reloading ...');
          //------------Rebuild the dart code and reload the web page
          print('Running the builder ...');
          //TODO : dart builder again
          //It will rebuild website itself
          //----Reshow r and R key
          stdout.write(
              'Press "r" or "R" key  and "Enter ↵" Key to make a hot reload✨🔥 --- Or  "q" to quit : ');
          // Process.runSync('dart', ['bin/builder/html_builder.dart'],
          //     runInShell: true, workingDirectory: Directory.current.path);
          // print('Html generated successfully');
          // print('Reloading the web page ...');
          // Process.runSync('dart', ['build_runner', 'clean'],
          //     runInShell: true, workingDirectory: Directory.current.path);
          // print('Dart generated successfully');
          // print('Reloading the web page ...');
          // Process.runSync('dart', ['build_runner', 'serve', web],
          //     runInShell: true, workingDirectory: Directory.current.path);
          // print('Web page reloaded successfully');
        } else if (value == 'q') {
          print('Quitting the web page ...');
          exit(0);
        } else {
          print('Invalid key pressed');
          stdout.write(
              'Press "r" or "R" key  and "Enter ↵" Key to make a hot reload✨🔥 --- Or  "q" to quit : ');
        }
      });

      // stdin
      //   ..echoMode = false
      //   ..lineMode = false;
      //  stdin.forEach((List<int> codes) async {
      //   var input = String.fromCharCodes(codes);
      //   if (input == 'r' || input == 'R') {
      //     print('Hot reloading ...');
      //     //------------Rebuild the dart code and reload the web page
      //     print('Running the builder ...');
      //     //TODO : dart builder again
      //     //It will rebuild website itself
      //     //----Reshow r and R key
      //     stdout.write(
      //         'Press "r" or "R" key  and "Enter ↵" Key to make a hot reload✨🔥 --- Or  "q" to quit : ');
      //   } else if (input == 'q') {
      //     process.kill();
      //     print('Quitting the running ...');
      //     exit(0);
      //   }
      // });

      // String Input

    } else if (temp2 == true) {
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