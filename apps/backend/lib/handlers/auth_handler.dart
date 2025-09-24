import 'package:backend/config/environment.dart';
import 'package:backend/repositories/drift_user_repository.dart';
import 'package:backend/services/jwt_service.dart';
import 'package:backend/services/oauth_service.dart';
import 'package:backend/utils/app_response.dart';
import 'package:backend/utils/response_body.dart';
import 'package:common/models/user.dart';
import 'package:dart_frog/dart_frog.dart';

class AuthHandler {
  const AuthHandler({
    required DriftUserRepository userRepository,
    required OAuthService oauthService,
    required JwtService jwtService,
  }) : _userRepository = userRepository,
       _oauthService = oauthService,
       _jwtService = jwtService;

  final OAuthService _oauthService;
  final DriftUserRepository _userRepository;
  final JwtService _jwtService;

  Future<Response> getGoogleAuthUrl(Request request) async {
    try {
      final authData = _oauthService.getGoogleAuthUrl();

      return AppResponse.ok(
        ResponseBody(
          success: true,
          message: 'Google auth URL generated',
          data: authData,
        ),
      );
    } catch (e) {
      return AppResponse.internalServerError(
        ResponseBody(success: false, message: e.toString()),
      );
    }
  }

  Future<Response> getGitHubAuthUrl(Request request) async {
    try {
      final authData = _oauthService.getGitHubAuthUrl();

      return AppResponse.ok(
        ResponseBody(
          success: true,
          message: 'GitHub auth URL generated',
          data: authData,
        ),
      );
    } catch (e) {
      return AppResponse.internalServerError(
        ResponseBody(success: false, message: e.toString()),
      );
    }
  }

  Future<Response> handleGoogleCallback(Request request) async {
    try {
      final code = request.uri.queryParameters['code'];
      if (code == null) {
        return _handleErrorRedirect('Authorization code is required');
      }

      final oauthData = await _oauthService.authenticateWithGoogle(code);
      final existingUser = await _userRepository.getUserByEmail(
        oauthData.email,
      );

      User user;

      if (existingUser == null) {
        user = User.fromOAuthData(
          id: oauthData.id,
          email: oauthData.email,
          firstName: oauthData.firstName,
          lastName: oauthData.lastName,
          provider: AuthProvider.google,
          providerId: oauthData.id,
          avatarUrl: oauthData.avatarUrl,
        );

        await _userRepository.createUser(user);
      } else {
        user = existingUser;
      }

      final token = _jwtService.createToken(user);

      return _handleTokenRedirect(token);
    } catch (e) {
      return _handleErrorRedirect(e.toString());
    }
  }

  Future<Response> handleGitHubCallback(Request request) async {
    try {
      final code = request.uri.queryParameters['code'];
      if (code == null) {
        return _handleErrorRedirect('Authorization code is required');
      }

      final oauthData = await _oauthService.authenticateWithGitHub(code);
      final existingUser = await _userRepository.getUserByEmail(
        oauthData.email,
      );

      User user;

      if (existingUser == null) {
        user = User.fromOAuthData(
          id: oauthData.id,
          email: oauthData.email,
          firstName: oauthData.firstName,
          lastName: oauthData.lastName,
          provider: AuthProvider.github,
          providerId: oauthData.id,
          avatarUrl: oauthData.avatarUrl,
        );
        await _userRepository.createUser(user);
      } else {
        user = existingUser;
      }

      final token = _jwtService.createToken(user);

      return _handleTokenRedirect(token);
    } catch (e) {
      return _handleErrorRedirect(e.toString());
    }
  }

  Future<Response> getCurrentUser(Request request, String userId) async {
    try {
      final user = await _userRepository.getUserById(userId);

      if (user == null) {
        return AppResponse.notFound(
          const ResponseBody(success: false, message: 'User not found'),
        );
      }

      return AppResponse.ok(
        ResponseBody(
          success: true,
          message: 'User retrieved successfully',
          data: user.toMap(),
        ),
      );
    } catch (e) {
      return AppResponse.internalServerError(
        ResponseBody(success: false, message: e.toString()),
      );
    }
  }

  Response _handleTokenRedirect(String token) {
    final redirectUrl = Uri.parse(
      Environment.clientUrl,
    ).replace(queryParameters: {'token': token});

    return AppResponse.found(redirectUri: redirectUrl);
  }

  Response _handleErrorRedirect(String error) {
    final redirectUrl = Uri.parse(
      Environment.clientUrl,
    ).replace(queryParameters: {'error': Uri.encodeComponent(error)});

    return AppResponse.found(redirectUri: redirectUrl);
  }
}
