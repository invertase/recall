import 'package:backend/database/database.dart';
import 'package:backend/handlers/auth_handler.dart';
import 'package:backend/repositories/drift_notes_repository.dart';
import 'package:backend/repositories/drift_user_repository.dart';
import 'package:backend/services/jwt_service.dart';
import 'package:backend/services/oauth_service.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:http/http.dart';

Handler middleware(Handler handler) {
  return handler
      .use(
        provider<AuthHandler>(
          (context) => AuthHandler(
            userRepository: context.read<DriftUserRepository>(),
            oauthService: context.read<OAuthService>(),
            jwtService: context.read<JwtService>(),
          ),
        ),
      )
      .use(
        provider<DriftUserRepository>(
          (context) => DriftUserRepository(context.read<AppDatabase>()),
        ),
      )
      .use(
        provider<DriftNotesRepository>(
          (context) => DriftNotesRepository(context.read<AppDatabase>()),
        ),
      )
      .use(
        provider<OAuthService>(
          (context) => OAuthService(
            httpClient: context.read<Client>(),
          ),
        ),
      )
      .use(
        provider<JwtService>((context) => const JwtService()),
      );
}
