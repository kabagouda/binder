import 'dart:io';
import 'package:path/path.dart';
import 'create.dart';
import 'build.dart';
import 'run.dart';

void main(List<String> arguments) async {
  //  Arguments here will be passed from the command line .
  String currentDirectory = Directory.current.path;
  // If no arguments are passed, show the help message.
  // 1-

  if (arguments.isEmpty) {
    print(helpMessage()); //to print help message in console .
    exit(0);
  }

  //2-

  // If the first argument is create, create a new project.
  else if (arguments[0] == 'create') {
    if (arguments[1].isEmpty) {
      print('Please provide the project name.');
      exit(0);
    } else {
      String projectName =
          arguments[1]; // get the project name from the command line.
      String projectPath = join(currentDirectory,
          projectName); // get the project path by joining the current directory and the project name.
      //  Execute the create function. It will create a new project.(create.dart)
      executeCreate(projectName, currentDirectory, projectPath);
    }
  }

  //3-

  // If the first argument is run, run the project.
  else if (arguments[0] == 'run') {
    //  Execute the run function. It will run the project.(run.dart)
    executeRun();
    //TODO : Ideal should be to verify if it's binder project or not.
  }

  //4-
  
  // If the first argument is build, build the project.
  else if (arguments[0] == 'build') {
    //  Execute the build function. It will build the project.(build.dart)
    if (arguments[1] == '--release' || arguments[1] == '-r') {
      executeBuildForRelease();
    } else if (arguments[1] == '--debug' || arguments[1] == '-d') {
      executeBuildForDebug();
    } else {
      print('Invalid build argument');
      print(helpMessage());
    }
  }

  //------------------------------Other unknown command
  else {
    print('Unknown command: ${arguments[0]}');
    print(helpMessage()); //to print help message
  }
}

//-------------------------------------All messages functions here  :

//
String helpMessage() => '''
Usage: bouchra <command> [<args>];
Commands:
  create <project-name>
    Creates a new project with the given name.
  run
    Runs the web project in the browser.  (run --web is the default command.) 
  run web
    Runs the web project in the browser and automatically rebuilds it when
    necessary.  
  run server 
    Runs the server project .
  build 
    Builds the web project. (build --web is the default command.)
  build --release
    Builds the web project in release mode.  
  build --debug
    Builds the web project in debug mode.    
  help  or help -h
    Shows this message.

 ''';
