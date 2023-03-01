part of 'lab_testing_cubit.dart';

@freezed
class LabTestingState with _$LabTestingState {
  const factory LabTestingState.initial() = _Initial;
  const factory LabTestingState.loading() = _Loading;
  const factory LabTestingState.succeeded({required String message}) =
      _Succeeded;
  const factory LabTestingState.unsucceeded({required String message}) =
      _Unsucceeded;
}
