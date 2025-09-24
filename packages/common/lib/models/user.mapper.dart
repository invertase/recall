// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user.dart';

class AuthProviderMapper extends EnumMapper<AuthProvider> {
  AuthProviderMapper._();

  static AuthProviderMapper? _instance;
  static AuthProviderMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AuthProviderMapper._());
    }
    return _instance!;
  }

  static AuthProvider fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AuthProvider decode(dynamic value) {
    switch (value) {
      case r'google':
        return AuthProvider.google;
      case r'github':
        return AuthProvider.github;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(AuthProvider self) {
    switch (self) {
      case AuthProvider.google:
        return r'google';
      case AuthProvider.github:
        return r'github';
    }
  }
}

extension AuthProviderMapperExtension on AuthProvider {
  String toValue() {
    AuthProviderMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AuthProvider>(this) as String;
  }
}

class UserMapper extends ClassMapperBase<User> {
  UserMapper._();

  static UserMapper? _instance;
  static UserMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserMapper._());
      AuthProviderMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'User';

  static String _$id(User v) => v.id;
  static const Field<User, String> _f$id = Field('id', _$id);
  static String _$email(User v) => v.email;
  static const Field<User, String> _f$email = Field('email', _$email);
  static String _$firstName(User v) => v.firstName;
  static const Field<User, String> _f$firstName = Field(
    'firstName',
    _$firstName,
    key: r'first_name',
  );
  static String _$lastName(User v) => v.lastName;
  static const Field<User, String> _f$lastName = Field(
    'lastName',
    _$lastName,
    key: r'last_name',
  );
  static AuthProvider _$provider(User v) => v.provider;
  static const Field<User, AuthProvider> _f$provider = Field(
    'provider',
    _$provider,
  );
  static String _$providerId(User v) => v.providerId;
  static const Field<User, String> _f$providerId = Field(
    'providerId',
    _$providerId,
    key: r'provider_id',
  );
  static DateTime _$createdAt(User v) => v.createdAt;
  static const Field<User, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    key: r'created_at',
  );
  static DateTime _$updatedAt(User v) => v.updatedAt;
  static const Field<User, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    key: r'updated_at',
  );
  static String? _$avatarUrl(User v) => v.avatarUrl;
  static const Field<User, String> _f$avatarUrl = Field(
    'avatarUrl',
    _$avatarUrl,
    key: r'avatar_url',
    opt: true,
  );

  @override
  final MappableFields<User> fields = const {
    #id: _f$id,
    #email: _f$email,
    #firstName: _f$firstName,
    #lastName: _f$lastName,
    #provider: _f$provider,
    #providerId: _f$providerId,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #avatarUrl: _f$avatarUrl,
  };

  static User _instantiate(DecodingData data) {
    return User(
      id: data.dec(_f$id),
      email: data.dec(_f$email),
      firstName: data.dec(_f$firstName),
      lastName: data.dec(_f$lastName),
      provider: data.dec(_f$provider),
      providerId: data.dec(_f$providerId),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
      avatarUrl: data.dec(_f$avatarUrl),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static User fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<User>(map);
  }

  static User fromJson(String json) {
    return ensureInitialized().decodeJson<User>(json);
  }
}

mixin UserMappable {
  String toJson() {
    return UserMapper.ensureInitialized().encodeJson<User>(this as User);
  }

  Map<String, dynamic> toMap() {
    return UserMapper.ensureInitialized().encodeMap<User>(this as User);
  }

  UserCopyWith<User, User, User> get copyWith =>
      _UserCopyWithImpl<User, User>(this as User, $identity, $identity);
  @override
  String toString() {
    return UserMapper.ensureInitialized().stringifyValue(this as User);
  }

  @override
  bool operator ==(Object other) {
    return UserMapper.ensureInitialized().equalsValue(this as User, other);
  }

  @override
  int get hashCode {
    return UserMapper.ensureInitialized().hashValue(this as User);
  }
}

extension UserValueCopy<$R, $Out> on ObjectCopyWith<$R, User, $Out> {
  UserCopyWith<$R, User, $Out> get $asUser =>
      $base.as((v, t, t2) => _UserCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UserCopyWith<$R, $In extends User, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    AuthProvider? provider,
    String? providerId,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? avatarUrl,
  });
  UserCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, User, $Out>
    implements UserCopyWith<$R, User, $Out> {
  _UserCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<User> $mapper = UserMapper.ensureInitialized();
  @override
  $R call({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    AuthProvider? provider,
    String? providerId,
    DateTime? createdAt,
    DateTime? updatedAt,
    Object? avatarUrl = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (email != null) #email: email,
      if (firstName != null) #firstName: firstName,
      if (lastName != null) #lastName: lastName,
      if (provider != null) #provider: provider,
      if (providerId != null) #providerId: providerId,
      if (createdAt != null) #createdAt: createdAt,
      if (updatedAt != null) #updatedAt: updatedAt,
      if (avatarUrl != $none) #avatarUrl: avatarUrl,
    }),
  );
  @override
  User $make(CopyWithData data) => User(
    id: data.get(#id, or: $value.id),
    email: data.get(#email, or: $value.email),
    firstName: data.get(#firstName, or: $value.firstName),
    lastName: data.get(#lastName, or: $value.lastName),
    provider: data.get(#provider, or: $value.provider),
    providerId: data.get(#providerId, or: $value.providerId),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
    avatarUrl: data.get(#avatarUrl, or: $value.avatarUrl),
  );

  @override
  UserCopyWith<$R2, User, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _UserCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

