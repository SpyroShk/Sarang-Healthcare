part of 'doc_appointment_cubit.dart';

@freezed
class DocAppointmentState with _$DocAppointmentState {
  const factory DocAppointmentState.initial() = _Initial;
  const factory DocAppointmentState.loading() = _Loading;
  const factory DocAppointmentState.succeeded({required String message}) =
      _Succeeded;
  const factory DocAppointmentState.unsucceeded({required String message}) =
      _Unsucceeded;
}
