import 'package:common/common.dart';

class EditNoteParams {
  const EditNoteParams({this.id, required this.title, required this.content});

  final String? id;
  final String title;
  final String content;

  factory EditNoteParams.fromNote(Note note) {
    return EditNoteParams(
      id: note.id,
      title: note.title,
      content: note.content,
    );
  }

  factory EditNoteParams.empty() {
    return const EditNoteParams(id: null, title: '', content: '');
  }

  EditNoteParams copyWith({
    ValueGetter<String?>? id,
    String? title,
    String? content,
  }) {
    return EditNoteParams(
      id: id != null ? id() : this.id,
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }

  @override
  String toString() {
    return 'EditNoteParams(id: $id, title: $title, content: $content)';
  }
}

typedef ValueGetter<T> = T Function();
