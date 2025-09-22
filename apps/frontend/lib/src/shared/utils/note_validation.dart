import 'package:frontend/src/models/edit_note_params.dart';

class NoteValidationError {
  const NoteValidationError(this.message);
  final String message;
}

class NoteValidationException implements Exception {
  const NoteValidationException(this.message);
  final String message;

  @override
  String toString() => message;
}

class NoteValidator {
  static const int minTitleLength = 3;
  static const int maxTitleLength = 100;
  static const int minContentLength = 3;
  static const int maxContentLength = 10000;

  static NoteValidationError? validateTitle(String title) {
    if (title.trim().isEmpty) {
      return const NoteValidationError('Title cannot be empty');
    }

    if (title.trim().length < minTitleLength) {
      return const NoteValidationError(
        'Title must be at least $minTitleLength character long',
      );
    }

    if (title.length > maxTitleLength) {
      return const NoteValidationError(
        'Title cannot exceed $maxTitleLength characters',
      );
    }

    return null;
  }

  static NoteValidationError? validateContent(String content) {
    if (content.trim().isEmpty) {
      return const NoteValidationError('Content cannot be empty');
    }

    if (content.trim().length < minContentLength) {
      return const NoteValidationError(
        'Content must be at least $minContentLength character long',
      );
    }

    if (content.length > maxContentLength) {
      return const NoteValidationError(
        'Content cannot exceed $maxContentLength characters',
      );
    }

    return null;
  }

  static NoteValidationError? validateNote(EditNoteParams note) {
    final titleError = validateTitle(note.title);
    if (titleError != null) return titleError;

    final contentError = validateContent(note.content);
    if (contentError != null) return contentError;

    return null;
  }
}
