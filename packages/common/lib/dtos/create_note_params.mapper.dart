// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'create_note_params.dart';

class CreateNoteParamsMapper extends ClassMapperBase<CreateNoteParams> {
  CreateNoteParamsMapper._();

  static CreateNoteParamsMapper? _instance;
  static CreateNoteParamsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CreateNoteParamsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CreateNoteParams';

  static String _$title(CreateNoteParams v) => v.title;
  static const Field<CreateNoteParams, String> _f$title = Field(
    'title',
    _$title,
  );
  static String _$content(CreateNoteParams v) => v.content;
  static const Field<CreateNoteParams, String> _f$content = Field(
    'content',
    _$content,
  );

  @override
  final MappableFields<CreateNoteParams> fields = const {
    #title: _f$title,
    #content: _f$content,
  };

  static CreateNoteParams _instantiate(DecodingData data) {
    return CreateNoteParams(
      title: data.dec(_f$title),
      content: data.dec(_f$content),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static CreateNoteParams fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CreateNoteParams>(map);
  }

  static CreateNoteParams fromJson(String json) {
    return ensureInitialized().decodeJson<CreateNoteParams>(json);
  }
}

mixin CreateNoteParamsMappable {
  String toJson() {
    return CreateNoteParamsMapper.ensureInitialized()
        .encodeJson<CreateNoteParams>(this as CreateNoteParams);
  }

  Map<String, dynamic> toMap() {
    return CreateNoteParamsMapper.ensureInitialized()
        .encodeMap<CreateNoteParams>(this as CreateNoteParams);
  }

  CreateNoteParamsCopyWith<CreateNoteParams, CreateNoteParams, CreateNoteParams>
  get copyWith =>
      _CreateNoteParamsCopyWithImpl<CreateNoteParams, CreateNoteParams>(
        this as CreateNoteParams,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return CreateNoteParamsMapper.ensureInitialized().stringifyValue(
      this as CreateNoteParams,
    );
  }

  @override
  bool operator ==(Object other) {
    return CreateNoteParamsMapper.ensureInitialized().equalsValue(
      this as CreateNoteParams,
      other,
    );
  }

  @override
  int get hashCode {
    return CreateNoteParamsMapper.ensureInitialized().hashValue(
      this as CreateNoteParams,
    );
  }
}

extension CreateNoteParamsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CreateNoteParams, $Out> {
  CreateNoteParamsCopyWith<$R, CreateNoteParams, $Out>
  get $asCreateNoteParams =>
      $base.as((v, t, t2) => _CreateNoteParamsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CreateNoteParamsCopyWith<$R, $In extends CreateNoteParams, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? title, String? content});
  CreateNoteParamsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _CreateNoteParamsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CreateNoteParams, $Out>
    implements CreateNoteParamsCopyWith<$R, CreateNoteParams, $Out> {
  _CreateNoteParamsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CreateNoteParams> $mapper =
      CreateNoteParamsMapper.ensureInitialized();
  @override
  $R call({String? title, String? content}) => $apply(
    FieldCopyWithData({
      if (title != null) #title: title,
      if (content != null) #content: content,
    }),
  );
  @override
  CreateNoteParams $make(CopyWithData data) => CreateNoteParams(
    title: data.get(#title, or: $value.title),
    content: data.get(#content, or: $value.content),
  );

  @override
  CreateNoteParamsCopyWith<$R2, CreateNoteParams, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CreateNoteParamsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

