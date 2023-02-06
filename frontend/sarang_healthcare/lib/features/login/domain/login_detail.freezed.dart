// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginDetail {
  String get usernameEmail => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginDetailCopyWith<LoginDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginDetailCopyWith<$Res> {
  factory $LoginDetailCopyWith(
          LoginDetail value, $Res Function(LoginDetail) then) =
      _$LoginDetailCopyWithImpl<$Res, LoginDetail>;
  @useResult
  $Res call({String usernameEmail, String? password});
}

/// @nodoc
class _$LoginDetailCopyWithImpl<$Res, $Val extends LoginDetail>
    implements $LoginDetailCopyWith<$Res> {
  _$LoginDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usernameEmail = null,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      usernameEmail: null == usernameEmail
          ? _value.usernameEmail
          : usernameEmail // ignore: cast_nullable_to_non_nullable
              as String,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginDetailCopyWith<$Res>
    implements $LoginDetailCopyWith<$Res> {
  factory _$$_LoginDetailCopyWith(
          _$_LoginDetail value, $Res Function(_$_LoginDetail) then) =
      __$$_LoginDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String usernameEmail, String? password});
}

/// @nodoc
class __$$_LoginDetailCopyWithImpl<$Res>
    extends _$LoginDetailCopyWithImpl<$Res, _$_LoginDetail>
    implements _$$_LoginDetailCopyWith<$Res> {
  __$$_LoginDetailCopyWithImpl(
      _$_LoginDetail _value, $Res Function(_$_LoginDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usernameEmail = null,
    Object? password = freezed,
  }) {
    return _then(_$_LoginDetail(
      usernameEmail: null == usernameEmail
          ? _value.usernameEmail
          : usernameEmail // ignore: cast_nullable_to_non_nullable
              as String,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_LoginDetail implements _LoginDetail {
  const _$_LoginDetail({required this.usernameEmail, this.password});

  @override
  final String usernameEmail;
  @override
  final String? password;

  @override
  String toString() {
    return 'LoginDetail(usernameEmail: $usernameEmail, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginDetail &&
            (identical(other.usernameEmail, usernameEmail) ||
                other.usernameEmail == usernameEmail) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, usernameEmail, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginDetailCopyWith<_$_LoginDetail> get copyWith =>
      __$$_LoginDetailCopyWithImpl<_$_LoginDetail>(this, _$identity);
}

abstract class _LoginDetail implements LoginDetail {
  const factory _LoginDetail(
      {required final String usernameEmail,
      final String? password}) = _$_LoginDetail;

  @override
  String get usernameEmail;
  @override
  String? get password;
  @override
  @JsonKey(ignore: true)
  _$$_LoginDetailCopyWith<_$_LoginDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
