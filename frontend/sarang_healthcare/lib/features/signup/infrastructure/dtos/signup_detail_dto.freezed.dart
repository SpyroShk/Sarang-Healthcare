// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignupDetailDto _$SignupDetailDtoFromJson(Map<String, dynamic> json) {
  return _SignupDetailDto.fromJson(json);
}

/// @nodoc
mixin _$SignupDetailDto {
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password1 => throw _privateConstructorUsedError;
  String get password2 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignupDetailDtoCopyWith<SignupDetailDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupDetailDtoCopyWith<$Res> {
  factory $SignupDetailDtoCopyWith(
          SignupDetailDto value, $Res Function(SignupDetailDto) then) =
      _$SignupDetailDtoCopyWithImpl<$Res, SignupDetailDto>;
  @useResult
  $Res call(
      {String username, String email, String password1, String password2});
}

/// @nodoc
class _$SignupDetailDtoCopyWithImpl<$Res, $Val extends SignupDetailDto>
    implements $SignupDetailDtoCopyWith<$Res> {
  _$SignupDetailDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? email = null,
    Object? password1 = null,
    Object? password2 = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password1: null == password1
          ? _value.password1
          : password1 // ignore: cast_nullable_to_non_nullable
              as String,
      password2: null == password2
          ? _value.password2
          : password2 // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SignupDetailDtoCopyWith<$Res>
    implements $SignupDetailDtoCopyWith<$Res> {
  factory _$$_SignupDetailDtoCopyWith(
          _$_SignupDetailDto value, $Res Function(_$_SignupDetailDto) then) =
      __$$_SignupDetailDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String username, String email, String password1, String password2});
}

/// @nodoc
class __$$_SignupDetailDtoCopyWithImpl<$Res>
    extends _$SignupDetailDtoCopyWithImpl<$Res, _$_SignupDetailDto>
    implements _$$_SignupDetailDtoCopyWith<$Res> {
  __$$_SignupDetailDtoCopyWithImpl(
      _$_SignupDetailDto _value, $Res Function(_$_SignupDetailDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? email = null,
    Object? password1 = null,
    Object? password2 = null,
  }) {
    return _then(_$_SignupDetailDto(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password1: null == password1
          ? _value.password1
          : password1 // ignore: cast_nullable_to_non_nullable
              as String,
      password2: null == password2
          ? _value.password2
          : password2 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SignupDetailDto implements _SignupDetailDto {
  const _$_SignupDetailDto(
      {required this.username,
      required this.email,
      required this.password1,
      required this.password2});

  factory _$_SignupDetailDto.fromJson(Map<String, dynamic> json) =>
      _$$_SignupDetailDtoFromJson(json);

  @override
  final String username;
  @override
  final String email;
  @override
  final String password1;
  @override
  final String password2;

  @override
  String toString() {
    return 'SignupDetailDto(username: $username, email: $email, password1: $password1, password2: $password2)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignupDetailDto &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password1, password1) ||
                other.password1 == password1) &&
            (identical(other.password2, password2) ||
                other.password2 == password2));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, username, email, password1, password2);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignupDetailDtoCopyWith<_$_SignupDetailDto> get copyWith =>
      __$$_SignupDetailDtoCopyWithImpl<_$_SignupDetailDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignupDetailDtoToJson(
      this,
    );
  }
}

abstract class _SignupDetailDto implements SignupDetailDto {
  const factory _SignupDetailDto(
      {required final String username,
      required final String email,
      required final String password1,
      required final String password2}) = _$_SignupDetailDto;

  factory _SignupDetailDto.fromJson(Map<String, dynamic> json) =
      _$_SignupDetailDto.fromJson;

  @override
  String get username;
  @override
  String get email;
  @override
  String get password1;
  @override
  String get password2;
  @override
  @JsonKey(ignore: true)
  _$$_SignupDetailDtoCopyWith<_$_SignupDetailDto> get copyWith =>
      throw _privateConstructorUsedError;
}
