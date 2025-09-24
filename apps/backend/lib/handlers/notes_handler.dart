import 'package:backend/repositories/drift_notes_repository.dart';
import 'package:backend/utils/app_response.dart';
import 'package:backend/utils/response_body.dart';
import 'package:common/dtos/create_note_params.dart';
import 'package:common/dtos/update_note_params.dart';

import 'package:dart_frog/dart_frog.dart';

class NotesHandler {
  const NotesHandler({required DriftNotesRepository notesRepository})
      : _notesRepository = notesRepository;

  final DriftNotesRepository _notesRepository;

  Future<Response> createNote(Request request, String userId) async {
    try {
      final noteData = await request.json() as Map<String, dynamic>;

      final error = CreateNoteParams.validate(noteData);
      if (error != null) {
        return AppResponse.badRequest(
          ResponseBody(success: false, message: error),
        );
      }

      final params = CreateNoteParams.fromMap({
        ...noteData,
        'user_id': userId,
      });

      final note = await _notesRepository.addNote(userId, params);

      return AppResponse.created(
        ResponseBody(
          success: true,
          message: 'Note created successfully',
          data: note,
        ),
      );
    } catch (e) {
      return AppResponse.internalServerError(
        ResponseBody(success: false, message: e.toString()),
      );
    }
  }

  Future<Response> getNotes(Request request, String userId) async {
    try {
      final notes = await _notesRepository.getAllNotes(userId);

      return AppResponse.ok(
        ResponseBody(
          success: true,
          message: 'Notes fetched successfully',
          data: notes,
        ),
      );
    } catch (e) {
      return AppResponse.internalServerError(
        ResponseBody(success: false, message: e.toString()),
      );
    }
  }

  Future<Response> getNoteById(
    Request request,
    String noteId,
    String userId,
  ) async {
    try {
      final note = await _notesRepository.getNoteById(noteId, userId);

      if (note == null) {
        return AppResponse.notFound(
          const ResponseBody(success: false, message: 'Note does not exist'),
        );
      }

      return AppResponse.ok(
        ResponseBody(
          success: true,
          message: 'Note fetched successfully',
          data: note,
        ),
      );
    } catch (e) {
      return AppResponse.internalServerError(
        ResponseBody(success: false, message: e.toString()),
      );
    }
  }

  Future<Response> updateNote(
    Request request,
    String noteId,
    String userId,
  ) async {
    try {
      final existingNote = await _notesRepository.getNoteById(noteId, userId);
      if (existingNote == null) {
        return AppResponse.notFound(
          const ResponseBody(success: false, message: 'Note does not exist'),
        );
      }

      final noteData = await request.json() as Map<String, dynamic>;

      final error = UpdateNoteParams.validate(noteData);
      if (error != null) {
        return AppResponse.badRequest(
          ResponseBody(success: false, message: error),
        );
      }

      final noteParams = UpdateNoteParams.fromMap(noteData);

      final note =
          await _notesRepository.updateNote(noteId, userId, noteParams);

      return AppResponse.ok(
        ResponseBody(
          success: true,
          message: 'Note updated successfully',
          data: note,
        ),
      );
    } catch (e) {
      return AppResponse.internalServerError(
        ResponseBody(success: false, message: e.toString()),
      );
    }
  }

  Future<Response> deleteNote(
    Request request,
    String id,
    String userId,
  ) async {
    try {
      await _notesRepository.deleteNote(id, userId);

      return AppResponse.ok(
        ResponseBody(
          success: true,
          message: 'Note deleted successfully',
          data: {'id': id},
        ),
      );
    } catch (e) {
      return AppResponse.internalServerError(
        ResponseBody(success: false, message: e.toString()),
      );
    }
  }
}
