
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_model.freezed.dart';

@freezed
class ReportModel with _$ReportModel {
  const factory ReportModel({
    required int id,
    required String userId,
    required String report,
    required String remarks,
  }) = _ReportModel;
}