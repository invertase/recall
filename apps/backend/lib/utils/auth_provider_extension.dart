import 'package:backend/database/tables.dart' as database;
import 'package:common/models/user.dart';

extension ModelAuthProviderExtension on AuthProvider {
  database.AuthProvider toDatabase() {
    switch (this) {
      case AuthProvider.google:
        return database.AuthProvider.google;
      case AuthProvider.github:
        return database.AuthProvider.github;
    }
  }
}

extension DatabaseAuthProviderExtension on database.AuthProvider {
  AuthProvider toModel() {
    switch (this) {
      case database.AuthProvider.google:
        return AuthProvider.google;
      case database.AuthProvider.github:
        return AuthProvider.github;
    }
  }
}
