
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_dto.freezed.dart';
part 'report_dto.g.dart';

@freezed
class ReportDto with _$ReportDto {
  const factory ReportDto({
    required int id,
    required String userId,
    required String report,
    required String remarks,
  }) = _ReportDto;

  factory ReportDto.fromJson(Map<String, dynamic> json) =>
      _$ReportDtoFromJson(json);
}