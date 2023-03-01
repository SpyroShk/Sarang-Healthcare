part of 'lab_testing_list_cubit.dart';

@freezed
class LabTestingListState with _$LabTestingListState {
  const factory LabTestingListState.initial() = _Initial;
  const factory LabTestingListState.loading() = _Loading;
  const factory LabTestingListState.loadedNetwork(
      {required List<LabTestingListModel> apiData}) = _LoadedNetwork;
  const factory LabTestingListState.loadFailure({required String message}) =
      _LoadFailure;}
