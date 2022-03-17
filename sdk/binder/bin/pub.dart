import 'dart:async';
import 'dart:io' show Directory, Process, exit, stdin, stdout;

import 'package:ansicolor/ansicolor.dart';


//-------------------------------------Release Mode

void executeGetPub() async {
  // AnsiPen pen = AnsiPen()..red(bold: true); //red color and bold in terminal
  var process = await Process.run(
        'dart',
        [
          'pub',
          'get',
          '--template',
          'server-shelf',
        ],
        runInShell: true,
        workingDirectory: Directory.current.path);
}