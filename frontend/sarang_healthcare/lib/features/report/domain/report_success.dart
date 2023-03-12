import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sarang_healthcare/features/report/domain/report_model.dart';

part 'report_success.freezed.dart';

@freezed
class ReportSuccess with _$ReportSuccess {
  const factory ReportSuccess.network({required List<ReportModel> apiData}) =
      _Network;
}
