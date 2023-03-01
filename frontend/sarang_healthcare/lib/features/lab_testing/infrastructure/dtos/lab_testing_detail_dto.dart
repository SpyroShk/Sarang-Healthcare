import 'package:freezed_annotation/freezed_annotation.dart';

part 'lab_testing_detail_dto.freezed.dart';
part 'lab_testing_detail_dto.g.dart';

@freezed
class LabTestingDetailDto with _$LabTestingDetailDto {
  const factory LabTestingDetailDto({
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
  }) = _LabTestingDetailDto;

  factory LabTestingDetailDto.fromJson(Map<String, dynamic> json) =>
      _$LabTestingDetailDtoFromJson(json);
}
