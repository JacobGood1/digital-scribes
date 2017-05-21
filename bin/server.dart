library server;


import 'dart:io';
import 'dart:async';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:vane/vane_server.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_static/shelf_static.dart';
import 'package:args/args.dart';
import 'package:mailer/mailer.dart';

part 'resources/handlers.dart';
part 'resources/email.dart';

Map<String, String> envVars = Platform.environment;

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
  serve(address: '0.0.0.0', port: 8080);
}

