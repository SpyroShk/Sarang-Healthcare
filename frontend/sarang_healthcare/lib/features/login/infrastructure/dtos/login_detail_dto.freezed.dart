// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginDetailDto _$LoginDetailDtoFromJson(Map<String, dynamic> json) {
  return _LoginDetailDto.fromJson(json);
}

/// @nodoc
mixin _$LoginDetailDto {
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginDetailDtoCopyWith<LoginDetailDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginDetailDtoCopyWith<$Res> {
  factory $LoginDetailDtoCopyWith(
          LoginDetailDto value, $Res Function(LoginDetailDto) then) =
      _$LoginDetailDtoCopyWithImpl<$Res, LoginDetailDto>;
  @useResult
  $Res call({String username, String password});
}

/// @nodoc
class _$LoginDetailDtoCopyWithImpl<$Res, $Val extends LoginDetailDto>
    implements $LoginDetailDtoCopyWith<$Res> {
  _$LoginDetailDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginDetailDtoCopyWith<$Res>
    implements $LoginDetailDtoCopyWith<$Res> {
  factory _$$_LoginDetailDtoCopyWith(
          _$_LoginDetailDto value, $Res Function(_$_LoginDetailDto) then) =
      __$$_LoginDetailDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username, String password});
}

/// @nodoc
class __$$_LoginDetailDtoCopyWithImpl<$Res>
    extends _$LoginDetailDtoCopyWithImpl<$Res, _$_LoginDetailDto>
    implements _$$_LoginDetailDtoCopyWith<$Res> {
  __$$_LoginDetailDtoCopyWithImpl(
      _$_LoginDetailDto _value, $Res Function(_$_LoginDetailDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_$_LoginDetailDto(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoginDetailDto implements _LoginDetailDto {
  const _$_LoginDetailDto({required this.username, required this.password});

  factory _$_LoginDetailDto.fromJson(Map<String, dynamic> json) =>
      _$$_LoginDetailDtoFromJson(json);

  @override
  final String username;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginDetailDto(username: $username, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginDetailDto &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, username, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginDetailDtoCopyWith<_$_LoginDetailDto> get copyWith =>
      __$$_LoginDetailDtoCopyWithImpl<_$_LoginDetailDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginDetailDtoToJson(
      this,
    );
  }
}

abstract class _LoginDetailDto implements LoginDetailDto {
  const factory _LoginDetailDto(
      {required final String username,
      required final String password}) = _$_LoginDetailDto;

  factory _LoginDetailDto.fromJson(Map<String, dynamic> json) =
      _$_LoginDetailDto.fromJson;

  @override
  String get username;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_LoginDetailDtoCopyWith<_$_LoginDetailDto> get copyWith =>
      throw _privateConstructorUsedError;
}
