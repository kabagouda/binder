import 'dart:io' show Directory, Process;
void executeGetPub() async {
  // var process = 
  await Process.run(
        'dart',
        [
          'pub',
          'get',
        ],
        runInShell: true,
        workingDirectory: Directory.current.path);
}


//build.yaml create , update or clean
//build folder update or clean