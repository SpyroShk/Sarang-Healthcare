import 'package:freezed_annotation/freezed_annotation.dart'
    show JsonKey, freezed, useResult;

part 'lab_testing_detail.freezed.dart';

@freezed
class LabTestingDetail with _$LabTestingDetail {
  const factory LabTestingDetail({
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
  }) = _LabTestingDetail;
}
