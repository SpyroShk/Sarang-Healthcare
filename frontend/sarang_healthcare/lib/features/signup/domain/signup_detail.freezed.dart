// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignupDetail {
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get password1 => throw _privateConstructorUsedError;
  String? get password2 => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignupDetailCopyWith<SignupDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupDetailCopyWith<$Res> {
  factory $SignupDetailCopyWith(
          SignupDetail value, $Res Function(SignupDetail) then) =
      _$SignupDetailCopyWithImpl<$Res, SignupDetail>;
  @useResult
  $Res call(
      {String username, String email, String? password1, String? password2});
}

/// @nodoc
class _$SignupDetailCopyWithImpl<$Res, $Val extends SignupDetail>
    implements $SignupDetailCopyWith<$Res> {
  _$SignupDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? email = null,
    Object? password1 = freezed,
    Object? password2 = freezed,
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
      password1: freezed == password1
          ? _value.password1
          : password1 // ignore: cast_nullable_to_non_nullable
              as String?,
      password2: freezed == password2
          ? _value.password2
          : password2 // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SignupDetailCopyWith<$Res>
    implements $SignupDetailCopyWith<$Res> {
  factory _$$_SignupDetailCopyWith(
          _$_SignupDetail value, $Res Function(_$_SignupDetail) then) =
      __$$_SignupDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String username, String email, String? password1, String? password2});
}

/// @nodoc
class __$$_SignupDetailCopyWithImpl<$Res>
    extends _$SignupDetailCopyWithImpl<$Res, _$_SignupDetail>
    implements _$$_SignupDetailCopyWith<$Res> {
  __$$_SignupDetailCopyWithImpl(
      _$_SignupDetail _value, $Res Function(_$_SignupDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? email = null,
    Object? password1 = freezed,
    Object? password2 = freezed,
  }) {
    return _then(_$_SignupDetail(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password1: freezed == password1
          ? _value.password1
          : password1 // ignore: cast_nullable_to_non_nullable
              as String?,
      password2: freezed == password2
          ? _value.password2
          : password2 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_SignupDetail implements _SignupDetail {
  const _$_SignupDetail(
      {required this.username,
      required this.email,
      this.password1,
      this.password2});

  @override
  final String username;
  @override
  final String email;
  @override
  final String? password1;
  @override
  final String? password2;

  @override
  String toString() {
    return 'SignupDetail(username: $username, email: $email, password1: $password1, password2: $password2)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignupDetail &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password1, password1) ||
                other.password1 == password1) &&
            (identical(other.password2, password2) ||
                other.password2 == password2));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, username, email, password1, password2);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignupDetailCopyWith<_$_SignupDetail> get copyWith =>
      __$$_SignupDetailCopyWithImpl<_$_SignupDetail>(this, _$identity);
}

abstract class _SignupDetail implements SignupDetail {
  const factory _SignupDetail(
      {required final String username,
      required final String email,
      final String? password1,
      final String? password2}) = _$_SignupDetail;

  @override
  String get username;
  @override
  String get email;
  @override
  String? get password1;
  @override
  String? get password2;
  @override
  @JsonKey(ignore: true)
  _$$_SignupDetailCopyWith<_$_SignupDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
