import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lab_tests_model.freezed.dart';

@freezed
class LabTestsModel with _$LabTestsModel {
  const factory LabTestsModel({
    required int id,
    required String testName,
    required String price,
  }) = _LabTestsModel;
}
