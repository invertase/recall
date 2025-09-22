import 'dart:io';

import 'package:backend/config/environment.dart';
import 'package:backend/database/database.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:http/http.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart';

late AppDatabase _database;

Future<void> init(InternetAddress ip, int port) async {
  Environment.init();

  _database = AppDatabase();
}

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) {
  final finalHandler = handler
      .use(provider<Client>((context) => Client()))
      .use(provider<AppDatabase>((_) => _database))
      .use(fromShelfMiddleware(corsHeaders()))
      .use(requestLogger());

  return serve(finalHandler, ip, port);
}
