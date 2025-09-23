import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/src/config/environment.dart';
import 'package:frontend/src/services/authenticated_client.dart';
import 'package:http/http.dart' as http;
import 'package:common/common.dart';

final notesServiceProvider = Provider<NotesService>((ref) {
  final authClient = ref.watch(authClientProvider);

  return NotesService(http: authClient);
});

class NotesService {
  const NotesService({required http.Client http}) : _http = http;

  final http.Client _http;

  String get _baseUrl => Environment.apiUrl;

  Future<List<Note>> getNotes() async {
    try {
      final response = await _http.get(
        Uri.parse('$_baseUrl/api/notes'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        if (data['success'] == true) {
          final notesData = data['data'] as List;
          return notesData.map((noteJson) => Note.fromMap(noteJson)).toList();
        }
      }

      throw Exception('Failed to fetch notes: ${response.body}');
    } catch (e) {
      throw Exception('Failed to fetch notes: $e');
    }
  }

  Future<Note> createNote({
    required String title,
    required String content,
  }) async {
    try {
      final response = await _http.post(
        Uri.parse('$_baseUrl/api/notes'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'title': title, 'content': content}),
      );

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;

        if (data['success'] == true) {
          return Note.fromMap(data['data']);
        }
      }

      throw Exception('Failed to create note: ${response.body}');
    } catch (e) {
      throw Exception('Failed to create note: $e');
    }
  }

  Future<Note> getNote(String id) async {
    try {
      final response = await _http.get(
        Uri.parse('$_baseUrl/api/notes/$id'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        if (data['success'] == true) {
          return Note.fromMap(data['data']);
        }
      }

      throw Exception('Failed to fetch note: ${response.body}');
    } catch (e) {
      throw Exception('Failed to fetch note: $e');
    }
  }

  Future<Note> updateNote({
    required String id,
    String? title,
    String? content,
  }) async {
    final body = <String, dynamic>{};
    if (title != null) body['title'] = title;
    if (content != null) body['content'] = content;

    final response = await _http.patch(
      Uri.parse('$_baseUrl/api/notes/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      if (data['success'] == true) {
        return Note.fromMap(data['data']);
      }
    }
    throw Exception('Failed to update note: ${response.body}');
  }

  Future<void> deleteNote(String id) async {
    try {
      final response = await _http.delete(
        Uri.parse('$_baseUrl/api/notes/$id'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to delete note: ${response.body}');
      }
    } catch (e) {
      throw Exception('Failed to delete note: $e');
    }
  }
}
