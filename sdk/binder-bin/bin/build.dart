import 'dart:async';
import 'dart:io' show Directory, Process, exit, stdin, stdout;

import 'package:ansicolor/ansicolor.dart';


//-------------------------------------Release Mode

void executeBuildForRelease() async {
  AnsiPen pen = AnsiPen()..red(bold: true); //red color and bold in terminal
  print(' Building web files ...');
  bool success = await _buildJSForRelease();
  if (!success) {
    print(pen('Something went wrong while building web files.'));
    exit(0);
  }
}

// Compilation failed.
Future<bool> _buildJSForRelease() async {
  var process = await Process.run(
      'dart2js', ['-O4', '-o', 'web/main.dart.js', 'lib/main.dart'],
      runInShell: true, workingDirectory: Directory.current.path);
  // stdout.write('${process.stdout}'); //decomment
  //to removing library Warning
  stdout.write(
      '${process.stdout.substring(process.stdout.indexOf("/main.dart'.")+12)}');
  if (process.stdout.toString().contains('compiled')) {
    return true;
  } else {
    return false;
  }
}

//-------------------------------------Debug Mode

void executeBuildForDebug() async {
  AnsiPen pen = AnsiPen()..red(bold: true);
  print(' Building web files ...');
  bool success = await _buildJSForDebug();
  if (!success) {
    print(pen('Something went wrong while building web files.'));
    exit(0);
  }
  print(pen('Press "r" or "R" to make a hot reload✨🔥.'));
  print(
      'For more detailed help message , press "h" and to quit press "q" or "Q".\n');
  stdin
    ..echoMode = false
    ..lineMode = false;
  var alreadyPressed = false;
  stdin.listen((List<int> codes) async {
    String value = String.fromCharCodes(codes);
    if (value == 'r' || value == 'R') {
      if (alreadyPressed == false) {
        alreadyPressed = true;
        // print(value);
        print(' Hot reloading ...');
        var stopwatch = Stopwatch()..start();
        var success = await _buildJSForDebug();
        success
            ? print(
                'Reloaded  successfully in ${stopwatch.elapsedMilliseconds} ms . \n')
            : print(pen('Something went wrong while building web files.'));
        // stdout.write(pen('Press "r" or "R" to make a hot reload✨🔥'));
        stopwatch.stop(); // to stop the timer .
        await Future.delayed(Duration(milliseconds: 1300), () {
          alreadyPressed = false;
        });
      }
    } else if (value == 'q' || value == 'Q') {
      // print(value);
      stdout.write(' Quiting ...');
      try {
        exit(0);
      } catch (e) {
        // print(e);
        exit(0);
      } 
      finally {
        exit(0);
      }
    } else if (value == 'h') {
      if (alreadyPressed == false) {
        alreadyPressed = true;
        stdout.write(pen(
            'Press "r" or "R" to make a hot reload✨🔥 --- Or  "q" to quit : \n'));
        await Future.delayed(Duration(milliseconds: 1300), () {
          alreadyPressed = false;
        });
      }
    }
  });
}

Future<bool> _buildJSForDebug() async {
  var process = await Process.run(
      'dart2js', ['-O2', '-o', 'web/main.dart.js', 'lib/main.dart'],
      runInShell: true, workingDirectory: Directory.current.path);
  // stdout.write('${process.stdout}'); //decomment
  //to removing library Warning
  stdout.write(
      '${process.stdout.substring(process.stdout.indexOf("/main.dart'.")+12)}');
  if (process.stdout.toString().contains('compiled')) {
    return true;
  } else {
    return false;
  }
}

