import 'package:backend/handlers/notes_handler.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context, String id) async {
  final notesHandler = context.read<NotesHandler>();
  final userId = context.read<String>();

  return switch (context.request.method) {
    HttpMethod.get => notesHandler.getNoteById(context.request, id, userId),
    HttpMethod.patch => notesHandler.updateNote(context.request, id, userId),
    HttpMethod.delete => notesHandler.deleteNote(context.request, id, userId),
    _ => Future.value(Response(statusCode: 405)),
  };
}
