// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserDetailDto _$UserDetailDtoFromJson(Map<String, dynamic> json) {
  return _UserDetailDto.fromJson(json);
}

/// @nodoc
mixin _$UserDetailDto {
  @HiveField(0)
  int get pk => throw _privateConstructorUsedError;
  @HiveField(1)
  String get username => throw _privateConstructorUsedError;
  @HiveField(2)
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDetailDtoCopyWith<UserDetailDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDetailDtoCopyWith<$Res> {
  factory $UserDetailDtoCopyWith(
          UserDetailDto value, $Res Function(UserDetailDto) then) =
      _$UserDetailDtoCopyWithImpl<$Res, UserDetailDto>;
  @useResult
  $Res call(
      {@HiveField(0) int pk,
      @HiveField(1) String username,
      @HiveField(2) String email});
}

/// @nodoc
class _$UserDetailDtoCopyWithImpl<$Res, $Val extends UserDetailDto>
    implements $UserDetailDtoCopyWith<$Res> {
  _$UserDetailDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pk = null,
    Object? username = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      pk: null == pk
          ? _value.pk
          : pk // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserDetailDtoCopyWith<$Res>
    implements $UserDetailDtoCopyWith<$Res> {
  factory _$$_UserDetailDtoCopyWith(
          _$_UserDetailDto value, $Res Function(_$_UserDetailDto) then) =
      __$$_UserDetailDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int pk,
      @HiveField(1) String username,
      @HiveField(2) String email});
}

/// @nodoc
class __$$_UserDetailDtoCopyWithImpl<$Res>
    extends _$UserDetailDtoCopyWithImpl<$Res, _$_UserDetailDto>
    implements _$$_UserDetailDtoCopyWith<$Res> {
  __$$_UserDetailDtoCopyWithImpl(
      _$_UserDetailDto _value, $Res Function(_$_UserDetailDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pk = null,
    Object? username = null,
    Object? email = null,
  }) {
    return _then(_$_UserDetailDto(
      pk: null == pk
          ? _value.pk
          : pk // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1)
class _$_UserDetailDto implements _UserDetailDto {
  const _$_UserDetailDto(
      {@HiveField(0) required this.pk,
      @HiveField(1) this.username = '',
      @HiveField(2) this.email = ''});

  factory _$_UserDetailDto.fromJson(Map<String, dynamic> json) =>
      _$$_UserDetailDtoFromJson(json);

  @override
  @HiveField(0)
  final int pk;
  @override
  @JsonKey()
  @HiveField(1)
  final String username;
  @override
  @JsonKey()
  @HiveField(2)
  final String email;

  @override
  String toString() {
    return 'UserDetailDto(pk: $pk, username: $username, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserDetailDto &&
            (identical(other.pk, pk) || other.pk == pk) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pk, username, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserDetailDtoCopyWith<_$_UserDetailDto> get copyWith =>
      __$$_UserDetailDtoCopyWithImpl<_$_UserDetailDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserDetailDtoToJson(
      this,
    );
  }
}

abstract class _UserDetailDto implements UserDetailDto {
  const factory _UserDetailDto(
      {@HiveField(0) required final int pk,
      @HiveField(1) final String username,
      @HiveField(2) final String email}) = _$_UserDetailDto;

  factory _UserDetailDto.fromJson(Map<String, dynamic> json) =
      _$_UserDetailDto.fromJson;

  @override
  @HiveField(0)
  int get pk;
  @override
  @HiveField(1)
  String get username;
  @override
  @HiveField(2)
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$_UserDetailDtoCopyWith<_$_UserDetailDto> get copyWith =>
      throw _privateConstructorUsedError;
}
