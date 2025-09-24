// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'oauth_response.dart';

class OAuthResponseMapper extends ClassMapperBase<OAuthResponse> {
  OAuthResponseMapper._();

  static OAuthResponseMapper? _instance;
  static OAuthResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OAuthResponseMapper._());
      UserResponseMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'OAuthResponse';

  static String _$accessToken(OAuthResponse v) => v.accessToken;
  static const Field<OAuthResponse, String> _f$accessToken = Field(
    'accessToken',
    _$accessToken,
    key: r'access_token',
  );
  static UserResponse _$user(OAuthResponse v) => v.user;
  static const Field<OAuthResponse, UserResponse> _f$user = Field(
    'user',
    _$user,
  );

  @override
  final MappableFields<OAuthResponse> fields = const {
    #accessToken: _f$accessToken,
    #user: _f$user,
  };

  static OAuthResponse _instantiate(DecodingData data) {
    return OAuthResponse(
      accessToken: data.dec(_f$accessToken),
      user: data.dec(_f$user),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static OAuthResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<OAuthResponse>(map);
  }

  static OAuthResponse fromJson(String json) {
    return ensureInitialized().decodeJson<OAuthResponse>(json);
  }
}

mixin OAuthResponseMappable {
  String toJson() {
    return OAuthResponseMapper.ensureInitialized().encodeJson<OAuthResponse>(
      this as OAuthResponse,
    );
  }

  Map<String, dynamic> toMap() {
    return OAuthResponseMapper.ensureInitialized().encodeMap<OAuthResponse>(
      this as OAuthResponse,
    );
  }

  OAuthResponseCopyWith<OAuthResponse, OAuthResponse, OAuthResponse>
  get copyWith => _OAuthResponseCopyWithImpl<OAuthResponse, OAuthResponse>(
    this as OAuthResponse,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return OAuthResponseMapper.ensureInitialized().stringifyValue(
      this as OAuthResponse,
    );
  }

  @override
  bool operator ==(Object other) {
    return OAuthResponseMapper.ensureInitialized().equalsValue(
      this as OAuthResponse,
      other,
    );
  }

  @override
  int get hashCode {
    return OAuthResponseMapper.ensureInitialized().hashValue(
      this as OAuthResponse,
    );
  }
}

extension OAuthResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, OAuthResponse, $Out> {
  OAuthResponseCopyWith<$R, OAuthResponse, $Out> get $asOAuthResponse =>
      $base.as((v, t, t2) => _OAuthResponseCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class OAuthResponseCopyWith<$R, $In extends OAuthResponse, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  UserResponseCopyWith<$R, UserResponse, UserResponse> get user;
  $R call({String? accessToken, UserResponse? user});
  OAuthResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _OAuthResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, OAuthResponse, $Out>
    implements OAuthResponseCopyWith<$R, OAuthResponse, $Out> {
  _OAuthResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<OAuthResponse> $mapper =
      OAuthResponseMapper.ensureInitialized();
  @override
  UserResponseCopyWith<$R, UserResponse, UserResponse> get user =>
      $value.user.copyWith.$chain((v) => call(user: v));
  @override
  $R call({String? accessToken, UserResponse? user}) => $apply(
    FieldCopyWithData({
      if (accessToken != null) #accessToken: accessToken,
      if (user != null) #user: user,
    }),
  );
  @override
  OAuthResponse $make(CopyWithData data) => OAuthResponse(
    accessToken: data.get(#accessToken, or: $value.accessToken),
    user: data.get(#user, or: $value.user),
  );

  @override
  OAuthResponseCopyWith<$R2, OAuthResponse, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _OAuthResponseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class UserResponseMapper extends ClassMapperBase<UserResponse> {
  UserResponseMapper._();

  static UserResponseMapper? _instance;
  static UserResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserResponseMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserResponse';

  static String _$id(UserResponse v) => v.id;
  static const Field<UserResponse, String> _f$id = Field('id', _$id);
  static String _$email(UserResponse v) => v.email;
  static const Field<UserResponse, String> _f$email = Field('email', _$email);
  static String _$firstName(UserResponse v) => v.firstName;
  static const Field<UserResponse, String> _f$firstName = Field(
    'firstName',
    _$firstName,
    key: r'first_name',
  );
  static String _$lastName(UserResponse v) => v.lastName;
  static const Field<UserResponse, String> _f$lastName = Field(
    'lastName',
    _$lastName,
    key: r'last_name',
  );
  static String _$provider(UserResponse v) => v.provider;
  static const Field<UserResponse, String> _f$provider = Field(
    'provider',
    _$provider,
  );
  static String? _$avatarUrl(UserResponse v) => v.avatarUrl;
  static const Field<UserResponse, String> _f$avatarUrl = Field(
    'avatarUrl',
    _$avatarUrl,
    key: r'avatar_url',
    opt: true,
  );

  @override
  final MappableFields<UserResponse> fields = const {
    #id: _f$id,
    #email: _f$email,
    #firstName: _f$firstName,
    #lastName: _f$lastName,
    #provider: _f$provider,
    #avatarUrl: _f$avatarUrl,
  };

  static UserResponse _instantiate(DecodingData data) {
    return UserResponse(
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

  static UserResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserResponse>(map);
  }

  static UserResponse fromJson(String json) {
    return ensureInitialized().decodeJson<UserResponse>(json);
  }
}

mixin UserResponseMappable {
  String toJson() {
    return UserResponseMapper.ensureInitialized().encodeJson<UserResponse>(
      this as UserResponse,
    );
  }

  Map<String, dynamic> toMap() {
    return UserResponseMapper.ensureInitialized().encodeMap<UserResponse>(
      this as UserResponse,
    );
  }

  UserResponseCopyWith<UserResponse, UserResponse, UserResponse> get copyWith =>
      _UserResponseCopyWithImpl<UserResponse, UserResponse>(
        this as UserResponse,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return UserResponseMapper.ensureInitialized().stringifyValue(
      this as UserResponse,
    );
  }

  @override
  bool operator ==(Object other) {
    return UserResponseMapper.ensureInitialized().equalsValue(
      this as UserResponse,
      other,
    );
  }

  @override
  int get hashCode {
    return UserResponseMapper.ensureInitialized().hashValue(
      this as UserResponse,
    );
  }
}

extension UserResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserResponse, $Out> {
  UserResponseCopyWith<$R, UserResponse, $Out> get $asUserResponse =>
      $base.as((v, t, t2) => _UserResponseCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UserResponseCopyWith<$R, $In extends UserResponse, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    String? provider,
    String? avatarUrl,
  });
  UserResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserResponse, $Out>
    implements UserResponseCopyWith<$R, UserResponse, $Out> {
  _UserResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserResponse> $mapper =
      UserResponseMapper.ensureInitialized();
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
  UserResponse $make(CopyWithData data) => UserResponse(
    id: data.get(#id, or: $value.id),
    email: data.get(#email, or: $value.email),
    firstName: data.get(#firstName, or: $value.firstName),
    lastName: data.get(#lastName, or: $value.lastName),
    provider: data.get(#provider, or: $value.provider),
    avatarUrl: data.get(#avatarUrl, or: $value.avatarUrl),
  );

  @override
  UserResponseCopyWith<$R2, UserResponse, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _UserResponseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

