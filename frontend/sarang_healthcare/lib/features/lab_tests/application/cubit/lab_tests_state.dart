part of 'lab_tests_cubit.dart';

@freezed
class LabTestsState with _$LabTestsState {
  const factory LabTestsState.initial() = _Initial;
  const factory LabTestsState.loading() = _Loading;
  const factory LabTestsState.loadedNetwork(
      {required List<LabTestsModel> apiData}) = _LoadedNetwork;
  const factory LabTestsState.loadFailure({required String message}) =
      _LoadFailure;
}
