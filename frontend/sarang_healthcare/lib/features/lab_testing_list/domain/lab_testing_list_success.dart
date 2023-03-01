import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sarang_healthcare/features/lab_testing_list/domain/lab_testing_list_model.dart';

part 'lab_testing_list_success.freezed.dart';

@freezed
class LabTestingListSuccess with _$LabTestingListSuccess {
  const factory LabTestingListSuccess.network({required List<LabTestingListModel> apiData}) =
      _Network;
}
