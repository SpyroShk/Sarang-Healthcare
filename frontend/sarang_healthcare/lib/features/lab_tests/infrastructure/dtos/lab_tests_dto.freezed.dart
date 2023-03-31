// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lab_tests_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LabTestsDto _$LabTestsDtoFromJson(Map<String, dynamic> json) {
  return _LabTestsDto.fromJson(json);
}

/// @nodoc
mixin _$LabTestsDto {
  int get id => throw _privateConstructorUsedError;
  String get testName => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get testDescription => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LabTestsDtoCopyWith<LabTestsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LabTestsDtoCopyWith<$Res> {
  factory $LabTestsDtoCopyWith(
          LabTestsDto value, $Res Function(LabTestsDto) then) =
      _$LabTestsDtoCopyWithImpl<$Res, LabTestsDto>;
  @useResult
  $Res call({int id, String testName, String price, String testDescription});
}

/// @nodoc
class _$LabTestsDtoCopyWithImpl<$Res, $Val extends LabTestsDto>
    implements $LabTestsDtoCopyWith<$Res> {
  _$LabTestsDtoCopyWithImpl(this._value, this._then);

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
    Object? testDescription = null,
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
      testDescription: null == testDescription
          ? _value.testDescription
          : testDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LabTestsDtoCopyWith<$Res>
    implements $LabTestsDtoCopyWith<$Res> {
  factory _$$_LabTestsDtoCopyWith(
          _$_LabTestsDto value, $Res Function(_$_LabTestsDto) then) =
      __$$_LabTestsDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String testName, String price, String testDescription});
}

/// @nodoc
class __$$_LabTestsDtoCopyWithImpl<$Res>
    extends _$LabTestsDtoCopyWithImpl<$Res, _$_LabTestsDto>
    implements _$$_LabTestsDtoCopyWith<$Res> {
  __$$_LabTestsDtoCopyWithImpl(
      _$_LabTestsDto _value, $Res Function(_$_LabTestsDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? testName = null,
    Object? price = null,
    Object? testDescription = null,
  }) {
    return _then(_$_LabTestsDto(
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
      testDescription: null == testDescription
          ? _value.testDescription
          : testDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LabTestsDto with DiagnosticableTreeMixin implements _LabTestsDto {
  const _$_LabTestsDto(
      {required this.id,
      required this.testName,
      required this.price,
      required this.testDescription});

  factory _$_LabTestsDto.fromJson(Map<String, dynamic> json) =>
      _$$_LabTestsDtoFromJson(json);

  @override
  final int id;
  @override
  final String testName;
  @override
  final String price;
  @override
  final String testDescription;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LabTestsDto(id: $id, testName: $testName, price: $price, testDescription: $testDescription)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LabTestsDto'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('testName', testName))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('testDescription', testDescription));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LabTestsDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.testName, testName) ||
                other.testName == testName) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.testDescription, testDescription) ||
                other.testDescription == testDescription));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, testName, price, testDescription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LabTestsDtoCopyWith<_$_LabTestsDto> get copyWith =>
      __$$_LabTestsDtoCopyWithImpl<_$_LabTestsDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LabTestsDtoToJson(
      this,
    );
  }
}

abstract class _LabTestsDto implements LabTestsDto {
  const factory _LabTestsDto(
      {required final int id,
      required final String testName,
      required final String price,
      required final String testDescription}) = _$_LabTestsDto;

  factory _LabTestsDto.fromJson(Map<String, dynamic> json) =
      _$_LabTestsDto.fromJson;

  @override
  int get id;
  @override
  String get testName;
  @override
  String get price;
  @override
  String get testDescription;
  @override
  @JsonKey(ignore: true)
  _$$_LabTestsDtoCopyWith<_$_LabTestsDto> get copyWith =>
      throw _privateConstructorUsedError;
}
