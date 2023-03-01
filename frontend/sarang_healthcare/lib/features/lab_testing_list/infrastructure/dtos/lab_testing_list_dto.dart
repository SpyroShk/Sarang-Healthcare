import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lab_testing_list_dto.freezed.dart';
part 'lab_testing_list_dto.g.dart';

@freezed
class LabTestingListDto with _$LabTestingListDto {
  const factory LabTestingListDto({
    required int id,
    required String userId,
    required String username,
    required String testList,
    required String collectionDate,
    required String collectionTime,
    required int contact,
    required String patientName,
    required int age,
    required String gender,
    required String userPatientRelation,
    required String service,
    required String city,
    required String address,
    required String landmark,
  }) = _LabTestingListDto;

  factory LabTestingListDto.fromJson(Map<String, dynamic> json) =>
      _$LabTestingListDtoFromJson(json);
}