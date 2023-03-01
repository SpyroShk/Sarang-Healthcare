import 'package:freezed_annotation/freezed_annotation.dart';

part 'lab_testing_failure.freezed.dart';

@freezed
class LabTestingFailure with _$LabTestingFailure {
  const factory LabTestingFailure.server() = _Server;
  const factory LabTestingFailure.storage() = _Storage;
  const factory LabTestingFailure.network() = _Network;
  const factory LabTestingFailure.client({required String message}) = _Client;
}
