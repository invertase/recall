import 'package:backend/database/database.dart';
import 'package:common/dtos/create_note_params.dart';
import 'package:common/dtos/update_note_params.dart';
import 'package:common/models/note.dart' as models;
import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

class DriftNotesRepository {
  const DriftNotesRepository(this._database);

  final AppDatabase _database;

  Future<models.Note> addNote(
    String userId,
    CreateNoteParams noteParams,
  ) async {
    final now = DateTime.now().toUtc();

    final companion = NotesCompanion.insert(
      id: const Uuid().v4(),
      userId: userId,
      title: noteParams.title,
      content: noteParams.content,
      createdAt: now,
      updatedAt: now,
    );

    final dbNote =
        await _database.into(_database.notes).insertReturning(companion);

    return models.Note(
      id: dbNote.id,
      userId: dbNote.userId,
      title: dbNote.title,
      content: dbNote.content,
      createdAt: dbNote.createdAt,
      updatedAt: dbNote.updatedAt,
    );
  }

  Future<List<models.Note>> getAllNotes(String userId) async {
    final query = _database.select(_database.notes)
      ..where((tbl) => tbl.userId.equals(userId))
      ..orderBy([(tbl) => OrderingTerm.desc(tbl.createdAt)]);

    final results = await query.get();

    return results
        .map(
          (row) => models.Note(
            id: row.id,
            userId: row.userId,
            title: row.title,
            content: row.content,
            createdAt: row.createdAt,
            updatedAt: row.updatedAt,
          ),
        )
        .toList();
  }

  Future<models.Note?> getNoteById(String id, String userId) async {
    final query = _database.select(_database.notes)
      ..where((tbl) => tbl.id.equals(id) & tbl.userId.equals(userId));

    final result = await query.getSingleOrNull();
    if (result == null) return null;

    return models.Note(
      id: result.id,
      userId: result.userId,
      title: result.title,
      content: result.content,
      createdAt: result.createdAt,
      updatedAt: result.updatedAt,
    );
  }

  Future<models.Note> updateNote(
    String id,
    String userId,
    UpdateNoteParams noteParams,
  ) async {
    final companion = NotesCompanion(
      title: noteParams.title != null
          ? Value(noteParams.title!)
          : const Value.absent(),
      content: noteParams.content != null
          ? Value(noteParams.content!)
          : const Value.absent(),
      updatedAt: Value(DateTime.now()),
    );

    await (_database.update(_database.notes)
          ..where((tbl) => tbl.id.equals(id) & tbl.userId.equals(userId)))
        .write(companion);

    final updatedNote = await getNoteById(id, userId);

    if (updatedNote == null) throw Exception('Note not found after update');

    return updatedNote;
  }

  Future<void> deleteNote(String id, String userId) async {
    await (_database.delete(_database.notes)
          ..where((tbl) => tbl.id.equals(id) & tbl.userId.equals(userId)))
        .go();
  }
}
