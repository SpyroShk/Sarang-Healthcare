import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sarang_healthcare/features/appointment_list/domain/appointment_list_model.dart';

part 'appointment_list_success.freezed.dart';

@freezed
class AppointmentListSuccess with _$AppointmentListSuccess {
  const factory AppointmentListSuccess.network({required List<AppointmentListModel> apiData}) =
      _Network;
}
