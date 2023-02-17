part of 'preferred_doctor_cubit.dart';

@freezed
class PreferredDoctorState with _$PreferredDoctorState {
  const factory PreferredDoctorState.initial() = _Initial;
  const factory PreferredDoctorState.loading() = _Loading;
  const factory PreferredDoctorState.loadedNetwork(
      {required List<PreferredDoctorModel> apiData}) = _LoadedNetwork;
  const factory PreferredDoctorState.notLoaded({required String message}) =
      _NotLoaded;
  const factory PreferredDoctorState.loadFailure({required String message}) =
      _LoadFailure;
}


