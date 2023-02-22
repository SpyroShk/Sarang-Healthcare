part of 'appointment_list_cubit.dart';

@freezed
class AppointmentListState with _$AppointmentListState {
  const factory AppointmentListState.initial() = _Initial;
  const factory AppointmentListState.loading() = _Loading;
  const factory AppointmentListState.loadedNetwork(
      {required List<AppointmentListModel> apiData}) = _LoadedNetwork;
  const factory AppointmentListState.loadFailure({required String message}) =
      _LoadFailure;
}
