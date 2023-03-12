part of 'report_cubit.dart';

@freezed
class ReportState with _$ReportState {
  const factory ReportState.initial() = _Initial;
  const factory ReportState.loading() = _Loading;
  const factory ReportState.loadedNetwork(
      {required List<ReportModel> apiData}) = _LoadedNetwork;
  const factory ReportState.loadFailure({required String message}) =
      _LoadFailure;
}
