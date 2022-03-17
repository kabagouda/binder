import 'dart:io' show Directory, File, FileMode, Process, exit;

import 'package:path/path.dart';
Future<void> executeCreate(
    String projectName, String currentDirectory, String projectPath) async {
  //1- Verify if directory exist
  if (await Directory(join(currentDirectory, projectName)).exists()) {
    print("Directory '${join(currentDirectory, projectName)}' already exists");
  }
  //2- Create directory
  else {
    print('Creating...');
    var stopwatch = Stopwatch()..start(); // listen to the time
    var process = await Process.run(
        'dart',
        [
          'create',
          projectName,
          '--template',
          'server-shelf',
        ],
        runInShell: true,
        workingDirectory: Directory.current.path);
    //Verify if project is created successfully . (In order to get started is in message normally)
    if (process.stdout.toString().contains('In order to get started')) {
      var process2 = await Process.run('dart',
          ['create', projectName, '--template', 'web-simple', '--force'],
          runInShell: true, workingDirectory: Directory.current.path);
      if (process2.stdout.toString().contains('In order to get started')) {
        //-------Creating of lib/main.dart
        File(join(projectName, 'lib', 'main.dart'))
          ..createSync(recursive: true)
          ..writeAsStringSync('''//Coming soon\n\n ''');

        //-------Update of pubspec.yaml

        _pubspecContainingMessage(projectPath);

        //-------Update of bin/server.dart

        File(join(projectName, 'bin', 'server.dart'))
            .writeAsStringSync('''//Coming soon\n\n''');

        //-------Update of test/server_test.dart
        File(join(projectName, 'test', 'server_test.dart'))
            .writeAsStringSync('''//Coming soon\n\n''');

        //-------Update of Readme.md
        File(join(projectName, 'README.md')).writeAsStringSync(
            '''# $projectName\n\n This is a simple project to get started with Bouchira.\n\n## How to get started\n\n 1. Clone the repository\n 2. Run `pub get`\n 3. Run `bouchira run`\n 4. Enjoy!\n\n## Contributing\n\n If you have any questions or suggestions, please open an issue .\n\n## License\n\n This project is licensed under the MIT License.\n\n## Author\n\n [Kab  Agouda]('https://twitter.com/kabagouda')\n''');

        //--------//TODO : Update the web folder : index.html(bootsprap) , style.css(delete or not) and other . Perhaps use the builder

        // -------Succesfully message

        print(creatingMessage(
            projectName, projectPath, stopwatch.elapsedMilliseconds));
        stopwatch.stop();
      }
    } else {
      print('Something went wrong when creating the project');
    }
  }
  exit(0);
}

//--------------------------------- Message ---------------------------------
String creatingMessage(String projectName, String projectPath, int stopWatch) =>
    '''
All done!                              $stopWatch ms
In order to run your project, type:

  \$ cd $projectName
  \$ binder run

Your Project code is in ${join(projectName, 'lib', 'main.dart')}.

''';
//         For pubspecContainingMessage
void _pubspecContainingMessage(String projectPath) {
  String pubspecString = '';
  List pubspecListString =
      File(join(projectPath, 'pubspec.yaml')).readAsLinesSync();
  // List pubspecListString2 = _pubspecListString;
  pubspecListString.removeWhere((element) => element.contains('build_runner'));
  pubspecListString
      .removeWhere((element) => element.contains('build_web_compilers'));
  for (var line in pubspecListString) {
    pubspecString = pubspecString + line + '\n';
  }
  pubspecString = pubspecString.replaceAll('dev_dependencies:',
      'dev_dependencies:\n  bouchra:\n    path: C:/Users/Kab/Desktop/dart_projects/bouchra');
  File(join(projectPath, 'pubspec.yaml'))
      .writeAsStringSync(pubspecString, mode: FileMode.write, flush: true);
}
