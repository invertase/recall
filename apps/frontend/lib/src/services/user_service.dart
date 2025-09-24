import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/src/config/environment.dart';
import 'package:frontend/src/services/authenticated_client.dart';
import 'package:http/http.dart' as http;
import 'package:common/common.dart';

final userServiceProvider = Provider<UserService>((ref) {
  final authClient = ref.watch(authClientProvider);

  return UserService(http: authClient);
});

class UserService {
  const UserService({required http.Client http}) : _http = http;

  final http.Client _http;

  String get _baseUrl => Environment.apiUrl;

  Future<User> getMyProfile() async {
    final response = await _http.get(
      Uri.parse('$_baseUrl/api/me'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final userData = data['data'] as Map<String, dynamic>;
      return User.fromMap(userData);
    } else {
      throw Exception('Failed to load profile');
    }
  }
}
