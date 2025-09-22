// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'update_note_params.dart';

class UpdateNoteParamsMapper extends ClassMapperBase<UpdateNoteParams> {
  UpdateNoteParamsMapper._();

  static UpdateNoteParamsMapper? _instance;
  static UpdateNoteParamsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UpdateNoteParamsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UpdateNoteParams';

  static String? _$title(UpdateNoteParams v) => v.title;
  static const Field<UpdateNoteParams, String> _f$title = Field(
    'title',
    _$title,
  );
  static String? _$content(UpdateNoteParams v) => v.content;
  static const Field<UpdateNoteParams, String> _f$content = Field(
    'content',
    _$content,
  );

  @override
  final MappableFields<UpdateNoteParams> fields = const {
    #title: _f$title,
    #content: _f$content,
  };

  static UpdateNoteParams _instantiate(DecodingData data) {
    return UpdateNoteParams(
      title: data.dec(_f$title),
      content: data.dec(_f$content),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static UpdateNoteParams fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UpdateNoteParams>(map);
  }

  static UpdateNoteParams fromJson(String json) {
    return ensureInitialized().decodeJson<UpdateNoteParams>(json);
  }
}

mixin UpdateNoteParamsMappable {
  String toJson() {
    return UpdateNoteParamsMapper.ensureInitialized()
        .encodeJson<UpdateNoteParams>(this as UpdateNoteParams);
  }

  Map<String, dynamic> toMap() {
    return UpdateNoteParamsMapper.ensureInitialized()
        .encodeMap<UpdateNoteParams>(this as UpdateNoteParams);
  }

  UpdateNoteParamsCopyWith<UpdateNoteParams, UpdateNoteParams, UpdateNoteParams>
  get copyWith =>
      _UpdateNoteParamsCopyWithImpl<UpdateNoteParams, UpdateNoteParams>(
        this as UpdateNoteParams,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return UpdateNoteParamsMapper.ensureInitialized().stringifyValue(
      this as UpdateNoteParams,
    );
  }

  @override
  bool operator ==(Object other) {
    return UpdateNoteParamsMapper.ensureInitialized().equalsValue(
      this as UpdateNoteParams,
      other,
    );
  }

  @override
  int get hashCode {
    return UpdateNoteParamsMapper.ensureInitialized().hashValue(
      this as UpdateNoteParams,
    );
  }
}

extension UpdateNoteParamsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UpdateNoteParams, $Out> {
  UpdateNoteParamsCopyWith<$R, UpdateNoteParams, $Out>
  get $asUpdateNoteParams =>
      $base.as((v, t, t2) => _UpdateNoteParamsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UpdateNoteParamsCopyWith<$R, $In extends UpdateNoteParams, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? title, String? content});
  UpdateNoteParamsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _UpdateNoteParamsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UpdateNoteParams, $Out>
    implements UpdateNoteParamsCopyWith<$R, UpdateNoteParams, $Out> {
  _UpdateNoteParamsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UpdateNoteParams> $mapper =
      UpdateNoteParamsMapper.ensureInitialized();
  @override
  $R call({Object? title = $none, Object? content = $none}) => $apply(
    FieldCopyWithData({
      if (title != $none) #title: title,
      if (content != $none) #content: content,
    }),
  );
  @override
  UpdateNoteParams $make(CopyWithData data) => UpdateNoteParams(
    title: data.get(#title, or: $value.title),
    content: data.get(#content, or: $value.content),
  );

  @override
  UpdateNoteParamsCopyWith<$R2, UpdateNoteParams, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _UpdateNoteParamsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

