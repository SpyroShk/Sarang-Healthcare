// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preferred_doctor_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PreferredDoctorDto _$PreferredDoctorDtoFromJson(Map<String, dynamic> json) {
  return _PreferredDoctorDto.fromJson(json);
}

/// @nodoc
mixin _$PreferredDoctorDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get qualifications => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PreferredDoctorDtoCopyWith<PreferredDoctorDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreferredDoctorDtoCopyWith<$Res> {
  factory $PreferredDoctorDtoCopyWith(
          PreferredDoctorDto value, $Res Function(PreferredDoctorDto) then) =
      _$PreferredDoctorDtoCopyWithImpl<$Res, PreferredDoctorDto>;
  @useResult
  $Res call(
      {int id,
      String name,
      String qualifications,
      String category,
      String image});
}

/// @nodoc
class _$PreferredDoctorDtoCopyWithImpl<$Res, $Val extends PreferredDoctorDto>
    implements $PreferredDoctorDtoCopyWith<$Res> {
  _$PreferredDoctorDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? qualifications = null,
    Object? category = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      qualifications: null == qualifications
          ? _value.qualifications
          : qualifications // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PreferredDoctorDtoCopyWith<$Res>
    implements $PreferredDoctorDtoCopyWith<$Res> {
  factory _$$_PreferredDoctorDtoCopyWith(_$_PreferredDoctorDto value,
          $Res Function(_$_PreferredDoctorDto) then) =
      __$$_PreferredDoctorDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String qualifications,
      String category,
      String image});
}

/// @nodoc
class __$$_PreferredDoctorDtoCopyWithImpl<$Res>
    extends _$PreferredDoctorDtoCopyWithImpl<$Res, _$_PreferredDoctorDto>
    implements _$$_PreferredDoctorDtoCopyWith<$Res> {
  __$$_PreferredDoctorDtoCopyWithImpl(
      _$_PreferredDoctorDto _value, $Res Function(_$_PreferredDoctorDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? qualifications = null,
    Object? category = null,
    Object? image = null,
  }) {
    return _then(_$_PreferredDoctorDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      qualifications: null == qualifications
          ? _value.qualifications
          : qualifications // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PreferredDoctorDto
    with DiagnosticableTreeMixin
    implements _PreferredDoctorDto {
  const _$_PreferredDoctorDto(
      {required this.id,
      required this.name,
      required this.qualifications,
      required this.category,
      required this.image});

  factory _$_PreferredDoctorDto.fromJson(Map<String, dynamic> json) =>
      _$$_PreferredDoctorDtoFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String qualifications;
  @override
  final String category;
  @override
  final String image;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PreferredDoctorDto(id: $id, name: $name, qualifications: $qualifications, category: $category, image: $image)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PreferredDoctorDto'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('qualifications', qualifications))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('image', image));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PreferredDoctorDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.qualifications, qualifications) ||
                other.qualifications == qualifications) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, qualifications, category, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PreferredDoctorDtoCopyWith<_$_PreferredDoctorDto> get copyWith =>
      __$$_PreferredDoctorDtoCopyWithImpl<_$_PreferredDoctorDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PreferredDoctorDtoToJson(
      this,
    );
  }
}

abstract class _PreferredDoctorDto implements PreferredDoctorDto {
  const factory _PreferredDoctorDto(
      {required final int id,
      required final String name,
      required final String qualifications,
      required final String category,
      required final String image}) = _$_PreferredDoctorDto;

  factory _PreferredDoctorDto.fromJson(Map<String, dynamic> json) =
      _$_PreferredDoctorDto.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get qualifications;
  @override
  String get category;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$_PreferredDoctorDtoCopyWith<_$_PreferredDoctorDto> get copyWith =>
      throw _privateConstructorUsedError;
}
