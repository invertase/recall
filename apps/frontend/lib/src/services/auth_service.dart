import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/src/config/environment.dart';
import 'package:http/http.dart';
import 'package:native_storage/native_storage.dart';
import 'package:url_launcher/url_launcher.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(http: Client(), storage: NativeStorage());
});

class AuthService {
  const AuthService({required Client http, required NativeStorage storage})
    : _http = http,
      _storage = storage;

  final Client _http;
  final NativeStorage _storage;

  String get _baseUrl => Environment.apiUrl;
  static const String _tokenKey = 'access_token';

  Future<void> signInWithGoogle() async {
    final response = await _http.get(
      Uri.parse('$_baseUrl/auth/google'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to get Google auth URL');
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final authUrl = data['data']['url'] as String;

    await launchUrl(Uri.parse(authUrl), webOnlyWindowName: '_self');
  }

  Future<void> signInWithGitHub() async {
    final response = await _http.get(
      Uri.parse('$_baseUrl/auth/github'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to get GitHub auth URL');
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final authUrl = data['data']['url'] as String;

    await launchUrl(Uri.parse(authUrl), webOnlyWindowName: '_self');
  }

  void saveToken(String token) => _storage.write(_tokenKey, token);

  void signOut() => _storage.delete(_tokenKey);

  String? getToken() => _storage.read(_tokenKey);
}
