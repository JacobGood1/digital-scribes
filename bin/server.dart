library server;

// Import from Dart's core/builtin library
import 'dart:io';
import 'dart:async';

// Import from pub.dartlang.org
import 'package:vane/vane_server.dart';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_static/shelf_static.dart';
import 'package:args/args.dart';

// Import from the "lib" director


// API at /v1/XXXX
//part 'resources/hello.dart';

// Serve static files with shelf static
part 'resources/shelf_static.dart';

// NOTE: Not a perfect solution to use a global variable, but for this sample it will do
ArgResults cmdArgs;

void main(List<String> args) {
  // Create args parser
  var parser = new ArgParser();

  // Get static dir as argument
  parser.addOption('static', defaultsTo: 'web');

  // Parse args
  cmdArgs = parser.parse(args);

  // NOTE: If the environment variable "PORT" is set, that overrides 7777 below. When deploying to Sourcevoid for
  // example the PORT variable is used so locally you can use whatever port you like.
  serve(address: '0.0.0.0', port: 7777);
}

