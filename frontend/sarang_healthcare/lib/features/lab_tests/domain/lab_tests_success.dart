import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sarang_healthcare/features/lab_tests/domain/lab_tests_model.dart';

part 'lab_tests_success.freezed.dart';

@freezed
class LabTestsSuccess with _$LabTestsSuccess {
  const factory LabTestsSuccess.network({required List<LabTestsModel> apiData}) =
      _Network;
}
