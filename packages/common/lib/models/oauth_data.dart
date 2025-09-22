import 'package:dart_mappable/dart_mappable.dart';

part 'oauth_data.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class OAuthData with OAuthDataMappable {
  const OAuthData({
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

  static const fromMap = OAuthDataMapper.fromMap;
}
