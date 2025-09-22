import 'package:backend/handlers/notes_handler.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  final notesHandler = context.read<NotesHandler>();
  final userId = context.read<String>();

  return switch (context.request.method) {
    HttpMethod.get => notesHandler.getNotes(context.request, userId),
    HttpMethod.post => notesHandler.createNote(context.request, userId),
    _ => Future.value(Response(statusCode: 405)),
  };
}
