import 'package:dart_mappable/dart_mappable.dart';

part 'oauth_response.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class OAuthResponse with OAuthResponseMappable {
  const OAuthResponse({
    required this.accessToken,
    required this.user,
  });

  final String accessToken;
  final UserResponse user;

  static const fromMap = OAuthResponseMapper.fromMap;
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class UserResponse with UserResponseMappable {
  const UserResponse({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.provider,
    this.avatarUrl,
  });

  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String provider;
  final String? avatarUrl;

  static const fromMap = UserResponseMapper.fromMap;
}
