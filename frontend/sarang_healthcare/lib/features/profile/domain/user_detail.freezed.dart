// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserDetail {
  int get pk => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserDetailCopyWith<UserDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDetailCopyWith<$Res> {
  factory $UserDetailCopyWith(
          UserDetail value, $Res Function(UserDetail) then) =
      _$UserDetailCopyWithImpl<$Res, UserDetail>;
  @useResult
  $Res call({int pk, String username, String email});
}

/// @nodoc
class _$UserDetailCopyWithImpl<$Res, $Val extends UserDetail>
    implements $UserDetailCopyWith<$Res> {
  _$UserDetailCopyWithImpl(this._value, this._then);

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
abstract class _$$_UserDetailCopyWith<$Res>
    implements $UserDetailCopyWith<$Res> {
  factory _$$_UserDetailCopyWith(
          _$_UserDetail value, $Res Function(_$_UserDetail) then) =
      __$$_UserDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int pk, String username, String email});
}

/// @nodoc
class __$$_UserDetailCopyWithImpl<$Res>
    extends _$UserDetailCopyWithImpl<$Res, _$_UserDetail>
    implements _$$_UserDetailCopyWith<$Res> {
  __$$_UserDetailCopyWithImpl(
      _$_UserDetail _value, $Res Function(_$_UserDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pk = null,
    Object? username = null,
    Object? email = null,
  }) {
    return _then(_$_UserDetail(
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

class _$_UserDetail implements _UserDetail {
  const _$_UserDetail(
      {required this.pk, required this.username, required this.email});

  @override
  final int pk;
  @override
  final String username;
  @override
  final String email;

  @override
  String toString() {
    return 'UserDetail(pk: $pk, username: $username, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserDetail &&
            (identical(other.pk, pk) || other.pk == pk) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pk, username, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserDetailCopyWith<_$_UserDetail> get copyWith =>
      __$$_UserDetailCopyWithImpl<_$_UserDetail>(this, _$identity);
}

abstract class _UserDetail implements UserDetail {
  const factory _UserDetail(
      {required final int pk,
      required final String username,
      required final String email}) = _$_UserDetail;

  @override
  int get pk;
  @override
  String get username;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$_UserDetailCopyWith<_$_UserDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
