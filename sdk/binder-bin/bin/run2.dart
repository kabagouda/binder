import 'dart:io';
import 'dart:convert';
import 'dart:async';

executeRun() async {
  //               ----------- Html file builder
  print('Running the Html builder ...');
  Process.runSync('dart', ['lib/main.dart']);
  print('Html generated successfully');

  //-----------------todo : Dart file builder

  //              ----------- Serving the web folder
  print('Serving the web generated file .....');
  var port = '8080';
  var web = 'web:$port';

  var process =
      await Process.start('dart', ['run', 'build_runner', 'serve', web]);
  process.stdout.transform(Utf8Decoder()).forEach((element) {
    var temp1 = element.trim().contains('[INFO] Succeeded after');
    var temp2 = element.trim().contains('Serving `web`');

    if (temp1 == true) {
      print(element.trim());
      stdout.write('Press "r" or "R" key  and "Enter ↵" Key to make a hot reload✨🔥 --- Or  "q" to quit : ');
        
      var input = stdin.readLineSync();

      // StringInput
      if (input == 'r' || input == 'R') {
        print('Hot reloading ...');
        //------------Rebuild
        print('Running the builder ...');
        Process.runSync('dart', ['lib/main.dart']);
        print('Html generated successfully');
      } else if (input == 'q') {
        process.kill();
      }
    } else if (temp2 == true) {
    } else {
      print(element.trim());
    }
  });
}
