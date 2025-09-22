import 'package:backend/handlers/auth_handler.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  final authHandler = context.read<AuthHandler>();

  return switch (context.request.method) {
    HttpMethod.get => authHandler.getGitHubAuthUrl(context.request),
    _ => Future.value(Response(statusCode: 405)),
  };
}
