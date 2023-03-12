// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReportModel {
  int get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get report => throw _privateConstructorUsedError;
  String get remarks => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReportModelCopyWith<ReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportModelCopyWith<$Res> {
  factory $ReportModelCopyWith(
          ReportModel value, $Res Function(ReportModel) then) =
      _$ReportModelCopyWithImpl<$Res, ReportModel>;
  @useResult
  $Res call({int id, String userId, String report, String remarks});
}

/// @nodoc
class _$ReportModelCopyWithImpl<$Res, $Val extends ReportModel>
    implements $ReportModelCopyWith<$Res> {
  _$ReportModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_ReportModelCopyWith<$Res>
    implements $ReportModelCopyWith<$Res> {
  factory _$$_ReportModelCopyWith(
          _$_ReportModel value, $Res Function(_$_ReportModel) then) =
      __$$_ReportModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String userId, String report, String remarks});
}

/// @nodoc
class __$$_ReportModelCopyWithImpl<$Res>
    extends _$ReportModelCopyWithImpl<$Res, _$_ReportModel>
    implements _$$_ReportModelCopyWith<$Res> {
  __$$_ReportModelCopyWithImpl(
      _$_ReportModel _value, $Res Function(_$_ReportModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? report = null,
    Object? remarks = null,
  }) {
    return _then(_$_ReportModel(
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

class _$_ReportModel with DiagnosticableTreeMixin implements _ReportModel {
  const _$_ReportModel(
      {required this.id,
      required this.userId,
      required this.report,
      required this.remarks});

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
    return 'ReportModel(id: $id, userId: $userId, report: $report, remarks: $remarks)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReportModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('report', report))
      ..add(DiagnosticsProperty('remarks', remarks));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.report, report) || other.report == report) &&
            (identical(other.remarks, remarks) || other.remarks == remarks));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, userId, report, remarks);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReportModelCopyWith<_$_ReportModel> get copyWith =>
      __$$_ReportModelCopyWithImpl<_$_ReportModel>(this, _$identity);
}

abstract class _ReportModel implements ReportModel {
  const factory _ReportModel(
      {required final int id,
      required final String userId,
      required final String report,
      required final String remarks}) = _$_ReportModel;

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
  _$$_ReportModelCopyWith<_$_ReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}
