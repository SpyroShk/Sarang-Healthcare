import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_failure.freezed.dart';

@freezed
class ReportFailure with _$ReportFailure {
  const factory ReportFailure.server() = _Server;
  const factory ReportFailure.storage() = _Storage;
  const factory ReportFailure.network() = _Network;
  const factory ReportFailure.client({required String message}) = _Client;
}
