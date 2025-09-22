import 'package:backend/database/database.dart';
import 'package:backend/utils/auth_provider_extension.dart';
import 'package:common/models/user.dart' as models;
import 'package:drift/drift.dart';

class DriftUserRepository {
  const DriftUserRepository(this._database);

  final AppDatabase _database;

  Future<models.User> createUser(models.User user) async {
    final companion = UsersCompanion.insert(
      id: user.id,
      email: user.email,
      firstName: user.firstName,
      lastName: user.lastName,
      provider: user.provider.toDatabase(),
      providerId: user.providerId,
      avatarUrl: Value(user.avatarUrl),
      createdAt: user.createdAt,
      updatedAt: user.updatedAt,
    );

    final dbUser =
        await _database.into(_database.users).insertReturning(companion);

    return models.User(
      id: dbUser.id,
      email: dbUser.email,
      firstName: dbUser.firstName,
      lastName: dbUser.lastName,
      provider: dbUser.provider.toModel(),
      providerId: dbUser.providerId,
      avatarUrl: dbUser.avatarUrl,
      createdAt: dbUser.createdAt,
      updatedAt: dbUser.updatedAt,
    );
  }

  Future<models.User?> getUserByEmail(String email) async {
    final query = _database.select(_database.users)
      ..where((tbl) => tbl.email.equals(email));

    final result = await query.getSingleOrNull();
    if (result == null) return null;

    return models.User(
      id: result.id,
      email: result.email,
      firstName: result.firstName,
      lastName: result.lastName,
      provider: result.provider.toModel(),
      providerId: result.providerId,
      avatarUrl: result.avatarUrl,
      createdAt: result.createdAt,
      updatedAt: result.updatedAt,
    );
  }

  Future<models.User?> getUserById(String id) async {
    final query = _database.select(_database.users)
      ..where((tbl) => tbl.id.equals(id));

    final result = await query.getSingleOrNull();
    if (result == null) return null;

    return models.User(
      id: result.id,
      email: result.email,
      firstName: result.firstName,
      lastName: result.lastName,
      provider: result.provider.toModel(),
      providerId: result.providerId,
      avatarUrl: result.avatarUrl,
      createdAt: result.createdAt,
      updatedAt: result.updatedAt,
    );
  }
}
