import 'package:freezed_annotation/freezed_annotation.dart';

part 'lab_tests_failure.freezed.dart';

@freezed
class LabTestsFailure with _$LabTestsFailure {
  const factory LabTestsFailure.server() = _Server;
  const factory LabTestsFailure.storage() = _Storage;
  const factory LabTestsFailure.network() = _Network;
  const factory LabTestsFailure.client({required String message}) = _Client;
}
