// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'oauth_data.dart';

class OAuthDataMapper extends ClassMapperBase<OAuthData> {
  OAuthDataMapper._();

  static OAuthDataMapper? _instance;
  static OAuthDataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OAuthDataMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'OAuthData';

  static String _$id(OAuthData v) => v.id;
  static const Field<OAuthData, String> _f$id = Field('id', _$id);
  static String _$email(OAuthData v) => v.email;
  static const Field<OAuthData, String> _f$email = Field('email', _$email);
  static String _$firstName(OAuthData v) => v.firstName;
  static const Field<OAuthData, String> _f$firstName = Field(
    'firstName',
    _$firstName,
    key: r'first_name',
  );
  static String _$lastName(OAuthData v) => v.lastName;
  static const Field<OAuthData, String> _f$lastName = Field(
    'lastName',
    _$lastName,
    key: r'last_name',
  );
  static String _$provider(OAuthData v) => v.provider;
  static const Field<OAuthData, String> _f$provider = Field(
    'provider',
    _$provider,
  );
  static String? _$avatarUrl(OAuthData v) => v.avatarUrl;
  static const Field<OAuthData, String> _f$avatarUrl = Field(
    'avatarUrl',
    _$avatarUrl,
    key: r'avatar_url',
    opt: true,
  );

  @override
  final MappableFields<OAuthData> fields = const {
    #id: _f$id,
    #email: _f$email,
    #firstName: _f$firstName,
    #lastName: _f$lastName,
    #provider: _f$provider,
    #avatarUrl: _f$avatarUrl,
  };

  static OAuthData _instantiate(DecodingData data) {
    return OAuthData(
      id: data.dec(_f$id),
      email: data.dec(_f$email),
      firstName: data.dec(_f$firstName),
      lastName: data.dec(_f$lastName),
      provider: data.dec(_f$provider),
      avatarUrl: data.dec(_f$avatarUrl),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static OAuthData fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<OAuthData>(map);
  }

  static OAuthData fromJson(String json) {
    return ensureInitialized().decodeJson<OAuthData>(json);
  }
}

mixin OAuthDataMappable {
  String toJson() {
    return OAuthDataMapper.ensureInitialized().encodeJson<OAuthData>(
      this as OAuthData,
    );
  }

  Map<String, dynamic> toMap() {
    return OAuthDataMapper.ensureInitialized().encodeMap<OAuthData>(
      this as OAuthData,
    );
  }

  OAuthDataCopyWith<OAuthData, OAuthData, OAuthData> get copyWith =>
      _OAuthDataCopyWithImpl<OAuthData, OAuthData>(
        this as OAuthData,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return OAuthDataMapper.ensureInitialized().stringifyValue(
      this as OAuthData,
    );
  }

  @override
  bool operator ==(Object other) {
    return OAuthDataMapper.ensureInitialized().equalsValue(
      this as OAuthData,
      other,
    );
  }

  @override
  int get hashCode {
    return OAuthDataMapper.ensureInitialized().hashValue(this as OAuthData);
  }
}

extension OAuthDataValueCopy<$R, $Out> on ObjectCopyWith<$R, OAuthData, $Out> {
  OAuthDataCopyWith<$R, OAuthData, $Out> get $asOAuthData =>
      $base.as((v, t, t2) => _OAuthDataCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class OAuthDataCopyWith<$R, $In extends OAuthData, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    String? provider,
    String? avatarUrl,
  });
  OAuthDataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _OAuthDataCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, OAuthData, $Out>
    implements OAuthDataCopyWith<$R, OAuthData, $Out> {
  _OAuthDataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<OAuthData> $mapper =
      OAuthDataMapper.ensureInitialized();
  @override
  $R call({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    String? provider,
    Object? avatarUrl = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (email != null) #email: email,
      if (firstName != null) #firstName: firstName,
      if (lastName != null) #lastName: lastName,
      if (provider != null) #provider: provider,
      if (avatarUrl != $none) #avatarUrl: avatarUrl,
    }),
  );
  @override
  OAuthData $make(CopyWithData data) => OAuthData(
    id: data.get(#id, or: $value.id),
    email: data.get(#email, or: $value.email),
    firstName: data.get(#firstName, or: $value.firstName),
    lastName: data.get(#lastName, or: $value.lastName),
    provider: data.get(#provider, or: $value.provider),
    avatarUrl: data.get(#avatarUrl, or: $value.avatarUrl),
  );

  @override
  OAuthDataCopyWith<$R2, OAuthData, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _OAuthDataCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

