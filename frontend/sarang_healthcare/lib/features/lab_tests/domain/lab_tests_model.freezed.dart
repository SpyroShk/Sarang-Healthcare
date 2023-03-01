// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lab_tests_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LabTestsModel {
  int get id => throw _privateConstructorUsedError;
  String get testName => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LabTestsModelCopyWith<LabTestsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LabTestsModelCopyWith<$Res> {
  factory $LabTestsModelCopyWith(
          LabTestsModel value, $Res Function(LabTestsModel) then) =
      _$LabTestsModelCopyWithImpl<$Res, LabTestsModel>;
  @useResult
  $Res call({int id, String testName, String price});
}

/// @nodoc
class _$LabTestsModelCopyWithImpl<$Res, $Val extends LabTestsModel>
    implements $LabTestsModelCopyWith<$Res> {
  _$LabTestsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? testName = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      testName: null == testName
          ? _value.testName
          : testName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LabTestsModelCopyWith<$Res>
    implements $LabTestsModelCopyWith<$Res> {
  factory _$$_LabTestsModelCopyWith(
          _$_LabTestsModel value, $Res Function(_$_LabTestsModel) then) =
      __$$_LabTestsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String testName, String price});
}

/// @nodoc
class __$$_LabTestsModelCopyWithImpl<$Res>
    extends _$LabTestsModelCopyWithImpl<$Res, _$_LabTestsModel>
    implements _$$_LabTestsModelCopyWith<$Res> {
  __$$_LabTestsModelCopyWithImpl(
      _$_LabTestsModel _value, $Res Function(_$_LabTestsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? testName = null,
    Object? price = null,
  }) {
    return _then(_$_LabTestsModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      testName: null == testName
          ? _value.testName
          : testName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LabTestsModel with DiagnosticableTreeMixin implements _LabTestsModel {
  const _$_LabTestsModel(
      {required this.id, required this.testName, required this.price});

  @override
  final int id;
  @override
  final String testName;
  @override
  final String price;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LabTestsModel(id: $id, testName: $testName, price: $price)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LabTestsModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('testName', testName))
      ..add(DiagnosticsProperty('price', price));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LabTestsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.testName, testName) ||
                other.testName == testName) &&
            (identical(other.price, price) || other.price == price));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, testName, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LabTestsModelCopyWith<_$_LabTestsModel> get copyWith =>
      __$$_LabTestsModelCopyWithImpl<_$_LabTestsModel>(this, _$identity);
}

abstract class _LabTestsModel implements LabTestsModel {
  const factory _LabTestsModel(
      {required final int id,
      required final String testName,
      required final String price}) = _$_LabTestsModel;

  @override
  int get id;
  @override
  String get testName;
  @override
  String get price;
  @override
  @JsonKey(ignore: true)
  _$$_LabTestsModelCopyWith<_$_LabTestsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
