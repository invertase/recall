import 'dart:convert';

import 'package:backend/config/environment.dart';
import 'package:backend/utils/string_extension.dart';
import 'package:common/models/oauth_data.dart';
import 'package:common/models/user.dart';
import 'package:http/http.dart';
import 'package:uuid/uuid.dart';

class OAuthService {
  const OAuthService({required Client httpClient}) : _client = httpClient;

  final Client _client;

  Map<String, String> getGitHubAuthUrl() {
    final state = 'github_${const Uuid().v4()}';
    final uri = Uri.https('github.com', '/login/oauth/authorize', {
      'client_id': Environment.githubClientId,
      'redirect_uri': '${Environment.baseUrl}/auth/github/callback',
      'scope': 'read:user user:email',
      'state': state,
    });

    return {'url': uri.toString(), 'state': state};
  }

  Map<String, String> getGoogleAuthUrl() {
    final state = 'google_${const Uuid().v4()}';
    final uri = Uri.https('accounts.google.com', '/o/oauth2/v2/auth', {
      'client_id': Environment.googleClientId,
      'redirect_uri': '${Environment.baseUrl}/auth/google/callback',
      'response_type': 'code',
      'scope': 'openid email profile',
      'state': state,
    });

    return {'url': uri.toString(), 'state': state};
  }

  Future<OAuthData> authenticateWithGoogle(String code) async {
    try {
      final tokenResponse = await _client.post(
        Uri.parse('https://oauth2.googleapis.com/token'),
        body: {
          'client_id': Environment.googleClientId,
          'client_secret': Environment.googleClientSecret,
          'code': code,
          'grant_type': 'authorization_code',
          'redirect_uri': '${Environment.baseUrl}/auth/google/callback',
        },
      );

      if (tokenResponse.statusCode != 200) {
        throw Exception('Failed to get access token: ${tokenResponse.body}');
      }

      final tokenData = jsonDecode(tokenResponse.body) as Map<String, dynamic>;
      final accessToken = tokenData['access_token'] as String;

      final userInfoResponse = await _client.get(
        Uri.parse('https://www.googleapis.com/oauth2/v2/userinfo'),
        headers: {'Authorization': 'Bearer $accessToken'},
      );

      if (userInfoResponse.statusCode != 200) {
        throw Exception('Failed to get user info: ${userInfoResponse.body}');
      }

      final userData =
          jsonDecode(userInfoResponse.body) as Map<String, dynamic>;

      final user = User.fromOAuthData(
        email: userData['email'] as String,
        firstName: userData['given_name'] as String,
        lastName: userData['family_name'] as String,
        provider: AuthProvider.google,
        providerId: userData['id'].toString(),
        avatarUrl: userData['picture'] as String?,
      );

      return OAuthData(
        id: user.id,
        email: user.email,
        firstName: user.firstName,
        lastName: user.lastName,
        provider: user.provider.name,
        avatarUrl: user.avatarUrl,
      );
    } catch (e) {
      throw Exception('Google authentication failed: $e');
    }
  }

  Future<OAuthData> authenticateWithGitHub(String code) async {
    try {
      final tokenResponse = await _client.post(
        Uri.parse('https://github.com/login/oauth/access_token'),
        headers: {'Accept': 'application/json'},
        body: {
          'client_id': Environment.githubClientId,
          'client_secret': Environment.githubClientSecret,
          'code': code,
          'redirect_uri': '${Environment.baseUrl}/auth/github/callback',
        },
      );

      if (tokenResponse.statusCode != 200) {
        throw Exception('Failed to get access token: ${tokenResponse.body}');
      }

      final tokenData = jsonDecode(tokenResponse.body) as Map<String, dynamic>;
      final accessToken = tokenData['access_token'] as String;

      final userInfoResponse = await _client.get(
        Uri.parse('https://api.github.com/user'),
        headers: {'Authorization': 'Bearer $accessToken'},
      );

      if (userInfoResponse.statusCode != 200) {
        throw Exception('Failed to get user info: ${userInfoResponse.body}');
      }

      final userData =
          jsonDecode(userInfoResponse.body) as Map<String, dynamic>;

      var email = userData['email'] as String?;
      email ??= await _fetchPrimaryGitHubEmail(accessToken);

      if (email == null) {
        throw Exception(
          'Could not retrieve a verified, primary email from GitHub.',
        );
      }

      final name = userData['name'] as String? ?? userData['login'] as String;
      final (firstName, lastName) = name.splitName();

      final user = User.fromOAuthData(
        email: email,
        firstName: firstName,
        lastName: lastName,
        provider: AuthProvider.github,
        providerId: userData['id'].toString(),
        avatarUrl: userData['avatar_url'] as String?,
      );

      return OAuthData(
        id: user.id,
        email: user.email,
        firstName: user.firstName,
        lastName: user.lastName,
        provider: user.provider.name,
        avatarUrl: user.avatarUrl,
      );
    } catch (e) {
      throw Exception('GitHub authentication failed: $e');
    }
  }

  Future<String?> _fetchPrimaryGitHubEmail(String accessToken) async {
    final emailsResponse = await _client.get(
      Uri.parse('https://api.github.com/user/emails'),
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (emailsResponse.statusCode != 200) return null;

    final emailsData = jsonDecode(emailsResponse.body) as List;
    final primaryEmails = emailsData.cast<Map<String, dynamic>>().where(
      (email) => email['primary'] == true && email['verified'] == true,
    );
    final primaryEmail = primaryEmails.isNotEmpty ? primaryEmails.first : null;

    return primaryEmail?['email'] as String?;
  }
}
