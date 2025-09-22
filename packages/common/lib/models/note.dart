import 'package:dart_mappable/dart_mappable.dart';

part 'note.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class Note with NoteMappable {
  const Note({
    required this.id,
    required this.userId,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String userId;
  final String title;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;

  static const fromMap = NoteMapper.fromMap;
}
