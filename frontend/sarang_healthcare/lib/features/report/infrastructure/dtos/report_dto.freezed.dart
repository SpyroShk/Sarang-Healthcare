// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReportDto _$ReportDtoFromJson(Map<String, dynamic> json) {
  return _ReportDto.fromJson(json);
}

/// @nodoc
mixin _$ReportDto {
  int get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get report => throw _privateConstructorUsedError;
  String get remarks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportDtoCopyWith<ReportDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportDtoCopyWith<$Res> {
  factory $ReportDtoCopyWith(ReportDto value, $Res Function(ReportDto) then) =
      _$ReportDtoCopyWithImpl<$Res, ReportDto>;
  @useResult
  $Res call({int id, String userId, String report, String remarks});
}

/// @nodoc
class _$ReportDtoCopyWithImpl<$Res, $Val extends ReportDto>
    implements $ReportDtoCopyWith<$Res> {
  _$ReportDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? report = null,
    Object? remarks = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      report: null == report
          ? _value.report
          : report // ignore: cast_nullable_to_non_nullable
              as String,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReportDtoCopyWith<$Res> implements $ReportDtoCopyWith<$Res> {
  factory _$$_ReportDtoCopyWith(
          _$_ReportDto value, $Res Function(_$_ReportDto) then) =
      __$$_ReportDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String userId, String report, String remarks});
}

/// @nodoc
class __$$_ReportDtoCopyWithImpl<$Res>
    extends _$ReportDtoCopyWithImpl<$Res, _$_ReportDto>
    implements _$$_ReportDtoCopyWith<$Res> {
  __$$_ReportDtoCopyWithImpl(
      _$_ReportDto _value, $Res Function(_$_ReportDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? report = null,
    Object? remarks = null,
  }) {
    return _then(_$_ReportDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      report: null == report
          ? _value.report
          : report // ignore: cast_nullable_to_non_nullable
              as String,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReportDto with DiagnosticableTreeMixin implements _ReportDto {
  const _$_ReportDto(
      {required this.id,
      required this.userId,
      required this.report,
      required this.remarks});

  factory _$_ReportDto.fromJson(Map<String, dynamic> json) =>
      _$$_ReportDtoFromJson(json);

  @override
  final int id;
  @override
  final String userId;
  @override
  final String report;
  @override
  final String remarks;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReportDto(id: $id, userId: $userId, report: $report, remarks: $remarks)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReportDto'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('report', report))
      ..add(DiagnosticsProperty('remarks', remarks));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.report, report) || other.report == report) &&
            (identical(other.remarks, remarks) || other.remarks == remarks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, report, remarks);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReportDtoCopyWith<_$_ReportDto> get copyWith =>
      __$$_ReportDtoCopyWithImpl<_$_ReportDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReportDtoToJson(
      this,
    );
  }
}

abstract class _ReportDto implements ReportDto {
  const factory _ReportDto(
      {required final int id,
      required final String userId,
      required final String report,
      required final String remarks}) = _$_ReportDto;

  factory _ReportDto.fromJson(Map<String, dynamic> json) =
      _$_ReportDto.fromJson;

  @override
  int get id;
  @override
  String get userId;
  @override
  String get report;
  @override
  String get remarks;
  @override
  @JsonKey(ignore: true)
  _$$_ReportDtoCopyWith<_$_ReportDto> get copyWith =>
      throw _privateConstructorUsedError;
}
