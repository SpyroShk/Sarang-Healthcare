// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preferred_doctor_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PreferredDoctorModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get qualifications => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PreferredDoctorModelCopyWith<PreferredDoctorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreferredDoctorModelCopyWith<$Res> {
  factory $PreferredDoctorModelCopyWith(PreferredDoctorModel value,
          $Res Function(PreferredDoctorModel) then) =
      _$PreferredDoctorModelCopyWithImpl<$Res, PreferredDoctorModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String qualifications,
      String category,
      String image});
}

/// @nodoc
class _$PreferredDoctorModelCopyWithImpl<$Res,
        $Val extends PreferredDoctorModel>
    implements $PreferredDoctorModelCopyWith<$Res> {
  _$PreferredDoctorModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_PreferredDoctorModelCopyWith<$Res>
    implements $PreferredDoctorModelCopyWith<$Res> {
  factory _$$_PreferredDoctorModelCopyWith(_$_PreferredDoctorModel value,
          $Res Function(_$_PreferredDoctorModel) then) =
      __$$_PreferredDoctorModelCopyWithImpl<$Res>;
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
class __$$_PreferredDoctorModelCopyWithImpl<$Res>
    extends _$PreferredDoctorModelCopyWithImpl<$Res, _$_PreferredDoctorModel>
    implements _$$_PreferredDoctorModelCopyWith<$Res> {
  __$$_PreferredDoctorModelCopyWithImpl(_$_PreferredDoctorModel _value,
      $Res Function(_$_PreferredDoctorModel) _then)
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
    return _then(_$_PreferredDoctorModel(
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

class _$_PreferredDoctorModel
    with DiagnosticableTreeMixin
    implements _PreferredDoctorModel {
  const _$_PreferredDoctorModel(
      {required this.id,
      required this.name,
      required this.qualifications,
      required this.category,
      required this.image});

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
    return 'PreferredDoctorModel(id: $id, name: $name, qualifications: $qualifications, category: $category, image: $image)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PreferredDoctorModel'))
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
            other is _$_PreferredDoctorModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.qualifications, qualifications) ||
                other.qualifications == qualifications) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, qualifications, category, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PreferredDoctorModelCopyWith<_$_PreferredDoctorModel> get copyWith =>
      __$$_PreferredDoctorModelCopyWithImpl<_$_PreferredDoctorModel>(
          this, _$identity);
}

abstract class _PreferredDoctorModel implements PreferredDoctorModel {
  const factory _PreferredDoctorModel(
      {required final int id,
      required final String name,
      required final String qualifications,
      required final String category,
      required final String image}) = _$_PreferredDoctorModel;

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
  _$$_PreferredDoctorModelCopyWith<_$_PreferredDoctorModel> get copyWith =>
      throw _privateConstructorUsedError;
}
