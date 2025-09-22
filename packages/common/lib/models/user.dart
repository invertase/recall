import 'package:dart_mappable/dart_mappable.dart';
import 'package:uuid/uuid.dart';

part 'user.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class User with UserMappable {
  const User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.provider,
    required this.providerId,
    required this.createdAt,
    required this.updatedAt,
    this.avatarUrl,
  });

  factory User.fromOAuthData({
    String? id,
    required String email,
    required String firstName,
    required String lastName,
    required AuthProvider provider,
    required String providerId,
    String? avatarUrl,
  }) {
    final now = DateTime.now().toUtc();

    return User(
      id: id ?? _uuid.v4(),
      email: email,
      firstName: firstName,
      lastName: lastName,
      provider: provider,
      providerId: providerId,
      avatarUrl: avatarUrl,
      createdAt: now,
      updatedAt: now,
    );
  }

  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final AuthProvider provider;
  final String providerId;
  final String? avatarUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  static const fromMap = UserMapper.fromMap;

  static const _uuid = Uuid();
}

@MappableEnum()
enum AuthProvider { google, github }
