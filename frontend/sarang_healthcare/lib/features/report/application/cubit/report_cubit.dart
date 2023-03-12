import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/report_failure.dart';
import '../../domain/report_model.dart';
import '../../domain/report_success.dart';
import '../../infrastructure/report_repository.dart';

part 'report_cubit.freezed.dart';
part 'report_state.dart';

class ReportCubit extends Cubit<ReportState> {
  final ReportRepository _reportRepository;

  ReportCubit(
      {required ReportRepository reportRepository})
      : _reportRepository = reportRepository,
        super(const ReportState.initial());

  Future<void> getReportDetail() async {
    emit(const ReportState.loading());
    final response = await _reportRepository.report();
    _handleReportResponse(response, []);
  }

  void _handleReportResponse(
    Either<ReportFailure, ReportSuccess> response,
    List<ReportModel> reports,
  ) {
    response.fold(
      (reportFailure) {
        final message = _getErrorMessage(reportFailure);
        emit(ReportState.loadFailure(message: message));
      },
      (reportSuccess) {
        final apiData = _getApiDataFromSuccess(reportSuccess);
        emit(ReportState.loadedNetwork(
            apiData: [...reports, ...apiData]));
      },
    );
  }

  String _getErrorMessage(ReportFailure failure) {
    return failure.when(
      server: () => "Server error occurred. Please try again later.",
      storage: () => "Internal error occurred.",
      network: () => "Network error occurred.",
      client: (errMsg) => errMsg,
    );
  }

  List<ReportModel> _getApiDataFromSuccess(
      ReportSuccess success) {
    return success.when(
      network: (apiData) => apiData,
    );
  }

}
