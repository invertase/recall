import 'package:backend/handlers/notes_handler.dart';
import 'package:backend/repositories/drift_notes_repository.dart';
import 'package:dart_frog/dart_frog.dart';

Handler middleware(Handler handler) {
  return handler.use(
    provider<NotesHandler>(
      (context) => NotesHandler(
        notesRepository: context.read<DriftNotesRepository>(),
      ),
    ),
  );
}
