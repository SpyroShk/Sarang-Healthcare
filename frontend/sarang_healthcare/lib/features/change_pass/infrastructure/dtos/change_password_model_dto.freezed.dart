// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_password_model_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChangePasswordModelDto _$ChangePasswordModelDtoFromJson(
    Map<String, dynamic> json) {
  return _ChangePasswordModelDto.fromJson(json);
}

/// @nodoc
mixin _$ChangePasswordModelDto {
  String get old_password => throw _privateConstructorUsedError;
  String get new_password1 => throw _privateConstructorUsedError;
  String get new_password2 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChangePasswordModelDtoCopyWith<ChangePasswordModelDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangePasswordModelDtoCopyWith<$Res> {
  factory $ChangePasswordModelDtoCopyWith(ChangePasswordModelDto value,
          $Res Function(ChangePasswordModelDto) then) =
      _$ChangePasswordModelDtoCopyWithImpl<$Res, ChangePasswordModelDto>;
  @useResult
  $Res call({String old_password, String new_password1, String new_password2});
}

/// @nodoc
class _$ChangePasswordModelDtoCopyWithImpl<$Res,
        $Val extends ChangePasswordModelDto>
    implements $ChangePasswordModelDtoCopyWith<$Res> {
  _$ChangePasswordModelDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? old_password = null,
    Object? new_password1 = null,
    Object? new_password2 = null,
  }) {
    return _then(_value.copyWith(
      old_password: null == old_password
          ? _value.old_password
          : old_password // ignore: cast_nullable_to_non_nullable
              as String,
      new_password1: null == new_password1
          ? _value.new_password1
          : new_password1 // ignore: cast_nullable_to_non_nullable
              as String,
      new_password2: null == new_password2
          ? _value.new_password2
          : new_password2 // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChangePasswordModelDtoCopyWith<$Res>
    implements $ChangePasswordModelDtoCopyWith<$Res> {
  factory _$$_ChangePasswordModelDtoCopyWith(_$_ChangePasswordModelDto value,
          $Res Function(_$_ChangePasswordModelDto) then) =
      __$$_ChangePasswordModelDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String old_password, String new_password1, String new_password2});
}

/// @nodoc
class __$$_ChangePasswordModelDtoCopyWithImpl<$Res>
    extends _$ChangePasswordModelDtoCopyWithImpl<$Res,
        _$_ChangePasswordModelDto>
    implements _$$_ChangePasswordModelDtoCopyWith<$Res> {
  __$$_ChangePasswordModelDtoCopyWithImpl(_$_ChangePasswordModelDto _value,
      $Res Function(_$_ChangePasswordModelDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? old_password = null,
    Object? new_password1 = null,
    Object? new_password2 = null,
  }) {
    return _then(_$_ChangePasswordModelDto(
      old_password: null == old_password
          ? _value.old_password
          : old_password // ignore: cast_nullable_to_non_nullable
              as String,
      new_password1: null == new_password1
          ? _value.new_password1
          : new_password1 // ignore: cast_nullable_to_non_nullable
              as String,
      new_password2: null == new_password2
          ? _value.new_password2
          : new_password2 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChangePasswordModelDto implements _ChangePasswordModelDto {
  const _$_ChangePasswordModelDto(
      {required this.old_password,
      required this.new_password1,
      required this.new_password2});

  factory _$_ChangePasswordModelDto.fromJson(Map<String, dynamic> json) =>
      _$$_ChangePasswordModelDtoFromJson(json);

  @override
  final String old_password;
  @override
  final String new_password1;
  @override
  final String new_password2;

  @override
  String toString() {
    return 'ChangePasswordModelDto(old_password: $old_password, new_password1: $new_password1, new_password2: $new_password2)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangePasswordModelDto &&
            (identical(other.old_password, old_password) ||
                other.old_password == old_password) &&
            (identical(other.new_password1, new_password1) ||
                other.new_password1 == new_password1) &&
            (identical(other.new_password2, new_password2) ||
                other.new_password2 == new_password2));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, old_password, new_password1, new_password2);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangePasswordModelDtoCopyWith<_$_ChangePasswordModelDto> get copyWith =>
      __$$_ChangePasswordModelDtoCopyWithImpl<_$_ChangePasswordModelDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChangePasswordModelDtoToJson(
      this,
    );
  }
}

abstract class _ChangePasswordModelDto implements ChangePasswordModelDto {
  const factory _ChangePasswordModelDto(
      {required final String old_password,
      required final String new_password1,
      required final String new_password2}) = _$_ChangePasswordModelDto;

  factory _ChangePasswordModelDto.fromJson(Map<String, dynamic> json) =
      _$_ChangePasswordModelDto.fromJson;

  @override
  String get old_password;
  @override
  String get new_password1;
  @override
  String get new_password2;
  @override
  @JsonKey(ignore: true)
  _$$_ChangePasswordModelDtoCopyWith<_$_ChangePasswordModelDto> get copyWith =>
      throw _privateConstructorUsedError;
}
