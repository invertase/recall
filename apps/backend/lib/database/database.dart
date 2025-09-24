import 'package:backend/database/tables.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:sqlite3/sqlite3.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Users, Notes])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return NativeDatabase.opened(sqlite3.open('juvenile-grandson.db'));
  }
}
