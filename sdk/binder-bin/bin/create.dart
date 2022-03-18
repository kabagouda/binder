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
        //    1-------Creating of lib/main.dart
        File(join(projectName, 'lib', 'main.dart'))
          ..createSync(recursive: true)
          ..writeAsStringSync('''//Coming soon\n\n ''');

        //   2-------ReWriting of pubspec.yaml

        reWritePubspecYaml(projectPath);

        //   3-------Update of bin/server.dart

        File(join(projectName, 'bin', 'server.dart'))
            .writeAsStringSync('''//Coming soon\n\n''');

        //    4-------Update of test/server_test.dart
        File(join(projectName, 'test', 'server_test.dart'))
            .writeAsStringSync('''//Coming soon\n\n''');

        //    5-------Update of Readme.md
        File(join(projectName, 'README.md')).writeAsStringSync(
            '''# $projectName\n\n This is a simple project to get started with Binder.\n\n## How to get started\n\n 1. Clone the repository\n 2. Run `binder pub get`\n 3. Run `binder run`\n 4. Enjoy!\n\n## Contributing\n\n If you have any questions or suggestions, please open an issue .\n\n## License\n\n This project is licensed under the MIT License.\n\n## Author\n\n [Kab  Agouda]('https://twitter.com/kabagouda')\n''');

        //     6--------Update web/index.html
        reWriteIndexHtml(projectPath);
        
        //     7-------Remove web/style.css
        //     9--------Replace web/main.dart
        //     10-------Add live.js
        //     11-------Add css Folder
        //     12-------Add JS folder

        ///TODO : Update the web folder : index.html(bootsprap) , style.css(delete or not) and other . Perhaps use the builder

        // -------Succesfully message

        print(successfulMessage(
            projectName, projectPath, stopwatch.elapsedMilliseconds));
        stopwatch.stop();
      }
    } else {
      print('Something went wrong when creating the project');
    }
  }
  exit(0);
}


//         For pubspecContainingMessage
void reWritePubspecYaml(String projectPath) {
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
      'dev_dependencies:\n  binder:\n    git:\n        url: git://github.com/kabagouda/binder.git\n                path: package/binder');
  File(join(projectPath, 'pubspec.yaml'))
      .writeAsStringSync(pubspecString, mode: FileMode.write, flush: true);
}

void reWriteIndexHtml(String projectPath) {
  String indexString =  File('bin/assets/web/index.html').readAsStringSync();
  indexString = indexString.replaceAll('<head>', '<head>\n<link rel="stylesheet" href="style.css" kab>');
  File(join(projectPath, 'web/index.html'))
      .writeAsStringSync(indexString, mode: FileMode.write, flush: true);
}




































//--------------------------------- Message ---------------------------------
String successfulMessage(String projectName, String projectPath, int stopWatch) =>
    '''
All done!                              $stopWatch ms
In order to run your project, type:

  \$ cd $projectName
  \$ binder run

Your Project code is in ${join(projectName, 'lib', 'main.dart')}.

''';
