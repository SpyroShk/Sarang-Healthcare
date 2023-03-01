import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/lab_tests_failure.dart';
import '../../domain/lab_tests_model.dart';
import '../../domain/lab_tests_success.dart';
import '../../infrastructure/lab_tests_repository.dart';

part 'lab_tests_cubit.freezed.dart';
part 'lab_tests_state.dart';

class LabTestsCubit extends Cubit<LabTestsState> {
  final LabTestsRepository _labTestsRepository;

  LabTestsCubit(
      {required LabTestsRepository labTestsRepository})
      : _labTestsRepository = labTestsRepository,
        super(const LabTestsState.initial());

  Future<void> getLabTestsDetail() async {
    emit(const LabTestsState.loading());
    final response = await _labTestsRepository.labTests();
    _handleLabTestsResponse(response, []);
  }

  void _handleLabTestsResponse(
    Either<LabTestsFailure, LabTestsSuccess> response,
    List<LabTestsModel> labTests,
  ) {
    response.fold(
      (preferredDoctorFailure) {
        final message = _getErrorMessage(preferredDoctorFailure);
        emit(LabTestsState.loadFailure(message: message));
      },
      (preferredDoctorSuccess) {
        final apiData = _getApiDataFromSuccess(preferredDoctorSuccess);
        emit(LabTestsState.loadedNetwork(
            apiData: [...labTests, ...apiData]));
      },
    );
  }

  String _getErrorMessage(LabTestsFailure failure) {
    return failure.when(
      server: () => "Server error occurred. Please try again later.",
      storage: () => "Internal error occurred.",
      network: () => "Network error occurred.",
      client: (errMsg) => errMsg,
    );
  }

  List<LabTestsModel> _getApiDataFromSuccess(
      LabTestsSuccess success) {
    return success.when(
      network: (apiData) => apiData,
    );
  }

  // List<LabTestsModel> changeDoctor(String doctorCategory) {
  //   final List<LabTestsModel> labTests = state.when(
  //     initial: () => const [], //LabTestsState.initial(),
  //     loadedNetwork: (apiData) => apiData,
  //     loadFailure: (String message) => const [],
  //     loading: () => const [],
  //   );
  //   final filteredDoctor = labTests
  //       .where((doctor) => doctor.category == doctorCategory)
  //       .toList();
  //   return filteredDoctor;
  // }
}
