import 'package:backend/services/jwt_service.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_auth/dart_frog_auth.dart';

Handler middleware(Handler handler) {
  return handler.use(
    bearerAuthentication<String>(
      authenticator: (
        RequestContext context,
        String token,
      ) async {
        final jwtService = context.read<JwtService>();

        return jwtService.authenticateFromToken(token);
      },
    ),
  );
}
