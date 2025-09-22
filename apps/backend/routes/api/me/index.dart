import 'package:backend/handlers/auth_handler.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  final authHandler = context.read<AuthHandler>();
  final userId = context.read<String>();

  return switch (context.request.method) {
    HttpMethod.get => await authHandler.getCurrentUser(context.request, userId),
    _ => Response(statusCode: 405),
  };
}
