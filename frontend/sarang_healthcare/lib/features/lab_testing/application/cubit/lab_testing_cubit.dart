import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/lab_testing_detail.dart';
import '../../infrastructure/lab_testing_repository.dart';

part 'lab_testing_state.dart';
part 'lab_testing_cubit.freezed.dart';

class LabTestingCubit extends Cubit<LabTestingState> {
  LabTestingCubit({required LabTestingRepository labTestingRepository})
      : _labTestingRepository = labTestingRepository,
        super(const LabTestingState.initial());
  final LabTestingRepository _labTestingRepository;

  void labTesting({
    required String userId,
    required String username,
    required String testList,
    required String collectionDate,
    required String collectionTime,
    required int contact,
    required String patientName,
    required int age,
    required String gender,
    required String userPatientRelation,
    required String service,
    required String city,
    required String address,
    required String landmark,
  }) async {
    emit(const LabTestingState.loading());

    final labTestingDetail = LabTestingDetail(
      username: username,
      userId: userId,
      age: age,
      collectionDate: collectionDate,
      collectionTime: collectionTime,
      contact: contact,
      testList: testList,
      gender: gender,
      patientName: patientName,
      userPatientRelation: userPatientRelation,
      service: service,
      city: city,
      address: address,
      landmark: landmark,
    );
    final response = await _labTestingRepository.labTesting(
        labTestingDetail: labTestingDetail);

    response.fold(
      (labTestingFailure) {
        String message = "";

        labTestingFailure.when(
          server: () =>
              message = "Server error occured. Please try again later.",
          storage: () => message = "Internal error occured.",
          network: () => message = "Network error occured.",
          client: (errMsg) => message = errMsg,
        );
        emit(LabTestingState.unsucceeded(message: message));
      },
      (_) {
        emit(
          const LabTestingState.succeeded(
              message: "Appointment booked sucessfully."),
        );
      },
    );
  }
}
