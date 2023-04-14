import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/lab_testing_list_failure.dart';
import '../../domain/lab_testing_list_model.dart';
import '../../domain/lab_testing_list_success.dart';
import '../../infrastructure/lab_testing_list_repository.dart';

part 'lab_testing_list_cubit.freezed.dart';
part 'lab_testing_list_state.dart';

class LabTestingListCubit extends Cubit<LabTestingListState> {
  final LabTestingListRepository _labTestingListRepository;

  LabTestingListCubit(
      {required LabTestingListRepository labTestingListRepository})
      : _labTestingListRepository = labTestingListRepository,
        super(const LabTestingListState.initial());

  Future<void> getLabTestingListDetail() async {
    emit(const LabTestingListState.loading());
    final response = await _labTestingListRepository.labTestingList();
    _handleLabTestingListResponse(response, []);
  }

  Future<void> getLabTestingListWithoutIdDetail() async {
    emit(const LabTestingListState.loading());
    final response = await _labTestingListRepository.labTestingListWithoutId();
    _handleLabTestingListResponse(response, []);
  }

  void _handleLabTestingListResponse(
    Either<LabTestingListFailure, LabTestingListSuccess> response,
    List<LabTestingListModel> labTestingLists,
  ) {
    response.fold(
      (labTestingListFailure) {
        final message = _getErrorMessage(labTestingListFailure);
        emit(LabTestingListState.loadFailure(message: message));
      },
      (labTestingListSuccess) {
        final apiData = _getApiDataFromSuccess(labTestingListSuccess);
        emit(LabTestingListState.loadedNetwork(
            apiData: [...labTestingLists, ...apiData]));
      },
    );
  }

  String _getErrorMessage(LabTestingListFailure failure) {
    return failure.when(
      server: () => "Server error occurred. Please try again later.",
      storage: () => "Internal error occurred.",
      network: () => "Network error occurred.",
      client: (errMsg) => errMsg,
    );
  }

  List<LabTestingListModel> _getApiDataFromSuccess(
      LabTestingListSuccess success) {
    return success.when(
      network: (apiData) => apiData,
    );
  }

  // List<LabTestingListModel> getLabTestingsListWithoutIdDetail() {
  //   final List<LabTestingListModel> labTestingListWithoutId = state.maybeWhen(
  //       loadedNetwork: (apiData) => apiData, orElse: () => const []);
  //   return labTestingListWithoutId;
  // }
}
