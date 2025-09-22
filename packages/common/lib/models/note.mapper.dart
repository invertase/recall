// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'note.dart';

class NoteMapper extends ClassMapperBase<Note> {
  NoteMapper._();

  static NoteMapper? _instance;
  static NoteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NoteMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Note';

  static String _$id(Note v) => v.id;
  static const Field<Note, String> _f$id = Field('id', _$id);
  static String _$userId(Note v) => v.userId;
  static const Field<Note, String> _f$userId = Field(
    'userId',
    _$userId,
    key: r'user_id',
  );
  static String _$title(Note v) => v.title;
  static const Field<Note, String> _f$title = Field('title', _$title);
  static String _$content(Note v) => v.content;
  static const Field<Note, String> _f$content = Field('content', _$content);
  static DateTime _$createdAt(Note v) => v.createdAt;
  static const Field<Note, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    key: r'created_at',
  );
  static DateTime _$updatedAt(Note v) => v.updatedAt;
  static const Field<Note, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    key: r'updated_at',
  );

  @override
  final MappableFields<Note> fields = const {
    #id: _f$id,
    #userId: _f$userId,
    #title: _f$title,
    #content: _f$content,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
  };

  static Note _instantiate(DecodingData data) {
    return Note(
      id: data.dec(_f$id),
      userId: data.dec(_f$userId),
      title: data.dec(_f$title),
      content: data.dec(_f$content),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Note fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Note>(map);
  }

  static Note fromJson(String json) {
    return ensureInitialized().decodeJson<Note>(json);
  }
}

mixin NoteMappable {
  String toJson() {
    return NoteMapper.ensureInitialized().encodeJson<Note>(this as Note);
  }

  Map<String, dynamic> toMap() {
    return NoteMapper.ensureInitialized().encodeMap<Note>(this as Note);
  }

  NoteCopyWith<Note, Note, Note> get copyWith =>
      _NoteCopyWithImpl<Note, Note>(this as Note, $identity, $identity);
  @override
  String toString() {
    return NoteMapper.ensureInitialized().stringifyValue(this as Note);
  }

  @override
  bool operator ==(Object other) {
    return NoteMapper.ensureInitialized().equalsValue(this as Note, other);
  }

  @override
  int get hashCode {
    return NoteMapper.ensureInitialized().hashValue(this as Note);
  }
}

extension NoteValueCopy<$R, $Out> on ObjectCopyWith<$R, Note, $Out> {
  NoteCopyWith<$R, Note, $Out> get $asNote =>
      $base.as((v, t, t2) => _NoteCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class NoteCopyWith<$R, $In extends Note, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? id,
    String? userId,
    String? title,
    String? content,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  NoteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _NoteCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Note, $Out>
    implements NoteCopyWith<$R, Note, $Out> {
  _NoteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Note> $mapper = NoteMapper.ensureInitialized();
  @override
  $R call({
    String? id,
    String? userId,
    String? title,
    String? content,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (userId != null) #userId: userId,
      if (title != null) #title: title,
      if (content != null) #content: content,
      if (createdAt != null) #createdAt: createdAt,
      if (updatedAt != null) #updatedAt: updatedAt,
    }),
  );
  @override
  Note $make(CopyWithData data) => Note(
    id: data.get(#id, or: $value.id),
    userId: data.get(#userId, or: $value.userId),
    title: data.get(#title, or: $value.title),
    content: data.get(#content, or: $value.content),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
  );

  @override
  NoteCopyWith<$R2, Note, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _NoteCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

