import 'package:freezed_annotation/freezed_annotation.dart';

part 'lab_testing_list_failure.freezed.dart';

@freezed
class LabTestingListFailure with _$LabTestingListFailure {
  const factory LabTestingListFailure.server() = _Server;
  const factory LabTestingListFailure.storage() = _Storage;
  const factory LabTestingListFailure.network() = _Network;
  const factory LabTestingListFailure.client({required String message}) = _Client;
}
