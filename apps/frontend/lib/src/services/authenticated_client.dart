import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/src/services/auth_service.dart';

final authClientProvider = Provider<http.Client>((ref) {
  final authService = ref.watch(authServiceProvider);

  return AuthenticatedClient(inner: http.Client(), authService: authService);
});

class AuthenticatedClient extends http.BaseClient {
  final http.Client _inner;
  final AuthService _authService;

  AuthenticatedClient({
    required http.Client inner,
    required AuthService authService,
  }) : _inner = inner,
       _authService = authService;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final token = _authService.getToken();

    if (token != null && !request.headers.containsKey('Authorization')) {
      request.headers['Authorization'] = 'Bearer $token';
    }

    final response = await _inner.send(request);

    if (response.statusCode == 401) {
      _authService.signOut();
    }

    return response;
  }

  @override
  void close() {
    _inner.close();
  }
}
