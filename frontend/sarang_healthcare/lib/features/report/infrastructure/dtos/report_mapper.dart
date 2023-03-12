import '../../domain/report_model.dart';
import 'report_dto.dart';

class ReportMapper {
  static ReportModel toReportDetail(
      ReportDto reportDto) {
    return ReportModel(
      id: reportDto.id,
      userId: reportDto.userId,
      report: reportDto.report,
      remarks: reportDto.remarks,
    );
  }

  static ReportDto toReportDetailDto(
      ReportModel reportModel) {
    return ReportDto(
      id: reportModel.id,
      userId: reportModel.userId,
      report: reportModel.report,
      remarks: reportModel.remarks,
    );
  }
}
