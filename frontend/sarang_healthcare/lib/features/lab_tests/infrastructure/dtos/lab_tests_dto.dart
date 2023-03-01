import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'lab_tests_dto.freezed.dart';
part 'lab_tests_dto.g.dart';

@freezed
class LabTestsDto with _$LabTestsDto {
  const factory LabTestsDto({
    required int id,
    required String testName,
    required String price,
  }) = _LabTestsDto;

  factory LabTestsDto.fromJson(Map<String, dynamic> json) =>
      _$LabTestsDtoFromJson(json);

}
