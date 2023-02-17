import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sarang_healthcare/features/preferred_doctor/domain/preferred_doctor_model.dart';

part 'preferred_doctor_success.freezed.dart';

@freezed
class PreferredDoctorSuccess with _$PreferredDoctorSuccess {
  const factory PreferredDoctorSuccess.network({required List<PreferredDoctorModel> apiData}) =
      _Network;
}
